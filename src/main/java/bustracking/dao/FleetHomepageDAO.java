package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


/*import bustracking.model.DeviceFail;*/
import bustracking.model.FleetHomepage;

public class FleetHomepageDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	
	public List<FleetHomepage> getFleethomedetails(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<FleetHomepage> fleetHomepages=new ArrayList<FleetHomepage>();
	    try{
			resultSet = statement.executeQuery("select device_status,vechicle_reg_no,address,speed,bus_tracking_timestamp,device_imei_number from (select t1.*,t2.device_imei_number,t2.device_status from tbl_vechicle_tracking_history as t1 join tbl_vechicle as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no order by bus_tracking_timestamp desc ) x group by vechicle_reg_no");
			while(resultSet.next()){
				fleetHomepages.add(new FleetHomepage(resultSet.getString("device_status"),resultSet.getString("vechicle_reg_no"),resultSet.getString("address"),resultSet.getString("speed"),resultSet.getString("bus_tracking_timestamp"),resultSet.getString("device_imei_number")));
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
	    return fleetHomepages;
		
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
