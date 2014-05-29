package bustracking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.mail.search.DateTerm;
import javax.sql.DataSource;

import org.apache.velocity.runtime.directive.Stop;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;

import bustracking.model.AddUser;
import bustracking.model.BusDeviceRegistration;
import bustracking.model.BusRegistration;
import bustracking.model.Route;
import bustracking.model.OrgRegistration;
import bustracking.model.Route_view;
import bustracking.forms.OrgRegistrationForm;
import bustracking.dao.OrgRegistrationDAO;



public class RouteDAO {
	private DataSource dataSource;

	OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/*public List<Route> getRoutes() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route> routes = new ArrayList<Route>();
		try {
			resultSet = statement.executeQuery("select * from tbl_route");
			while (resultSet.next()) {

			}
		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return routes;

	}
*/
	
	// Insert Route Information 
	
	public int insert_route(Route route) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int status = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			System.out.println("org_id:"+route.getOrg_id());
			System.out.println("trip:"+route.getTrip());
			String cmd_insert = "insert into tbl_bus_route(org_id,route_no,stop_id,trip,latitude,longitude,address,bus_arrival_time) values('"+route.getOrg_id()+"','"+route.getRoute_no()+ "','"+route.getStop_id()+"','"+route.getTrip()+"','"+route.getLatitude()+ "','"+ route.getLongitude()+ "','"+route.getAddress()+ "','" + route.getBus_arrival_time()+ "')";
				statement.execute(cmd_insert);
				} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	// Message Log Entry For Each Route
	public List<Route_view> getStops(String route_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route_view> stops=new ArrayList<Route_view>();
		try{
			resultSet = statement.executeQuery("select t2.vechicle_reg_no,t1.route_no,t1.stop_id from tbl_bus_route as t1 join tbl_vechicle as t2 on t1.route_no=t2.route_no where t1.route_no='"+route_no+"'");
			while(resultSet.next()){
		     stops.add(new Route_view(resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("vechicle_reg_no")));
			}
		
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return stops;
	}
	
	// Insert Into Message Log
	
	public int insert_message_log(String route_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route_view> stops=new ArrayList<Route_view>();
		try{
			resultSet = statement.executeQuery("select t2.vechicle_reg_no,t1.route_no,t1.stop_id from tbl_bus_route as t1 join tbl_vechicle as t2 on t1.route_no=t2.route_no where t1.route_no='"+route_no+"'");
			while(resultSet.next()){
		     stops.add(new Route_view(resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("vechicle_reg_no")));
			}
			System.out.println("inserting...");
			DateTimeZone dateTimeZone=DateTimeZone.forID("Asia/Kolkata");
			LocalDate localDate=new LocalDate();
			
			
			for (Route_view route_view: stops) {
				PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_message_log(vechicle_reg_no,route_no,stop_id,last_message_send_pick,last_message_send_drop,last_message_send_kg_pick,last_message_send_kg_drop,reached) values(?,?,?,?,?,?,?,?)");
				preparedStatement.setString(1,route_view.getBus_reg_no());
				preparedStatement.setString(2,route_view.getRoute_no());
	        	preparedStatement.setString(3,route_view.getStop_id());
	        	preparedStatement.setString(4,localDate.toString());
	        	preparedStatement.setString(5,localDate.toString());
	        	preparedStatement.setString(6,localDate.toString());
	        	preparedStatement.setString(7,localDate.toString());
	        	preparedStatement.setString(8,"0");
	        	preparedStatement.execute();
				flag=1;
			}
			
			
		 }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    }finally{
	    	
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		if(flag==1)
    		return 1;
    	else
    		return 0;
	    
		
	}
	
	// View the Route Information Admin Side
	
	public List<Route_view> getRoutes(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route_view> routes=new ArrayList<Route_view>();
		try{
			resultSet = statement.executeQuery("select t3.org_name,t3.branch,t1.vechicle_reg_no,t2.org_id,t2.route_no,t2.stop_id,t2.trip,t2.address from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.route_no=t2.route_no join tbl_organization as t3 on t3.org_id=t2.org_id");
			while(resultSet.next()){
		     routes.add(new Route_view(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("org_id"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("trip"),resultSet.getString("address")));
			}
		
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return routes;
		
	}


	
	
	
	
	public List<BusDeviceRegistration> getBusids(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusDeviceRegistration> busDeviceRegistrations=new ArrayList<BusDeviceRegistration>();
		try{
			
			resultSet = statement.executeQuery("select * from tbl_device_bus");
			while(resultSet.next()){
				busDeviceRegistrations.add(new BusDeviceRegistration(resultSet.getString("org_id"),resultSet.getString("bus_id"),resultSet.getString("device_id"),resultSet.getString("bus_reg_no"),resultSet.getString("device_imei_number"),resultSet.getString("device_sim_number"),resultSet.getString("driver_id"),resultSet.getString("description"),resultSet.getString("isactive"), resultSet.getString("creation_time")));
				}
			
		
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return busDeviceRegistrations;
		
	}
	
	//find routes 06/05/2014

	public List<Route_view> findroute(String org_name,String branch,String vechicle_reg_no,String route_no,String trip){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route_view> route_view = new ArrayList<Route_view>();
	    try{
	    	String cmd="select t3.org_name,t3.branch,t1.vechicle_reg_no,t2.org_id,t2.route_no,t2.stop_id,t2.trip,t2.address from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.route_no=t2.route_no join tbl_organization as t3 on t3.org_id=t2.org_id where t3.org_name='"+org_name+"' or t3.branch='"+branch+"' or t1.vechicle_reg_no='"+vechicle_reg_no+"' or t2.route_no='"+route_no+"' or t2.trip='"+trip+"' ";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				route_view.add(new Route_view(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("org_id"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("trip"),resultSet.getString("address")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return route_view;
		
	}
	
	// Get Route Information For Client Side View
	
	public List<Route_view> getRoute_by_org_id(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route_view> route_views = new ArrayList<Route_view>();
		try{
			System.out.println("welcome Route View");
			resultSet = statement.executeQuery("SELECT t1.vechicle_reg_no,t2.route_no, t2.stop_id,t2.trip,t2.address,t2.bus_arrival_time from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.route_no=t2.route_no where t2.org_id='"+org_id+"'");
			while(resultSet.next()){
				route_views.add(new Route_view(resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("trip"),resultSet.getString("address"),resultSet.getString("bus_arrival_time")));
				
			}
		
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return route_views;
		
	}

	// Admin Side Edit Route
	
	public List<Route_view> getRoutesView(String route_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Route_view> routesView=new ArrayList<Route_view>();
		{
		try
		{
			String cmd="select t1.org_name,t1.branch,t2.* from tbl_organization as t1 join tbl_bus_route as t2 on t1.org_id=t2.org_id where t2.route_no='"+route_no+"'";
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next())
			{
				routesView.add(new Route_view(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"), resultSet.getString("route_no"), resultSet.getString("trip"), resultSet.getString("address"), resultSet.getString("bus_arrival_time")));
			System.out.printf(route_no,resultSet.getString("trip"));
			}
		}
			catch(Exception e){
		        System.out.println(e.toString());
		        	releaseResultSet(resultSet);
		        	releaseStatement(statement);
		        	releaseConnection(con);
		        }
		finally{
		        	releaseResultSet(resultSet);
		        	releaseStatement(statement);
		        	releaseConnection(con);	    	
		        }
		        
		    
		}
		return routesView;
	}
	
	

	public int updateRoute(Route route)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	    try{
	    	String cmd="UPDATE tbl_route SET stop_id='"+route.getStop_id()+"',trip='"+route.getTrip()+"',latitude='"+route.getLatitude()+"',longitude='"+route.getLatitude()+"',address='"+route.getAddress()+"',bus_arrival_time='"+route.getBus_arrival_time()+"' WHERE route_no='"+route.getRoute_no()+"'";
	    	String Desc="Update Route "+route.getRoute_no();
	    	System.out.println(cmd);
	    	statement.execute(cmd);
	    	flag=1;
	    }
	    	 catch(Exception e){
	 	    	System.out.println(e.toString());
	 	    	releaseStatement(statement);
	 	    	releaseConnection(con);
	 	    	flag=0;
	 	    	//return 0;
	 	    }finally{
	 	     	releaseStatement(statement);
	 	    	releaseConnection(con);	    
	 	    	
	 	    }
	 	    if(flag==1)
	     		return 1;
	     	else
	     		return 0;
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
