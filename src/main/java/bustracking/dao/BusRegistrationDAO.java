package bustracking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


import bustracking.forms.BusRegistrationForm;
import bustracking.model.BusRegistration;
import bustracking.model.Route_view;

public class BusRegistrationDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public int setbusregistration(BusRegistration bus){
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
			System.out.println("inserting into Tbl_bus");
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_vechicle(org_id,vechicle_reg_no,device_imei_number,driver_name,driver_licence_number,driver_licence_exp_date,route_no) values(?,?,?,?,?,?,?)");
			preparedStatement.setString(1,bus.getOrg_id());
			preparedStatement.setString(2,bus.getVechicle_reg_no());
        	preparedStatement.setString(3,bus.getDevice_imei_number());
        	preparedStatement.setString(4,bus.getDriver_name());
        	preparedStatement.setString(5,bus.getDriver_licence_no());
        	preparedStatement.setString(6,bus.getDriver_licence_exp_date());
        	preparedStatement.setString(7,bus.getRoute_no());
        	preparedStatement.execute();
			flag=1;
			
			String cmd="UPDATE tbl_device_configuration SET is_assigned='1' where device_imei_number='"+bus.getDevice_imei_number()+"'";
			System.out.println("cmd");
			statement.execute(cmd);
			
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
	
