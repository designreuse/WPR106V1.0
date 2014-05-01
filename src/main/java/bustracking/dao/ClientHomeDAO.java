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
		
		List<ClientHome> clienthome = new ArrayList<ClientHome>();
		try{
			System.out.println("welcome to client home");
			resultSet = statement.executeQuery("SELECT * from tbl_vechicle_tracking_history where bus_tracking_timestamp in (select max(bus_tracking_timestamp) from tbl_vechicle_tracking_history where org_id='"+org_id+"' group by vechicle_reg_no) order by vechicle_reg_no desc,bus_tracking_timestamp desc;");
			while(resultSet.next()){
				clienthome.add(new ClientHome(resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"),resultSet.getString("bus_tracking_timestamp")));
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