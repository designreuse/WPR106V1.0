package bustracking.model;

import java.io.IOException;  
import java.util.logging.FileHandler;  
import java.util.logging.Level;  
import java.util.logging.Logger;  
import java.util.logging.SimpleFormatter;  

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.util.TimeZone;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.net.*;
import java.lang.*;

/**
 * TCP Server Socket Implementation
 */
public class Track{
  private String tkModemID = null;
  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  static final String DB_URL = "jdbc:mysql://localhost:3306/bus_track";

  static final String USER = "root";
  static final String PASS = "";
static final Logger logger=Logger.getLogger("Mylog");
  public static void main(String[] args) throws Exception
   {
    
FileHandler fh;  
    try
    {
            fh = new FileHandler("D:\\GPS_Try\\Test_Server\\log\\MyLogFile.log");  
            logger.addHandler(fh);  
            SimpleFormatter formatter = new SimpleFormatter();  
            fh.setFormatter(formatter);  
            logger.info("Start Server...");  
    }
    catch(SecurityException e)
    {
      logger.info(e.toString());
    }
    catch(IOException e)
    {
      logger.info(e.toString());
    }





    DataInputStream is;
    DataOutputStream os;
    int port = 9000;

    ServerSocket serverSocket = new ServerSocket(port);

    logger.info("Server Socket is Running...");
    logger.info("Server is waiting for Connections");

    Socket clientSocket = serverSocket.accept();
    clientSocket.getInetAddress().isReachable(30);
    clientSocket.setSoTimeout(60);

    is = new DataInputStream(new BufferedInputStream(
        clientSocket.getInputStream()));
    os = new DataOutputStream(new BufferedOutputStream(
        clientSocket.getOutputStream()));
    

    // Running continuously in-order to process Client Request
    while (true) {
      // Fetches the Client request
      byte[] byteData = receiveData(is);
      String clientRequestMessage = new String(byteData).trim();
      TimeZone.setDefault(TimeZone.getTimeZone("IST"));
      Date date = new Date();

      System.out.print(date.toString());
      System.out.print("Received Message = " + clientRequestMessage);

      // Processing Client request
      String clientData = doProcess(clientRequestMessage, os);

      // Sending Response to Client
      sendData(os, clientData.getBytes());
      logger.info("Response Message sent to Client = "
          + clientData);
    }

  }

  /**
   * Add you processing the request
   * 
   */
  public static String doProcess(String message, DataOutputStream os) {
    logger.info("Processing the Client Request...");
    if (message.startsWith("##")) {
      /*
       * Date date = new Date(System.currentTimeMillis()); return
       * date.toString();
       */
      return "LOAD";
    }
    if((!message.startsWith("##"))&&(!message.startsWith("imei")))
    {
       return "ON";
    }

    else {
      parseInsertRecord(message, os);
      return "LOAD";
    }

  }

  /**
   * Method receives the Client Request
   */
  public static byte[] receiveData(DataInputStream is) throws Exception {
    try {
      byte[] inputData = new byte[1024];
      is.read(inputData);
      return inputData;
    } catch (Exception exception) {
      throw exception;
    }
  }

  /**
   * Method used to Send Response to Client
   */
  public static synchronized void sendData(DataOutputStream os,
      byte[] byteData) {
    if (byteData == null) {
      return;
    }
    try {
      os.write(byteData);
      os.flush();
    } catch (Exception exception) {
    }
  }

