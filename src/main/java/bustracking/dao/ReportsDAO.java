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
