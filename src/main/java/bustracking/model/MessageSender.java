
package bustracking.model;

import java.awt.List;
import java.net.*;
import java.util.Locale;
import java.util.Map;

import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;
import org.apache.http.params.HttpParams;

public class MessageSender {

        public static void sendMessage(String recipient,String Message) {
                try {
                        
                       //String username = "apitbpdemo";
                       // String password = "del12345@12";
                       

                       String username = "info@holycrossengineeringcollege.com";
                       String password = "tSE4A7qY";
                	
                        System.out.print(username);
                        System.out.println(password);
                        System.out.println(recipient);
                        System.out.println(Message);
                        Message=Message.replace(" ", "+");
                       // String requestUrl  = "http://203.212.70.200/smpp/sendsms?username="+username+"&password="+password+"&to="+recipient+"&from=track&text="+Message+"";

                        String requestUrl="http://api.cutesms.in/sms.aspx?a=submit&un="+username+"&pw="+password+"&to="+recipient+"&msg="+Message+"";
                        
                        
                        URL url = new URL(requestUrl);
                   
                        
                        HttpURLConnection uc = (HttpURLConnection)url.openConnection();

                        System.out.println(uc.getResponseMessage());

                        uc.disconnect();

                } catch(Exception ex) {
                        System.out.println(ex.getMessage());

                }
        }
        
        public static void sendMessage1(String recipient,String Message, String Myid) {
            try {
                    
                    String username = "apitbpdemo";
                    String password = "del12345@12";
                   
                    System.out.print(username);
                    System.out.println(password);
                    System.out.println(recipient);
                    System.out.println(Message);
                    System.out.println(Myid);
                    
                    Message=Message.replace(" ", "%20");
                    System.out.println("Message Sending!!!");
                   // String requestUrl  = "http://203.212.70.200/smpp/sendsms?username="+username+"&password="+password+"&to="+recipient+"&from=track&text="+Message+"";
                   String requestUrl1="http://203.212.70.200/smpp/sendsms?username="+username+"&password="+password+"&to="+recipient+"&from=track&text="+Message+"&udh=&dlr-mask=19&dlr-url=http://118.95.103.206:8080/BusTrackingApp/deviceregistration?myid="+Myid+"&status=%25d&updated_on=%25t&res=%252";
                
                   
                   URL url1=new URL(requestUrl1);
                
               
                  
                   
                   
                /* 
                   //Open the url
                   System.out.println("Open the URL!!!");
                    URLConnection urlConnection=url1.openConnection();
                    Map<String,java.util.List<String>> map=urlConnection.getHeaderFields();
                    urlConnection.
                    
                    
                    //Display values
                    System.out.println("Display the return values!!!");
                    for (Map.Entry<String, java.util.List<String>> entry : map.entrySet()) {
                		System.out.println("Key : " + entry.getKey() + " ,Value : " + entry.getValue());
                	}
 
                    */
                    
                    System.out.println(requestUrl1);
                    
                    HttpURLConnection uc = (HttpURLConnection)url1.openConnection();

                    System.out.println("Status"+uc.getHeaderField("status"));

                    uc.disconnect();

            } catch(Exception ex) {
                    System.out.println(ex.getMessage());

            }
    }

}