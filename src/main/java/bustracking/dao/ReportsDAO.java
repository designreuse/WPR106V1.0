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
import bustracking.model.Report;
import bustracking.forms.ReportForm;




/*import bustracking.model.DeviceFail;*/


public class ReportsDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Report> getTracksmsreport(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Report> reportForms=new ArrayList<Report>();
		try{
			
			resultSet = statement.executeQuery("select * from tbl_sms_tracking where org_id='"+org_id+"'");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("org_id"), resultSet.getString("student_roll_no"),resultSet.getString("sms_trigger_time_stamp"), resultSet.getString("status"),resultSet.getString("mobile_number")));
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
	    return reportForms;
		
	}
	
	// SMS Reports in Admin Side
	
	public List<Report> getsmsreport(String org_name,String branch,String student_roll_no,String fromdate,String todate){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Report> reportForms=new ArrayList<Report>();
		try{
			
			resultSet = statement.executeQuery("select t1.org_name,t1.branch,t2.org_id,t2.student_roll_no,t2.sms_trigger_time_stamp,t2.status,t2.mobile_number from tbl_organization as t1 join tbl_sms_tracking as t2 on t1.org_id=t2.org_id where t1.org_id=(select  org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and student_roll_no='"+student_roll_no+"' and(date(t2.sms_trigger_time_stamp) >='"+fromdate+"'  and  date(t2.sms_trigger_time_stamp)<='"+todate+"')");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"), resultSet.getString("student_roll_no"),resultSet.getString("sms_trigger_time_stamp"), resultSet.getString("status"),resultSet.getString("mobile_number")));
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
	    return reportForms;
		
	}
	
	
	// Admin Side SMS Report
	
	public List<Report> getsmsreport_for_download(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Report> reportForms=new ArrayList<Report>();
		try{
			
			resultSet = statement.executeQuery("select t1.org_name,t1.branch,t2.org_id,t2.student_roll_no,t2.sms_trigger_time_stamp,t2.status,t2.mobile_number from tbl_organization as t1 join tbl_sms_tracking as t2 on t1.org_id=t2.org_id");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"), resultSet.getString("student_roll_no"),resultSet.getString("sms_trigger_time_stamp"), resultSet.getString("status"),resultSet.getString("mobile_number")));
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
	    return reportForms;
		
	}
	
	// Get Student Roll No for Admin SMS Report
	
	public List<String> get_student_roll_no(String org_name,String branch){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> student_roll_no=new ArrayList<String>();
		try{
			
			String cmd_sql="Select student_roll_no from tbl_student where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"')";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				student_roll_no.add(resultSet.getString("student_roll_no"));
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
	    return student_roll_no;
		
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
