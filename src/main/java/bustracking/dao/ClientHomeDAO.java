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
				clienthome.add(new ClientHome(resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"),resultSet.getString("bus_tracking_timestamp"),resultSet.getString("device_imei_number")));
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
			resultSet = statement.executeQuery("SELECT * from tbl_vechicle_tracking_history where bus_tracking_timestamp in (select max(bus_tracking_timestamp) from tbl_vechicle_tracking_history where org_id='"+org_id+"' and vechicle_reg_no='"+vechicle_reg_no+"' group by vechicle_reg_no) order by vechicle_reg_no desc,bus_tracking_timestamp desc;");
			while(resultSet.next()){
				clientHome.add(new ClientHome(resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"), resultSet.getString("bus_tracking_timestamp"),resultSet.getString("device_imei_number")));
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