package bustracking.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import bustracking.model.ClientHome;
import bustracking.model.OrgRegistration;
import bustracking.model.SuperAdminHome;


public class ClientHomeDAO{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource= dataSource;
	}
	public List<ClientHome> getClienthome(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//Home List View
		List<ClientHome> clienthome = new ArrayList<ClientHome>();
		try{
			
			resultSet = statement.executeQuery("select device_status,vechicle_reg_no,address,speed,bus_tracking_timestamp,device_imei_number from (select t1.*,t2.device_imei_number,t2.device_status from tbl_vechicle_tracking_history as t1 join tbl_vechicle as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.org_id='"+org_id+"' order by bus_tracking_timestamp desc ) x group by vechicle_reg_no");
			while(resultSet.next()){
				clienthome.add(new ClientHome(resultSet.getString("device_status"),resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"),resultSet.getString("bus_tracking_timestamp"),resultSet.getString("device_imei_number")));
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
	    return clienthome;
		
	}
	
	// Search operation For Client home
	
public List<ClientHome> findclienthome( String org_id , String vechicle_reg_no){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ClientHome> clientHome=new ArrayList<ClientHome>();
	    try{
			resultSet = statement.executeQuery("select device_status,vechicle_reg_no,address,speed,bus_tracking_timestamp,device_imei_number from (select t1.*,t2.device_imei_number,t2.device_status from tbl_vechicle_tracking_history as t1 join tbl_vechicle as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.org_id='"+org_id+"' and t1.vechicle_reg_no='"+vechicle_reg_no+"' order by bus_tracking_timestamp desc ) x group by vechicle_reg_no");
			while(resultSet.next()){
				clientHome.add(new ClientHome(resultSet.getString("device_status"),resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"),resultSet.getString("bus_tracking_timestamp"),resultSet.getString("device_imei_number")));
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
	    return clientHome;
	}
	
	
   /*
    * Vehicle Information In client side 
    * 
    */

public List<ClientHome> vechicle_traveled_information( String org_id){
	
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ClientHome> clientVechicle=new ArrayList<ClientHome>();
    try{
		resultSet = statement.executeQuery("select t2.last_message_send_pick,t2.vechicle_reg_no,t1.route_no,t1.stop_id,t1.address,t1.trip,t2.reached,t2.is_pick_message_send from tbl_bus_route as t1 join tbl_message_log as t2 on t1.route_no=t2.route_no where t1.stop_id=t2.stop_id and org_id='"+org_id+"'");
		while(resultSet.next()){
			
			clientVechicle.add(new ClientHome(resultSet.getString("last_message_send_pick"),resultSet.getString("vechicle_reg_no"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("address"),resultSet.getString("trip"),resultSet.getString("reached"),resultSet.getString("is_pick_message_send")));
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
    return clientVechicle;
}

/*
 * Vehicle Reg No For Vehicle Information Search
 * 
 */

public List<ClientHome> vechicle_reg_no_for_vechicle_information(String org_id){
	
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ClientHome> clientVechicle=new ArrayList<ClientHome>();
    try{
		resultSet = statement.executeQuery("select vechicle_reg_no from tbl_vechicle where org_id='"+org_id+"'");
		while(resultSet.next()){
			
			clientVechicle.add(new ClientHome(resultSet.getString("vechicle_reg_no")));
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
    return clientVechicle;
}


/*
 * Vehicle Information Search In client side 
 * 
 */

public List<ClientHome> vechicle_information_search(String org_id,String vechicle_reg_no,String from_date,String to_date){
	
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ClientHome> clientVechicle=new ArrayList<ClientHome>();
    try{
		resultSet = statement.executeQuery("select t2.last_message_send_pick,t2.vechicle_reg_no,t1.route_no,t1.stop_id,t1.address,t1.trip,t2.reached,t2.is_pick_message_send from tbl_bus_route as t1 join tbl_message_log as t2 on t1.route_no=t2.route_no where t1.stop_id=t2.stop_id and org_id='"+org_id+"' and t2.vechicle_reg_no='"+vechicle_reg_no+"' and (t2.last_message_send_pick>='"+from_date+"'and t2.last_message_send_pick<='"+to_date+"')");
		while(resultSet.next()){
			
			clientVechicle.add(new ClientHome(resultSet.getString("last_message_send_pick"),resultSet.getString("vechicle_reg_no"),resultSet.getString("route_no"),resultSet.getString("stop_id"),resultSet.getString("address"),resultSet.getString("trip"),resultSet.getString("reached"),resultSet.getString("is_pick_message_send")));
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
    return clientVechicle;
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