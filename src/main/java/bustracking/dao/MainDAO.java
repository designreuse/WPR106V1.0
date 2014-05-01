package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


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
