package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.joda.time.DateTime;

import bustracking.model.AdminSettings;
import bustracking.model.BusDeviceRegistration;
import bustracking.model.ParticipantsDetails;

public class AdminSettingsDAO
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<ParticipantsDetails> getParticipants(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
			resultSet = statement.executeQuery("select * from participants_table");
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	public int insertsettings(AdminSettings adminSettings){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try{
			DateTime date=new DateTime();
			String cmd_insert_busdevice="insert into tbl_org_business_rule values('12','13','"+adminSettings.getSms_enabled()+"','"+adminSettings.getSms_type()+"','"+adminSettings.getTime_before()+"','"+adminSettings.getAcceptable_delay()+"','"+adminSettings.getSpeed_limit()+"','"+date.toString()+"','"+adminSettings.getPickup_end_time()+"','"+adminSettings.getPickup_end_time()+"','"+adminSettings.getDrop_start_time()+"','"+adminSettings.getDrop_end_time()+"','"+adminSettings.getHolidays()+"','"+adminSettings.getSaturday()+"')";
			statement.execute(cmd_insert_busdevice);
			
		
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
	    return 1;
		
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