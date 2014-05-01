package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;
import org.joda.time.ReadablePartial;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;

import bustracking.model.MessageSender;

//import bustracking.model.GPSRegistration;

public class MessageSending {

	private DataSource dataSource;

	private int time_before=10;
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@SuppressWarnings("static-access")
	public int collectinfo() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Double doub = new Double("99999.0");
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			int message_count = 0;
			boolean pick=false,drop=false;
			int success = 0;
			String org_id, bus_id, pickup_start = "00:00:00", pickup_end = "00:00:00", drop_start = "00:00:00", drop_end = "00:00:00";
			double last_lat, last_long, stop_lat, stop_long, speed;
			String device_id;
			System.out.println("get latest lat_long");
			
			String cmd_get_last = "select t1.*,t2.* from tbl_tracking_info as t1 join tbl_org_business_rule as t2 on t1.org_id=t2.org_id where t1.time_stamp=(select max(time_stamp) from tbl_tracking_info)";
			resultSet = statement.executeQuery(cmd_get_last);
			resultSet.next();
			time_before=Integer.parseInt(resultSet.getString("time_before"));
			org_id = resultSet.getString("org_id");
			device_id = resultSet.getString("device_id");
			bus_id = resultSet.getString("route_id");
			last_lat = doub.parseDouble(resultSet.getString("latitude"));
			last_long = doub.parseDouble(resultSet.getString("langitude"));
			speed = doub.parseDouble(resultSet.getString("speed_kph"));
			pickup_start = resultSet.getString("pickup_start_time");
			pickup_end = resultSet.getString("pickup_end_time");
			drop_start = resultSet.getString("drop_start_time");
			drop_end = resultSet.getString("drop_end_time");
			

			resultSet.close();
			DateTimeFormatter formatter = DateTimeFormat.forPattern("HH:mm:ss");

			DateTimeFormatter formatter_dt = DateTimeFormat
					.forPattern("yyyy-mm-dd hh:mm");

			// check rules
			DateTime date = new DateTime();

			DateTime dt_pickup_start = formatter.parseDateTime(pickup_start);
			DateTime dt_pickup_stop = formatter.parseDateTime(pickup_end);
			DateTime dt_drop_start = formatter.parseDateTime(drop_start);
			DateTime dt_drop_end = formatter.parseDateTime(drop_end);

			System.out.println(dt_pickup_start.toLocalTime().toString(
					"HH:mm:ss"));
			System.out.println(dt_pickup_stop.toLocalTime()
					.toString("HH:mm:ss"));
			System.out
					.println(dt_drop_start.toLocalTime().toString("HH:mm:ss"));
			System.out.println(dt_drop_end.toLocalTime().toString("HH:mm:ss"));

			System.out.println(date.toString());
			LocalTime localTime = new LocalTime();
			LocalDate localDate = new LocalDate();
			System.out.println(localTime.toString("HH:mm:ss"));

			// if(localTime.isAfter(partial))

			String cmd_route_lat_long = "select * from tbl_route where stop_id='S1' and bus_id='"+bus_id+"'";
			resultSet = statement.executeQuery(cmd_route_lat_long);
			while(resultSet.next())
			{
			stop_lat = doub.parseDouble(resultSet.getString("stop_latitude"));
			stop_long = doub.parseDouble(resultSet.getString("stop_longitude"));
			//resultSet.close();
			
	
			
			if (localTime.isAfter(dt_pickup_start.toLocalTime()) && localTime
					.isBefore(dt_pickup_stop.toLocalTime()))
					{
				pick=true;
					}
			if(localTime.isAfter(dt_drop_start.toLocalTime()) && localTime
					.isBefore(dt_drop_end.toLocalTime()))
					{
				drop=true;
					}
				
			
			if (pick==true)
			{
				String cmd_message_limit_check = "select * from tbl_message_control where device_id='"+ device_id + "' and pick_or_drop='pick' and time_stamp='"+localDate+"'";
				resultSet = statement.executeQuery(cmd_message_limit_check);
				
				if(!resultSet.next())
				{
					System.out.println("Yes morning time we have to send message today");
					distance(last_lat, stop_lat, last_long, stop_long,
							20, device_id,"pick",bus_id);
				}
			}
			if(drop==true)
			{
				String cmd_message_limit_check = "select * from tbl_message_control where device_id='"+ device_id + "' and pick_or_drop='drop' and time_stamp='"+localDate+"'";
				resultSet = statement.executeQuery(cmd_message_limit_check);
				
				if(!resultSet.next())
				{
					System.out.println("Yes Evening time we have to send message today");
					distance(last_lat, stop_lat, last_long, stop_long,
							20, device_id,"drop",bus_id);
				}
			}
		   if(!pick && !drop){
				System.out.println("No not the correct time!!!!!");
			}

			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		if (flag == 1)
			return 1;
		else
			return 0;

	}

	private int distance(double lat1, double lat2, double lon1, double lon2,
			double speed, String device_id,String pick_drop,String bus_id) {

		System.out.println("Current Device latitude:" + lat1);
		System.out.println("Current Device Longitude:" + lon1);
		System.out.println("Destination latitude:" + lat2);
		System.out.println("Destination Longitude:" + lon2);

		System.out.println("done Calling!!!!");
		final int R = 6371; // Radius of the earth
		int success = 0;
		Double latDistance = deg2rad(lat2 - lat1);
		Double lonDistance = deg2rad(lon2 - lon1);
		Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
				* Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
		Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = R * c; // convert to meters

		System.out.println("Distance in Kilo-meters:" + distance);
		System.out.println("Distance in meters:" + distance * 1000);

		System.out.println("Speed:" + speed);
		double timetaken = (distance) / (speed);
		System.out.println("Time Taken:" + timetaken * 60);
		System.out.println("Admin time:"+time_before);
		if (timetaken * 60 <time_before) {
			System.out.println("Message Send");
			success = 1;
			MessageSend(device_id,pick_drop,bus_id);
			return success;
		}

		return success;
	}

	private void MessageSend(String device_id,String pick_drop,String bus_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			String cmd_route_lat_long = "select * from tbl_student where pickup_bus_id='"+bus_id+"' and pickup_stop_id='S1' or drop_bus_id='"+bus_id+"' and drop_stop_id='S1' ";

			resultSet = statement.executeQuery(cmd_route_lat_long);
			while (resultSet.next()) {
				System.out.println("Message Send");
				System.out.println("Message send to "+resultSet.getString("mobile_number"));
				MessageSender.sendMessage(resultSet.getString("mobile_number"),
					"Your bus will arrive in 10 minutes.");
			}
			resultSet.close();

			DateTime date = new DateTime();
			String cmd_execute="";
			if(pick_drop.equals("pick"))
			{
				cmd_execute = "insert into tbl_message_control(device_id,pick_or_drop,time_stamp,message_limit) values('"+ device_id + "','pick','"+ date.toString("yyyy-MM-dd") + "',1)";
			}
			else if(pick_drop.equals("drop"))
			{
				cmd_execute = "insert into tbl_message_control(device_id,pick_or_drop,time_stamp,message_limit) values('"
					+ device_id + "','drop','"
					+ date.toString("yyyy-MM-dd") + "',1)";
			}

			
			resultSet.close();
			statement.execute(cmd_execute);

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
	}

	private double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}

}
