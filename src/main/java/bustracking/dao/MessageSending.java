package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.sql.DataSource;

import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;

import bustracking.model.GlobalTrackDetail;
import bustracking.model.MessageSender;
import bustracking.model.OrgBusinessRule;
import bustracking.model.Route;
import bustracking.model.SkippingStop;
import bustracking.model.Trackinginfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * Class used to perform message sending logic
 */
public class MessageSending{
	
	private static final Logger logger = LoggerFactory.getLogger(MessageSending.class);
	
	List<SkippingStop> skippingStops=new ArrayList<SkippingStop>();
	
	List<GlobalTrackDetail> globalTrackDetails=new ArrayList<GlobalTrackDetail>();
	
	 List<Route> messageSendRouteList=new ArrayList<Route>();
	
	
	/*
	 * Data source use to connect with DB
	 */
	private DataSource dataSource;
	
	/*
	 * Setter for Data Source
	 */
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	/*
	 * Function used to get tracking information from tbl_vechicle_tracking table
	 */
	public List<Trackinginfo> getTrackingInfo() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Trackinginfo> trackinginfos = new ArrayList<Trackinginfo>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			
			String cmd_track_data = "select * from tbl_vechicle_tracking_history where flag=0";
			resultSet = statement.executeQuery(cmd_track_data);
			while (resultSet.next()) {
				trackinginfos.add(new Trackinginfo(resultSet
						.getString("org_id"), resultSet
						.getString("vechicle_reg_no"), resultSet
						.getString("latitude"), resultSet
						.getString("longitude"), resultSet
						.getString("bus_arrival_time"), resultSet
						.getString("speed"), resultSet
						.getString("exceed_speed_limit"), resultSet
						.getString("bus_tracking_timestamp"), resultSet
						.getString("address"), resultSet
						.getString("flag")));
				}
			

		} catch (Exception e) {
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return trackinginfos;
	}
	
	
	/*
	 * Update the tracking informations table to
	 * 
	 * mention the calculation done for a tracking info
	 */
	public boolean UpdateTrackingInfo(List<Trackinginfo> trackinginfos) {
		Connection con = null;
		Statement statement = null;

		boolean status = false;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			String update_tracking_info = "";
			for (Trackinginfo trackinginfo : trackinginfos) {
				update_tracking_info = "update tbl_vechicle_tracking_history set flag=1 where bus_tracking_timestamp='"
						+ trackinginfo.getBus_tracking_time() + "'";
				status = statement.execute(update_tracking_info);
			}

		} catch (Exception e) {
			logger.info(e.toString

			());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	/*
	 * Update as reached
	 */
	public boolean Update_as_reached(Route route) {
		Connection con = null;
		Statement statement = null;

		boolean status = false;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			String update_as_reached = "";
			update_as_reached="Update tbl_message_log set reached=1 where route_no='"+route.getRoute_no()+"' and stop_id='"+route.getStop_id()+"'";
			status = statement.execute(update_as_reached);
			removeSkippingStops(route.getRoute_no());
				
			} catch (Exception e) {
			logger.info(e.toString

			());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	/*
	 * Update as reached
	 */
	public boolean updateMessageLog(Route route) {
		Connection con = null;
		Statement statement = null;
		logger.info("Update Message Statsus!!!");
		boolean status = false;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			DateTimeZone dateTimeZone=DateTimeZone.forID("Asia/Kolkata");
			LocalDate localDate=new LocalDate(dateTimeZone);
						
			
			
			String update_as_reached = "";
			if(Integer.parseInt(route.getTrip())==0)
				update_as_reached="Update tbl_message_log set reached=0,last_message_send_pick='"+localDate+"' where route_no='"+route.getRoute_no()+"' and stop_id='"+route.getStop_id()+"'";
			else if(Integer.parseInt(route.getTrip())==1)
				update_as_reached="Update tbl_message_log set reached=0,last_message_send_drop='"+localDate+"' where route_no='"+route.getRoute_no()+"' and stop_id='"+route.getStop_id()+"'";
			status = statement.execute(update_as_reached);
				
			} catch (Exception e) 
			{
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	/*
	 * Used to insert the log details for message
	 * triggered from our application
	 */
	public boolean Insert_into_sms_tracking(String org_id,String student_roll_no,String mobile_no) {
		Connection con = null;
		Statement statement = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement =con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			TimeZone.setDefault(TimeZone.getTimeZone("IST"));
			Date date = new Date();
			String insert_history_info = "insert into tbl_sms_tracking(org_id,student_roll_no,mobile_number,sms_trigger_time_stamp,status) values('"
					+ org_id
					+ "','"
					+ student_roll_no
					+ "','"+mobile_no+"','"
					+ sdf.format(date) + "','Send')";
			statement.execute(insert_history_info);
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	/*
	 * Function to get the Business Rules
	 */
	public List<OrgBusinessRule> getBusinessRule(String org_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<OrgBusinessRule> businessRules = new ArrayList<OrgBusinessRule>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			String cmd_track_data = "select * from tbl_business_rule where org_id='"+ org_id + "'";
			resultSet = statement.executeQuery(cmd_track_data);
			while (resultSet.next()) {
				businessRules.add(new OrgBusinessRule(resultSet
						.getString("org_id"), resultSet
						.getString("google_map_traffic"), resultSet
						.getString("pickup_start_time"), resultSet
						.getString("pickup_end_time"), resultSet
						.getString("drop_start_time"), resultSet
						.getString("drop_end_time"), resultSet
						.getString("kg_start_time"), resultSet
						.getString("kg_end_time"), resultSet
						.getString("speed_limit"), resultSet
						.getString("sms_options"), resultSet
						.getString("alert_time_interval"), resultSet
						.getString("saturday"), resultSet
						.getString("sms_sending"),
						resultSet.getString("average_speed")));
			}

		} catch (Exception e) {
			logger.info("yes error here"+e.toString());
			releaseStatement(statement);
			releaseConnection(con);
		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
		return businessRules;
	}
	
	/*
	 * Function to get the current stop informations
	 * This function will give a list of stops after a reached stop
	 */
	public List<Route> getCurrentStopInfo(String vechicleRegNo,int trip) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Route> routes=new ArrayList<Route>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			DateTimeZone dateTimeZone=DateTimeZone.forID("Asia/Kolkata");
			LocalDate localDate=new LocalDate(dateTimeZone);
			String routeno="";
			
			//Find out the route number using vehicle Reg.no
			String cmd_get_route_no="Select route_no from tbl_message_log where vechicle_reg_no='"+vechicleRegNo+"'";
			resultSet=statement.executeQuery(cmd_get_route_no);
			if(resultSet.next())
			{
				routeno=resultSet.getString("route_no");
			}
			
			//To get the skipping stop for a particular route
			List<SkippingStop> particularRouteSkippingStops=new ArrayList<SkippingStop>();			
			particularRouteSkippingStops=getSkippingStopsinRoute(routeno);
			
			//To add the skipping stops in the current stops
			String cmd_add_skipping_stops="";
			for (SkippingStop skippingStop : particularRouteSkippingStops) {				
				cmd_add_skipping_stops="select t1.vechicle_reg_no,t1.route_no,t1.stop_id as stop_id,t1.last_message_send_pick,t1.last_message_send_drop,t1.last_message_send_kg_pick,t1.last_message_send_kg_drop,t1.reached,t2.org_id,t2.trip,t2.latitude,t2.longitude from tbl_message_log as t1 join tbl_bus_route as t2 on t1.stop_id=t2.stop_id and t1.route_no=t2.route_no where vechicle_reg_no='"+vechicleRegNo+"' and t1.stop_id='"+skippingStop.getStop_id()+"'";
				resultSet=statement.executeQuery(cmd_add_skipping_stops);
				if(resultSet.next())
				{
					routes.add(new Route(resultSet.getString("org_id"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("trip"),resultSet.getString("latitude"),resultSet.getString("longitude"),resultSet.getString("last_message_send_pick"),resultSet.getString("last_message_send_drop"),resultSet.getString("last_message_send_kg_pick"),resultSet.getString("last_message_send_kg_drop")));
				}
							
			}
			
			//Normally add the next not reached stop in the list
			//String cmd_get_info="select t1.vechicle_reg_no,t1.route_no,min(t1.stop_id) as stop_id,t1.last_message_send_pick,t1.last_message_send_drop,t1.last_message_send_kg_pick,t1.last_message_send_kg_drop,t1.reached,t2.org_id,t2.trip,t2.latitude,t2.longitude from tbl_message_log as t1 join tbl_bus_route as t2 on t1.stop_id=t2.stop_id and t1.route_no=t2.route_no where vechicle_reg_no='"+vechicleRegNo+"' and date(t1.last_message_send_pick)<date('"+localDate+"') and trip='"+trip+"' and t1.stop_id!='S0' and t1.stop_id>(select max(stop_id) from tbl_message_log where date(last_message_send_pick)=date('"+localDate+"'));";
			String cmd_get_info="select t1.vechicle_reg_no,t1.route_no,t1.stop_id as stop_id,t1.last_message_send_pick,t1.last_message_send_drop,t1.last_message_send_kg_pick,t1.last_message_send_kg_drop,t1.reached,t2.org_id,t2.trip,t2.latitude,t2.longitude from tbl_message_log as t1 join tbl_bus_route as t2 on t1.stop_id=t2.stop_id and t1.route_no=t2.route_no where vechicle_reg_no='"+vechicleRegNo+"' and date(t1.last_message_send_pick)<date('"+localDate+"') and trip='"+trip+"' and t1.stop_id!='S0' and t1.stop_id>(select Max(stop_id) from tbl_message_log where  vechicle_reg_no='"+vechicleRegNo+"' and (stop_id='S0' or date(last_message_send_pick)=date('"+localDate+"')));";
			
			resultSet=statement.executeQuery(cmd_get_info);	
			
			boolean alreadyPresent=false;
			while(resultSet.next()&&resultSet.getBoolean(1))
			{
				for (Route route : routes) {
					if(route.getRoute_no().contains(resultSet.getString("route_no"))&&route.getStop_id().contains(resultSet.getString("stop_id")))
					{
						alreadyPresent=true;
					}
				}
				if(!alreadyPresent)
				{
					routes.add(new Route(resultSet.getString("org_id"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("trip"),resultSet.getString("latitude"),resultSet.getString("longitude"),resultSet.getString("last_message_send_pick"),resultSet.getString("last_message_send_drop"),resultSet.getString("last_message_send_kg_pick"),resultSet.getString("last_message_send_kg_drop")));
					break;
				}
				alreadyPresent=false;
			}

		} catch (Exception e) {
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseStatement(statement);
			releaseConnection(con);
		}
		return routes;
	}	
	
	/*
	 * Function to get the not reached stop after message sent
	 * This function stop info after sent a message
	 */
	public List<Route> getNotReachedStopInfo(String vechicleRegNo,int trip) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Route> notReachedStopInfo=new ArrayList<Route>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			DateTimeZone dateTimeZone=DateTimeZone.forID("Asia/Kolkata");
			LocalDate localDate=new LocalDate(dateTimeZone);
			
			//Get not reached stop
			String cmd_get_info="select t1.vechicle_reg_no,t1.route_no,t1.stop_id as stop_id,t1.last_message_send_pick,t1.last_message_send_drop,t1.last_message_send_kg_pick,t1.last_message_send_kg_drop,t1.reached,t2.org_id,t2.trip,t2.latitude,t2.longitude from tbl_message_log as t1 join tbl_bus_route as t2 on t1.stop_id=t2.stop_id and t1.route_no=t2.route_no where vechicle_reg_no='"+vechicleRegNo+"' and date(t1.last_message_send_pick)=date('"+localDate+"') and reached=0 and trip='"+trip+"' and t1.stop_id!='S0'";
			resultSet=statement.executeQuery(cmd_get_info);			
			while(resultSet.next()&&resultSet.getBoolean(1))
			{
				notReachedStopInfo.add(new Route(resultSet.getString("org_id"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("trip"),resultSet.getString("latitude"),resultSet.getString("longitude"),resultSet.getString("last_message_send_pick"),resultSet.getString("last_message_send_drop"),resultSet.getString("last_message_send_kg_pick"),resultSet.getString("last_message_send_kg_drop")));
			}

		} catch (Exception e) {
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseStatement(statement);
			releaseConnection(con);
		}
		return notReachedStopInfo;
	}
	
	/*
	 * 
	 */
	private void MessageSend(Route route) {
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

			String cmd_student_number = "select * from tbl_student where pickup_route_no='"+ route.getRoute_no() + "'";
			resultSet = statement.executeQuery(cmd_student_number);
			while (resultSet.next()) {
				logger.info("Message Sending....");
				logger.info("MESSAGE SEND TO: "+ resultSet.getString("parent_mobile1"));
				MessageSender.sendMessage(resultSet.getString("parent_mobile1"),"You will reach Bus Stop "+route.getStop_id()+" in 10 mins");
				Insert_into_sms_tracking(resultSet.getString("org_id"),resultSet.getString("student_roll_no"),resultSet.getString("parent_mobile1"));

			}
			resultSet.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
	}
	
	
	
	
	public int doProcess() {
		Connection con = null;
		Statement statement = null;
		Double doub = new Double("99999.0");
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			logger.info("Started processing....");
			List<Trackinginfo> currentTrackinginfo = new ArrayList<Trackinginfo>();
			List<OrgBusinessRule> businessRules = new ArrayList<OrgBusinessRule>();
			
			//Get current tracking information from tbl_vechicle_tracking table
			logger.info("Collect tracking info....");
			currentTrackinginfo = getTrackingInfo(); 			
			
			if (!currentTrackinginfo.isEmpty()) {
				for (Trackinginfo trackinginfo : currentTrackinginfo)
				{
					//Get Business rule information from tbl_business_rule table
					logger.info("Collect business Rule info....");
					businessRules=getBusinessRule(trackinginfo.getOrg_id());
					System.out.println("Collected Businees rules");
					//Check business rules
					switch(checkBusinessRules(businessRules.get(0)))
					{
					case 1: logger.info("Do Calculation for Pickup");
							doCalculation(trackinginfo,0,businessRules.get(0));
							break;
					case 2: logger.info("Do Calculation for Drop");
							doCalculation(trackinginfo,1,businessRules.get(0));
							break;
					case 3: logger.info("Do Calculation for KG");
							doCalculation(trackinginfo,2,businessRules.get(0));
							break;
					default:logger.info("Failed to satisfy business rules");
							break;								
					}
					
					System.out.println("-----------------------Skipping Stop values-------------------------------");
					for (SkippingStop skippingStop : skippingStops) {
						System.out.println(skippingStop.getRoute_no()+"/"+skippingStop.getStop_id());
					}
					System.out.println("----------------------End Skipping Stop Values------------------------------");
					System.out.println("----------------------Global Distance Details-------------------------------");
					for (GlobalTrackDetail globalTrackDetail : globalTrackDetails) {
						System.out.println(globalTrackDetail.getRoute_no()+"/"+globalTrackDetail.getStop_id()+"/"+globalTrackDetail.getLast_distance());
					}
					System.out.println("----------------------End Global Distance Details----------------------------");
					System.out.println();
					
														
				}
				//Update Tracking Information
				logger.info("Update Tracking Info...");
				UpdateTrackingInfo(currentTrackinginfo);

			}

		} catch (Exception e) {
			logger.info(e.toString

			());
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
	/*
	 * Function to check the business rules
	 */
	public int checkBusinessRules(OrgBusinessRule businessRule)
	{
		/*
		 * status values
		 * 0 - do nothing
		 * 1 - time for pick up
		 * 2 - time for drop
		 * 3 - time for KG drop
		 */
		int status=0;
		
		//Time Conversion
		DateTimeZone TZ = DateTimeZone.forID("Asia/Kolkata");
		LocalTime localTime = new LocalTime(TZ);
		logger.info("Local Date Time:" + localTime);
		LocalTime pickup_start_time = LocalTime.parse(businessRule.getPickup_start_time());
		LocalTime pickup_end_time = LocalTime.parse(businessRule.getPickup_end_time());
		LocalTime drop_start_time = LocalTime.parse(businessRule.getDrop_start_time());
		LocalTime drop_end_time = LocalTime.parse(businessRule.getDrop_end_time());
		LocalTime kg_start_time=LocalTime.parse(businessRule.getKg_start_time());
		LocalTime kg_end_time=LocalTime.parse(businessRule.getKg_end_time());
		
		//Check Message Sending Enable
		if(businessRule.getSms_sending().equals("off"))
		{
			logger.info("Message Setting fail!!");
			status=0;
		}
		//Check the current time falls with pick up time range
		else if(localTime.isAfter(pickup_start_time)&&localTime.isBefore(pickup_end_time))
		{
			logger.info("Its Time for pickup!!");
			status=1;
		}
		//Check the current time falls with drop time range
		else if(localTime.isAfter(drop_start_time)&&localTime.isBefore(drop_end_time))
		{
			logger.info("Its time for drop!!!");
			status=2;
		}
		//Check the current time falls with KG time range
		else if(localTime.isAfter(kg_start_time)&&localTime.isBefore(kg_end_time))
		{
			logger.info("Its time for kg drop!!");
			status=3;
		}
		else
		{
			status=0;
		}
		
		
		
		return status;
	}
	
	/*
	 * Calculate the distance between two latitude/longs
	 *
	 */

	private double distance(double lat1, double lat2, double lon1, double lon2) {
		final int R = 6371; // Radius of the earth
		Double latDistance = deg2rad(lat2 - lat1);
		Double lonDistance = deg2rad(lon2 - lon1);
		Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
				* Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
		Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = R * c; // convert to meters
		return distance;

	}
	private double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}
	
	/*
	 * Perform calculation for trip
	 * @trip pickup/drop/KGdrop
	 */
	@SuppressWarnings("static-access")
	public void doCalculation(Trackinginfo trackinginfo,int trip,OrgBusinessRule businessRule)
	{
		List<Route> stopInfoListForCalculation=new ArrayList<Route>();
		
		List<Route> notReachedStopForCalculation=new ArrayList<Route>();
		
		double current_distance=0.0;
		double distance_to_not_reachedstop=0.0;
		double timetaken=0.0;
		Double doub = new Double("99999.0");
		double last_distance;
		double average_speed;
		double alert_minute;
		
		System.out.println("Average speed/Alert time");
		average_speed=doub.parseDouble(businessRule.getAverage_speed());
		alert_minute=doub.parseDouble(businessRule.getAlert_time_interval());
		
		System.out.println(average_speed);
		System.out.println(alert_minute);
		
		
		//Collect a list of not reached stops
		logger.info("Collect route information...");
		stopInfoListForCalculation=getCurrentStopInfo(trackinginfo.getVechicle_reg_no(), trip);
		
		System.out.println("----------------Calculation done below route/stops:----------------------");		
		for (Route route : stopInfoListForCalculation) {
			
			logger.info(route.getRoute_no()+"/"+route.getStop_id());
			
		}
		System.out.println("----------------End Calculation list--------------------------------------");
		
		
		//Include Not Reached stop into the calculation
		logger.info("Collect Not reached stop information...");
		notReachedStopForCalculation=getNotReachedStopInfo(trackinginfo.getVechicle_reg_no(), trip);
		
		//Perform calculation		
		for (Route route : stopInfoListForCalculation) 
		{
			logger.info("------>Route:"+route.getRoute_no()+"/Stop:"+route.getStop_id());
			logger.info("Latitude:"+route.getLatitude());
			logger.info("Longitude:"+route.getLongitude());
			if(notReachedStopForCalculation.isEmpty())
			{
				logger.info("No Not reached stop...");
				current_distance=distance(doub.parseDouble(trackinginfo.getLatitude()),doub.parseDouble(route.getLatitude()),doub.parseDouble(trackinginfo.getLongitude()),doub.parseDouble(route.getLongitude()));
				logger.info("Current distance:"+current_distance);
			}
			else
			{
				logger.info("Have Not reached stop...");
				distance_to_not_reachedstop=distance(doub.parseDouble(trackinginfo.getLatitude()),doub.parseDouble(notReachedStopForCalculation.get(0).getLatitude()),doub.parseDouble(trackinginfo.getLongitude()),doub.parseDouble(notReachedStopForCalculation.get(0).getLongitude()));
				
				if(distance_to_not_reachedstop<=0.2)
				{
					System.out.println("Stop "+notReachedStopForCalculation.get(0).getStop_id()+" Reached Successfully");
					Update_as_reached(notReachedStopForCalculation.get(0));
				}
				
				current_distance=distance_to_not_reachedstop+distance(doub.parseDouble(notReachedStopForCalculation.get(0).getLatitude()),doub.parseDouble(route.getLatitude()),doub.parseDouble(notReachedStopForCalculation.get(0).getLongitude()),doub.parseDouble(route.getLongitude()));
				logger.info("Current distance:"+current_distance);
			}
			last_distance=getLastDistance(route.getRoute_no(),route.getStop_id(), globalTrackDetails);
			logger.info("Last Distance:"+last_distance);
			if(last_distance!=0.0)
			{
				logger.info("Difference in distance:"+(last_distance-current_distance));
				if(last_distance>=current_distance)
				{
					/*----------Check here start here --------------------*/////////////
					logger.info("Last distance is greater than current distance");
					logger.info("Bus towards stop!!!"+route.getStop_id());
					timetaken=current_distance/average_speed;
					logger.info("Time taken to reach:"+timetaken*60+" minutes");
					if(timetaken*60<alert_minute)//Checking whether the time taken to reach stop is 10 mints
					{
						messageSendRouteList.add(route);
					}					
					
				}
				else if(current_distance-last_distance>0.03){
					logger.info("Last distance is less than today date");
					logger.info("Bus Moving away from stop!!!"+route.getStop_id());
					addSkippingStops(route.getRoute_no(),route.getStop_id());
				}
				else
				{
					logger.info("It Looks like bus away from stop!!");
				}
				logger.info("Update Last Distance in global list!!");
				updateLastDistance(route.getRoute_no(),route.getStop_id(),String.valueOf(current_distance));
			}
			else
			{
				logger.info("Add New last distance!!!");
				globalTrackDetails.add(new GlobalTrackDetail(route.getRoute_no(),route.getStop_id(),String.valueOf(current_distance)));
				
			}
				
		}
		
		//Relax send the message
		if(messageSendRouteList.size()==1)
		{
			//Call message send function
			//Update the tbl_message_log table
			logger.info("Message List have only one value...");
			logger.info("Message Send");
			//MessageSender.sendMessage("9677640069","You will reach "+messageSendRouteList.get(0).getAddress()+" Bus Stop in 2 mins");
			MessageSend(messageSendRouteList.get(0));
			System.out.println("Message Send to stop "+messageSendRouteList.get(0).getStop_id());
			updateMessageLog(messageSendRouteList.get(0));
			removeSkippingStops(messageSendRouteList.get(0).getRoute_no());			
			messageSendRouteList.clear();	
			
		}
		else
		{
			messageSendRouteList.clear();
		}
		
		
	}
	
	
	/*
	 * To get the last distance from global list
	 */
	@SuppressWarnings("static-access")
	public double getLastDistance(String route_no,String stop_id, List<GlobalTrackDetail> globalTrackDetails) {
	   
		
		double last_distance=0.00;
		Double doub = new Double("99999.0");
		for (GlobalTrackDetail globalTrackDetail:globalTrackDetails) {
	        if (globalTrackDetail.getRoute_no().contains(route_no)&&globalTrackDetail.getStop_id().contains(stop_id))
	        {
	        	last_distance=doub.parseDouble(globalTrackDetail.getLast_distance());
	        	break;
	        }
	    }
		return last_distance;
	
		
	}
	
	
	/*
	 *Search in the global list to insert last distance
	 */
	public boolean search_global_track(String route_no,String stop_id, List<GlobalTrackDetail> globalTrackDetails) {
	   
	   int count=0;
		for (GlobalTrackDetail globalTrackDetail:globalTrackDetails) {
	        if (globalTrackDetail.getRoute_no().contains(route_no)&&globalTrackDetail.getStop_id().contains(stop_id))
	        {
	            count=1;
	            break;
	        }
	    }
		if(count==1)
			return true;
		else
			return false;
		
	}
	
	/*
	 * Update Global Tracking list
	 */
	private void updateLastDistance(String route_no, String stop_id, String valueOf) {
		
		for (GlobalTrackDetail globalTrackDetail:globalTrackDetails) {
	        if (globalTrackDetail.getRoute_no().contains(route_no)&&globalTrackDetail.getStop_id().contains(stop_id))
	        {
	            globalTrackDetail.setLast_distance(valueOf);
	        }
	    }
	}
	
	/*
	 * Function to add skipping stops
	 */
	public void addSkippingStops(String route_no,String stop_id)
	{
		int count=0;
		for (SkippingStop skippingStop:skippingStops) {
	        if (skippingStop.getRoute_no().contains(route_no)&&skippingStop.getStop_id().contains(stop_id))
	        {
	            count=1;
	            break;
	        }
	    }
		if(count==0)
			skippingStops.add(new SkippingStop(route_no, stop_id));
			
	}
	/*
	 * Function to remove skipping stop from list
	 */
	public void removeSkippingStops(String route_no)
	{
		List<Integer> i=new ArrayList<Integer>();
		int j=0;
		for(SkippingStop skippingStop:skippingStops)
		{
			if(skippingStop.getRoute_no().contains(route_no))
			{
					i.add(j);			
			}
			j=j+1;
		}
		/*for (Integer integer : i) {
			skippingStops.remove(integer);
		}
		*/
		for (int k = i.size()-1; k >= 0; k--) {
		   skippingStops.remove(i.get(k).intValue());
		}
		i.clear();
			
		
	}
	
	
	public List<SkippingStop> getSkippingStopsinRoute(String routeno)
	{
		List<SkippingStop> particularRouteSkippingStops=new ArrayList<SkippingStop>();
		for (SkippingStop skippingStop : skippingStops) {
			if(skippingStop.getRoute_no().contains(routeno))
			{
				particularRouteSkippingStops.add(new SkippingStop(routeno, skippingStop.getStop_id()));
			}
		}
		return particularRouteSkippingStops;
		
	}
	
	
	/*
	 * Function To Send SMS To Parents From Client Side
	 * 
	 */
	

	public void SMS_to_parent(String route_no,String Message) {
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

			String cmd_student_number = "select * from tbl_student where pickup_route_no='"+ route_no + "'";
			resultSet = statement.executeQuery(cmd_student_number);
			while (resultSet.next()) {
				logger.info("Message Sending....");
				logger.info("MESSAGE SEND TO: "+ resultSet.getString("parent_mobile1"));
				MessageSender.sendMessage(resultSet.getString("parent_mobile1"),Message);
				Insert_into_sms_tracking(resultSet.getString("org_id"),resultSet.getString("student_roll_no"),resultSet.getString("parent_mobile1"));

			}
			resultSet.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {

			releaseStatement(statement);
			releaseConnection(con);
		}
	}
	
	
	/*
	 * Release DB Connection
	 */
	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	/*
	 * Release ResultSet
	 */
	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	/*
	 * Release Statement
	 */
	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}
	
	
}