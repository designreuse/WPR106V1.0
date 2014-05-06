package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import bustracking.model.AddUser;
import bustracking.model.BusDeviceRegistration;
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
	    	String cmd="select t3.org_name,t3.branch,t1.vechicle_reg_no,t2.org_id,t2.route_no,t2.stop_id,t2.trip,t2.address from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.route_no=t2.route_no join tbl_organization as t3 on t3.org_id=t2.org_id where t3.org_name='"+org_name+"' or t3.branch='"+branch+"' or t1.vechicle_reg_no='"+vechicle_reg_no+"' or t2.route_no='"+route_no+"' or t2.trip='"+trip+"'";
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
			resultSet = statement.executeQuery("SELECT t1.vechicle_reg_no,t1.route_no, t2.stop_id,t2.trip,t2.address,t2.bus_arrival_time from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.org_id=t2.org_id where t2.org_id='"+org_id+"'");
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

	
	
	/*public List<Route> getRoutesView(String route_no)
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
		
		List<Route> routesView=new ArrayList<Route>();
		{
		try
		{
			String cmd="select *from tbl_route where route_no='"+route_no+"'";
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next())
			{
				routesView.add(new Route(resultSet.getInt("org_id"),resultSet.getString("route_no"),resultSet.getString("trip"),resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("latitude"),resultSet.getString("longitude"),resultSet.getString("bus_arrival_time")));
			System.out.print(route_no);
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
	*/
	

	/*public int updateRoute(Route route)
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
	    	String cmd="UPDATE tbl_route SET bus_id='"+route.getBus_id()+"',route_id='"+route.getRoute_id()+"',stop_id='"+route.getStop_id()+"',pickup_or_drop='"+route.getPickup_drop_stop()+"',route_from='"+route.getRoute_from()+"',route_to='"+route.getRoute_to()+"',stop_name'"+route.getStop_name()+"',stop_pickup_time='"+route.getStop_pickup_time()+"',stop_drop_time='"+route.getStop_drop_time()+"',date_time='"+route.getDate_time()+"'WHERE route_id='"+route.getRoute_id()+"';";
	    	String Desc="Update Route "+route.getRoute_id();
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
	}*/
	
	
	
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