  // Parsing the incoming data
  private static void parseInsertRecord(String s, DataOutputStream os) // handleCommon
  {
    double KILOMETERS_PER_KNOT = 1.85200000;
    double MINIMUM_SPEED_KPH = 2.0;
    logger.info("Parsing.....");
    /* pre-validate */
    
    try {
if (s == null) {
      logger.info("Incoming data is null");
    }
    else
    {
      s = s.replace(";", "");

      // Split the incoming data
      String fld[] = s.split(",");

      /* parse the fields */
      if (fld[1].equals("help me")) {
        insert_database(fld[0].substring("imei:".length()).trim(),"Help me SOS Alert");
        logger.info("Alert!! Signal");
      } else if (fld[1].equals("low battery")) {
        insert_database(fld[0].substring("imei:".length()).trim(),"Low Battery");
        logger.info("Low Battery!!!!");
      } else if (fld[1].equals("stockade")) {
        insert_database(fld[0].substring("imei:".length()).trim(),"Geo Fence area alert");
        logger.info("Geo Fence Location alarm!!!");
      } else if (fld[1].equals("move")) {
         insert_database(fld[0].substring("imei:".length()).trim(),"Movement alert");
        logger.info("Movement alarm!!!");
      } else if (fld[1].equals("speed")) {
         insert_database(fld[0].substring("imei:".length()).trim(),"Over speed");
        logger.info("Over Speed alarm");
      } else if (fld[1].equals("tracker")) {
        if (fld[2].equals("000000000")) {
           insert_database(fld[0].substring("imei:".length()).trim(),"No Gps Signal");
          logger.info("No GPS Signal!!!!");
        }
        else{
          String IMEI = "";
          logger.info("fld[0]:" + fld[0]);
          if (fld == null) {
            logger.info("Fields are null");
          }
          else if (fld.length < 12) {
            logger.info("Invalid number of fields: "+ fld.length);
            sendData(os, "LOAD".getBytes());
            // return null;
          }
          else if (fld[0].startsWith("imei:")) {
            logger.info("IMEI:"+ fld[0].substring("imei:".length()).trim());
            IMEI = fld[0].substring("imei:".length()).trim();
            boolean validGPS = fld[6].equalsIgnoreCase("A");
            double latitude = validGPS ? _parseLatitude(fld[7],
                fld[8]) : 0.0;
            double longitude = validGPS ? _parseLongitude(fld[9],
                fld[10]) : 0.0;
            logger.info("latitude:" + latitude);
            logger.info("longitude:" + longitude);

            Double doub = new Double(-1.0);
            double knots = (validGPS && (fld.length > 11)) ? doub
                .parseDouble(fld[11]) : -1.0;
            logger.info("Knots:" + knots);
            logger.info("speed:" + fld[12]);
            double headingDeg = (validGPS && (fld.length > 12)) ? doub
                .parseDouble(fld[12]) : -1.0;

            double speedKPH = (knots >= 0.0) ? (knots * KILOMETERS_PER_KNOT)
                : -1.0;

            if (speedKPH < MINIMUM_SPEED_KPH) {
              logger.info("Actual Speed: " + speedKPH);
              speedKPH = 0.0;
              headingDeg = 0.0;
            } else if (headingDeg < 0.0) {
              headingDeg = 0.0; // <== leave as '-1'
            }
            logger.info("speedKPH:" + speedKPH);
            logger.info("headingDeg:" + headingDeg);
           // database(IMEI, latitude, longitude, speedKPH);
            double altitudeM = 0.0;
            double odomKM = 0.0;
            double batteryV = 0.0;
            long gpsAge = 0L;
            double HDOP = 0.0;
            int numSats = 0;
            /* GPIO input */
            long gpioInput = -1L;
          } else {
            sendData(os, "ON".getBytes());
          }

        }
      }
    }
    } catch (Exception ex) {
      logger.info(ex.toString());
    }

  }

  private static double _parseLatitude(String s, String d) {
    Double doub = new Double("99999.0");

    // returns the double value represented by the string argument
    double _lat = doub.parseDouble(s);
    if (_lat < 99999.0) {
      double lat = (double) ((long) _lat / 100L); // _lat is always
                            // positive here
      lat += (_lat - (lat * 100.0)) / 60.0;
      return d.equals("S") ? -lat : lat;
    } else {
      return 90.0; // invalid latitude
    }
  }

  private static double _parseLongitude(String s, String d) {
    Double doub = new Double("99999.0");

    // returns the double value represented by the string argument
    double _lon = doub.parseDouble(s);

    if (_lon < 99999.0) {
      double lon = (double) ((long) _lon / 100L); // _lon is always
                            // positive here
      lon += (_lon - (lon * 100.0)) / 60.0;
      return d.equals("W") ? -lon : lon;
    } else {
      return 180.0; // invalid longitude
    }
  }

  // Address

  // End Address

  public static void insert_database(String imei,String status) {
    Connection conn = null;
    Statement stmt = null;
    try {
      // STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      // STEP 3: Open a connection
      logger.info("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      // STEP 4: Execute a query
     
      stmt = conn.createStatement();
       String sql;
        SimpleDateFormat sdf = new SimpleDateFormat(
            "yyyy-MM-dd hh:mm:ss");
        TimeZone.setDefault(TimeZone.getTimeZone("IST"));
        Date date = new Date();

          sql = "Insert into tbl_device_status values('"+imei+"','"+status+"','"+sdf.format(date)+"')";
          stmt.execute(sql);

    
      stmt.close();
      conn.close();
    } catch (SQLException se) {
      // Handle errors for JDBC
      se.printStackTrace();
    } catch (Exception e) {
      // Handle errors for Class.forName
      e.printStackTrace();
    } finally {
      // finally block used to close resources
      try {
        if (stmt != null)
          stmt.close();
      } catch (SQLException se2) {
      }// nothing we can do
      try {
        if (conn != null)
          conn.close();
      } catch (SQLException se) {
        se.printStackTrace();
      }// end finally try
    }// end try
    
  }

}