	// Get Bus Details For Edit And View
	
	
	public List<BusRegistration> getBusregistration(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<BusRegistration> busregistration = new ArrayList<BusRegistration>();
	try{
		resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id");
		while(resultSet.next()){
			busregistration.add(new BusRegistration(resultSet.getString("org_name"),resultSet.getString("branch"),
				resultSet.getString("vechicle_reg_no"),resultSet.getString("device_imei_number"),resultSet.getString("driver_name"),
					resultSet.getString("driver_licence_number"),resultSet.getString("driver_licence_exp_date")));
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
    return busregistration;
	
}
	//find bus client side
	
	
	public List<String> getBus_id(String org_name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busRegistrations = new ArrayList<String>();
	    try{
	    	String cmd="select branch from tbl_organization where org_name='"+org_name+"'";
	    	//System.out.println(org_id);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegistrations.add(resultSet.getString("branch"));
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
	        return busRegistrations;
	    }
	
	
	// Select organization name
	
	public List<String> getorgname(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busRegister = new ArrayList<String>();
	    try{
	    	String cmd="SELECT DISTINCT org_name FROM tbl_organization";
	    	//System.out.println(org_name);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegister.add(resultSet.getString("org_name"));
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
	        return busRegister;
	    }
	
	
	// Get Organization name and Branch for student and class
	
	public List<String> getorgname_for_school(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busRegister = new ArrayList<String>();
	    try{
	    	String cmd="SELECT DISTINCT org_name FROM tbl_organization WHERE type_of_organization='School' OR type_of_organization='College' OR type_of_organization='School and College'";
	    	
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegister.add(resultSet.getString("org_name"));
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
	        return busRegister;
	    }
	
	//Get Details for Edit
	
	public List<BusRegistration> getBusRegistrations_by_vechicle_reg(String vechicle_reg_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusRegistration> busregistrations= new ArrayList<BusRegistration>();
		try{
			resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date,t2.route_no from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id where vechicle_reg_no='"+vechicle_reg_no+"'");
			while(resultSet.next()){
				busregistrations.add(new BusRegistration(resultSet.getString("org_name"),resultSet.getString("branch"),
					resultSet.getString("vechicle_reg_no"),resultSet.getString("device_imei_number"),resultSet.getString("driver_name"),
						resultSet.getString("driver_licence_number"),resultSet.getString("driver_licence_exp_date"),resultSet.getString("route_no")));
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
	    return busregistrations;
		
	}
	
	
	
	public int updatebus(BusRegistration busRegistration,String vechicle_reg_no,String admin)
	{
		Connection con = null;
		Statement statement = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	    try{
	    	String cmd="UPDATE tbl_vechicle SET device_imei_number='"+busRegistration.getDevice_imei_number()+"', driver_name='"+busRegistration.getDriver_name()+"', driver_licence_number='"+busRegistration.getDriver_licence_no()+"',driver_licence_exp_date='"+busRegistration.getDriver_licence_exp_date()+"',route_no='"+busRegistration.getRoute_no()+"' WHERE vechicle_reg_no='"+busRegistration.getVechicle_reg_no()+"'";
	    	String cmd1="UPDATE tbl_device_configuration SET is_assigned='1' where device_imei_number='"+busRegistration.getDevice_imei_number()+"'";
	    	String Desc="Update busRegistration "+busRegistration.getVechicle_reg_no();
	    	System.out.println(cmd);
	    	statement.execute(cmd);
	    	statement.execute(cmd1);
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
	
	
	// Get Route No for Student In Edit Page
	
	public List<String> getBusRegistrations_route_no(String org_name,String branch){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busregistration = new ArrayList<String>();
		try{
			resultSet = statement.executeQuery("SELECT route_no FROM tbl_vechicle WHERE org_id=(SELECT org_id FROM tbl_organization WHERE org_name='"+org_name+"' and branch='"+branch+"')");
			while(resultSet.next()){
				busregistration.add(resultSet.getString("route_no"));
				
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
	    return busregistration;
		
	}
	
	public List<BusRegistration> getBusregistration_by_org_id(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusRegistration> busregistration = new ArrayList<BusRegistration>();
		try{
			resultSet = statement.executeQuery("SELECT t1.org_id,t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id where t2.org_id='"+org_id+"'");
			while(resultSet.next()){
				busregistration.add(new BusRegistration(resultSet.getString("org_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("driver_name"),resultSet.getString("driver_licence_number"),resultSet.getString("driver_licence_exp_date")));
				
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
	    return busregistration;
		
	}
	
	public List<BusRegistration> clientdriverlistsearch(String org_id,String driver_name,String vechicle_reg_no,String driver_licence_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusRegistration> busregistration = new ArrayList<BusRegistration>();
		try{
			resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id where (driver_name='"+driver_name+"' or vechicle_reg_no='"+vechicle_reg_no+"' or driver_licence_number='"+driver_licence_number+"') and (t2.org_id='"+org_id+"' )");
			System.out.println("SELECT t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id where (driver_name='"+driver_name+"' or vechicle_reg_no='"+vechicle_reg_no+"' or driver_licence_number='"+driver_licence_number+"') and (t2.org_id='"+org_id+"')");
			while(resultSet.next()){
				busregistration.add(new BusRegistration(resultSet.getString("vechicle_reg_no"),resultSet.getString("driver_name"),resultSet.getString("driver_licence_number"),resultSet.getString("driver_licence_exp_date")));
				
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
	    return busregistration;
		
	}
	
	
	public List<String> getPickupStop_location(String pickup_route_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> routes=new ArrayList<String>();
		try{
			resultSet = statement.executeQuery("select address from tbl_bus_route where route_no='"+pickup_route_no+"'and trip=0");
			while(resultSet.next()){
		     routes.add(resultSet.getString("address"));
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
	
	
	public List<String> getDropStop_location(String drop_route_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> routes=new ArrayList<String>();
		try{
			resultSet = statement.executeQuery("select address from tbl_bus_route where route_no='"+drop_route_no+"'and trip=1");
			while(resultSet.next()){
		     routes.add(resultSet.getString("address"));
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
	public List<BusRegistration> findBus(String org_name,String branch,String vechicle_reg_no,String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusRegistration> busRegistrations = new ArrayList<BusRegistration>();
	    try{
	    	String cmd="SELECT t1.org_name,t1.branch,t2.vechicle_reg_no, t2.device_imei_number,t2.driver_name,t2.driver_licence_number,t2.driver_licence_exp_date from tbl_organization as t1 join tbl_vechicle as t2 on t1.org_id=t2.org_id where org_name='"+org_name+"' or branch='"+branch+"' or vechicle_reg_no='"+vechicle_reg_no+"'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				busRegistrations.add(new BusRegistration(resultSet.getString("org_name"),resultSet.getString("branch"),
						resultSet.getString("vechicle_reg_no"),resultSet.getString("device_imei_number"),resultSet.getString("driver_name"),
						resultSet.getString("driver_licence_number"),resultSet.getString("driver_licence_exp_date")));
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
	    return busRegistrations;
		
	}
	public int deleteBus(String bus_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
			
	    	 String cmd ="select gps_id from tbl_bus where bus_id='"+bus_id+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_bus where bus_id='"+bus_id+"'");
				
				flag=1;
				
		    }catch(Exception e){
		    	System.out.println(e.toString());
		    	flag=0;
		    	releaseResultSet(resultSet);
		    	releaseStatement(statement);
		    	releaseConnection(con);
		    }finally{
		    	
		    	releaseResultSet(resultSet);
		    	releaseStatement(statement);
		    	releaseConnection(con);	    	
		    }
		   		if(flag==1)
		   			return 1;
		   		else
		   			return 0;
		}
		
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

