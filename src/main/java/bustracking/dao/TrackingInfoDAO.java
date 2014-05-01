package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


import bustracking.model.Trackinginfo;
import bustracking.model.LatLong;;

public class TrackingInfoDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	/*public List<Trackinginfo> getTrackingInfo(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Trackinginfo> trackinginfo = new ArrayList<Trackinginfo>();
	    try{
			//resultSet = statement.executeQuery("select * from tbl_tracking_info");
	    	//resultSet = statement.executeQuery("select latitude,longitude from tbl_tracking_info where deviceID='359710042476300' and date_format(from_unixtime(timestamp),'%d-%m-%Y')='15-03-2014'");
	    	resultSet = statement.executeQuery("select * from tbl_tracking_info where device_id='"+device_imei_number+"'");
			while(resultSet.next()){
				trackinginfo.add(new Trackinginfo(resultSet.getString("latitude"),resultSet.getString("langitude")));
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
	    return trackinginfo;
		
	}*/
	
	
	public List<LatLong> getLiveTrackingInfo(String device_imei_number,String date){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<LatLong> latLongs=new ArrayList<LatLong>();
	    try{
			//resultSet = statement.executeQuery("select * from tbl_tracking_info");
	    	//resultSet = statement.executeQuery("select latitude,longitude from tbl_tracking_info where deviceID='359710042476300' and date_format(from_unixtime(timestamp),'%d-%m-%Y')='15-03-2014'");
	    	resultSet = statement.executeQuery("select t1.vechicle_reg_no,t1.device_imei_number,t2.* from tbl_vechicle as t1 join tbl_vechicle_tracking_history as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.device_imei_number='"+device_imei_number+"' and bus_tracking_timestamp > DATE_SUB(STR_TO_DATE('"+date+"', '%Y-%m-%d %H:%i:%s'),INTERVAL '00:30' MINUTE_SECOND)");
			
	    	while(resultSet.next()){
				//trackinginfo.add(new Trackinginfo(resultSet.getString("latitude"),resultSet.getString("langitude")));
				latLongs.add(new LatLong(resultSet.getString("latitude"), resultSet.getString("longitude"),resultSet.getString("speed"),resultSet.getString("address"),resultSet.getString("bus_tracking_timestamp")));
				//latLongs.get(0).getLatitude();
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
	    return latLongs;
		
	}
	public List<LatLong> getTrackingInfo(String device_imei_number,String date){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<LatLong> latLongs=new ArrayList<LatLong>();
	    try{
			//resultSet = statement.executeQuery("select * from tbl_tracking_info");
	    	resultSet = statement.executeQuery("select t1.vechicle_reg_no,t1.device_imei_number,t2.* from tbl_vechicle as t1 join tbl_vechicle_tracking_history as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.device_imei_number='"+device_imei_number+"' and bus_tracking_timestamp like '"+date+"%'");
	    		
	    	while(resultSet.next()){
				//trackinginfo.add(new Trackinginfo(resultSet.getString("latitude"),resultSet.getString("langitude")));
				latLongs.add(new LatLong(resultSet.getString("latitude"), resultSet.getString("longitude"),resultSet.getString("speed"),resultSet.getString("address"),resultSet.getString("bus_tracking_timestamp")));
				//latLongs.get(0).getLatitude();
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
	    return latLongs;
		
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
