package bustracking.dao;

import java.net.InetAddress;
import java.security.Principal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import bustracking.forms.SuperAdminHomeForm;
import bustracking.model.DeviceRegistration;
import bustracking.model.MessageSender;
import bustracking.model.Route;
import bustracking.model.Route_view;
import bustracking.model.Smsparent;
import bustracking.model.SuperAdminHome;
import bustracking.forms.SmsparentForm;




/*import bustracking.model.DeviceFail;*/


public class MainDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String getRole(String username){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String role="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			resultSet = statement.executeQuery("select role from tbl_user where username='"+username+"'");
			if(resultSet.next())
				role=resultSet.getString("role");
				
			
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return role;
		
	}
	public String getOrg_id(String username){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String org_id="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			resultSet = statement.executeQuery("select org_id from tbl_user where username='"+username+"'");
			if(resultSet.next())
				org_id=resultSet.getString("org_id");
				
			
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
	    return org_id;
		
	}
	
	
	
	// Get Details For Super Admin Home Page
	
	public List<SuperAdminHome> getAdminHomes(){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SuperAdminHome> superAdminHomes=new ArrayList<SuperAdminHome>();
	    try{
			resultSet = statement.executeQuery("Select t1.org_name,t1.branch, (select count(t2.vechicle_reg_no) from tbl_vechicle as t2 where t2.org_id=t1.org_id) as no_of_vechicle, (select count(t3.student_roll_no) from tbl_student as t3 where t3.org_id=t1.org_id)as no_of_student from tbl_organization as t1 group by t1.org_id");
			while(resultSet.next()){
				superAdminHomes.add(new SuperAdminHome(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("no_of_vechicle"),resultSet.getString("no_of_student")));
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
	    return superAdminHomes;
	}
	
		//find home contents 06/05/2014
		public List<SuperAdminHome> findadminhome( String org_name , String branch){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SuperAdminHome> superAdminHomes=new ArrayList<SuperAdminHome>();
	    try{
			resultSet = statement.executeQuery("Select t1.org_name,t1.branch, (select count(t2.vechicle_reg_no) from tbl_vechicle as t2 where t2.org_id=t1.org_id) as no_of_vechicle, (select count(t3.student_roll_no) from tbl_student as t3 where t3.org_id=t1.org_id)as no_of_student from tbl_organization as t1 where org_name='"+org_name+"' or branch='"+branch+"' group by t1.org_id");
			while(resultSet.next()){
				superAdminHomes.add(new SuperAdminHome(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("no_of_vechicle"),resultSet.getString("no_of_student")));
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
	    return superAdminHomes;
	}
	//Search client route view
		public List<Route_view> searchRouteclient(String org_id,String route_no,String trip){
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
				
				resultSet = statement.executeQuery("SELECT t1.vechicle_reg_no,t1.route_no, t2.stop_id,t2.trip,t2.address,t2.bus_arrival_time from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.route_no=t2.route_no where t2.org_id='"+org_id+"' and (t1.route_no='"+route_no+"' and trip='"+trip+"')");
				System.out.println("SELECT t1.vechicle_reg_no,t1.route_no, t2.stop_id,t2.trip,t2.address,t2.bus_arrival_time from tbl_vechicle as t1 join tbl_bus_route as t2 on t1.org_id=t2.org_id where t2.org_id='"+org_id+"' and (route_no='"+route_no+"' and trip='"+trip+"')");
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
		
		public String sms_parent(Smsparent parent){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			String role="";
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			try {

				String mobile_number = "select * from tbl_student where pickup_route_no='"+ parent.getRoute() + "'";
				resultSet = statement.executeQuery(mobile_number);
				while (resultSet.next()) {
					//logger.info("Message Sending....");
					//logger.info("MESSAGE SEND TO: "+ resultSet.getString("parent_mobile1"));
					
					PreparedStatement preparedStatement1=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
					preparedStatement1.setString(1,resultSet.getString("parent_mobile1"));
					preparedStatement1.setString(2,parent.getMessage());
					preparedStatement1.setString(3,"NULL");
					preparedStatement1.setString(4,"NULL");
					preparedStatement1.setString(5,"NULL");
					preparedStatement1.execute();
					
					
					MessageSender.sendMessage(resultSet.getString("parent_mobile1"),parent.getMessage());
					

				}
				resultSet.close();
			} catch (Exception e) {
				System.out.println(e.toString

				());
				releaseStatement(statement);
				releaseConnection(con);

			} finally {

				releaseStatement(statement);
				releaseConnection(con);
			}
			return role;
		}
		
		
	// SMS to Parent page
		public List<String> get_route(String trip, String org_id){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			List<String> route=new ArrayList<String>();
			try{
				
				String cmd_sql="Select route_no from tbl_bus_route where trip='"+trip+"' AND org_id='"+org_id+"' group by route_no";
				resultSet=statement.executeQuery(cmd_sql);
				
				while(resultSet.next())
				{
					route.add(resultSet.getString("route_no"));
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
		    return route;
			
		}
		
		
		
	/*public List<DeviceFail> getdevicefails(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DeviceFail> deviceFails=new ArrayList<DeviceFail>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_device_status");
			while(resultSet.next()){
				deviceFails.add(new DeviceFail(resultSet.getString(1),resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
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
	    return deviceFails;
		
	}*/
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}

}
