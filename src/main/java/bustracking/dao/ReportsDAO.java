package bustracking.dao;

import java.awt.Font;
import java.net.InetAddress;
import java.security.Principal;
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

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

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


public class ReportsDAO extends AbstractExcelView{
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
	
	
	/*
	 * Get Student Roll No for Client Side SMS Track Search 
	 * 
	 */
	
	public List<Report> getStudent_roll_no_for_clienttrack_sms(String org_id){
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
			
			resultSet = statement.executeQuery("select student_roll_no,mobile_number from tbl_sms_tracking where org_id='"+org_id+"' group by student_roll_no");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("student_roll_no"),resultSet.getString("mobile_number")));
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
	
	
	
	// Client Side SMS Report Search
	public List<Report> getclientsmsreport_search(String org_id,String student_roll_no,String fromdate,String todate){
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
			
			resultSet = statement.executeQuery("select t1.org_name,t1.branch,t2.org_id,t2.student_roll_no,t2.sms_trigger_time_stamp,t2.status,t2.mobile_number from tbl_organization as t1 join tbl_sms_tracking as t2 on t1.org_id=t2.org_id where student_roll_no='"+student_roll_no+"' or (date(t2.sms_trigger_time_stamp) >='"+fromdate+"'  and  date(t2.sms_trigger_time_stamp)<='"+todate+"') and t2.org_id='"+org_id+"'");
			System.out.println("select t1.org_name,t1.branch,t2.org_id,t2.student_roll_no,t2.sms_trigger_time_stamp,t2.status,t2.mobile_number from tbl_organization as t1 join tbl_sms_tracking as t2 on t1.org_id=t2.org_id where student_roll_no='"+student_roll_no+"' or (date(t2.sms_trigger_time_stamp) >='"+fromdate+"'  and  date(t2.sms_trigger_time_stamp)<='"+todate+"') and t2.org_id='"+org_id+"'");
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
	
	
	//For admin sms track excel export
	/**
	 * Excel Sheet Generation
	 */
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HSSFSheet excelSheet = workbook.createSheet("Report");
		excelSheet.setDefaultColumnWidth(20);
		  
		//Style 1
		CellStyle style = workbook.createCellStyle();
	        HSSFFont font = workbook.createFont();
	        font.setFontName("Arial");
	        style.setFillForegroundColor(HSSFColor.BLUE_GREY.index);
	        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style.setWrapText(true);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);
		
	    //Style2
	        CellStyle style2 = workbook.createCellStyle();
	        HSSFFont font2 = workbook.createFont();
	        font2.setFontName("Arial");
	        style2.setFillForegroundColor(HSSFColor.YELLOW.index);
	        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style2.setWrapText(true);
	        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font2.setColor(HSSFColor.WHITE.index);
	        style2.setFont(font2); 
		
		@SuppressWarnings("unchecked")
		List<Report> reports = (List<Report>) model.get("reports");
		String[] fields=(String[])model.get("fields");
		String content=(String) model.get("content");

        setExcelHeader(excelSheet,style,fields);
		
        if(content.equals("admin_sms_track"))
        	setExcelRows_admin_sms_track(excelSheet,reports,fields,style2);
        else if(content.equals("client_sms_track"))
           setExcelRows_client_sms_track(excelSheet, reports, fields, style2);
        else if(content.equals("over_speed_report"))
            setExcelRows_over_speed_report(excelSheet, reports, fields, style2);
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
		int i=0;
		for (String field : fields) {
			
				excelHeader.createCell(i).setCellValue(field);
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			
		
	
	}
	
	
	//End
	
	public void setExcelRows_admin_sms_track(HSSFSheet excelSheet, List<Report> reports,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (Report report:reports){	
			i=0;
			HSSFRow excelRow = excelSheet.createRow(record++);
				//excelRow.setRowStyle((HSSFCellStyle) style2);
				excelRow.createCell(i).setCellValue(report.getOrg_name());
				i++;
				excelRow.createCell(i).setCellValue(report.getBranch());
				i++;
				excelRow.createCell(i).setCellValue(report.getStudent_roll_no());
				i++;
				excelRow.createCell(i).setCellValue(report.getMobile_number());
				i++;
				excelRow.createCell(i).setCellValue(report.getSms_trigger_time());
				i++;
				excelRow.createCell(i).setCellValue(report.getStatus());

		}
	}
	
	public void setExcelRows_client_sms_track(HSSFSheet excelSheet, List<Report> reports,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (Report report:reports){	
			i=0;
			HSSFRow excelRow = excelSheet.createRow(record++);
				//excelRow.setRowStyle((HSSFCellStyle) style2);
				excelRow.createCell(i).setCellValue(report.getStudent_roll_no());
				i++;
				excelRow.createCell(i).setCellValue(report.getMobile_number());
				i++;
				excelRow.createCell(i).setCellValue(report.getSms_trigger_time());
				i++;
				excelRow.createCell(i).setCellValue(report.getStatus());

		}
	}
	
	/*
	 * Over Speed Report Excel
	 * 
	 */
	
	public void setExcelRows_over_speed_report(HSSFSheet excelSheet, List<Report> reports,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (Report report:reports){	
			i=0;
			HSSFRow excelRow = excelSheet.createRow(record++);
				//excelRow.setRowStyle((HSSFCellStyle) style2);
				excelRow.createCell(i).setCellValue(report.getVechicle_reg_no());
				i++;
				excelRow.createCell(i).setCellValue(report.getDriver_name());
				i++;
				excelRow.createCell(i).setCellValue(report.getOver_speed_count());
				i++;
				excelRow.createCell(i).setCellValue(report.getBus_tracking_timestamp());
				
			

		}
	}
	
	
	
	/*
	 * Over Speed Report At Client Side
	 * 
	 */
	
	
	public List<Report> getoverspeedreport(String org_id){
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
			
			resultSet = statement.executeQuery("Select org_id,vechicle_reg_no,count(exceed_speed_limit) as over_speed_count from tbl_vechicle_tracking_history where org_id='"+org_id+"' and exceed_speed_limit='1'");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("org_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("over_speed_count")));
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
	
	/*
	 * 
	 * Get Vehicle Registration Number for Over Speed Report
	 * 
	 */
	
	public List<Report> getvechicle_reg_no_for_over_speed_report(String org_id){
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
			
			resultSet = statement.executeQuery("Select vechicle_reg_no from tbl_vechicle where org_id='"+org_id+"'");
			
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("vechicle_reg_no")));
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
	
	/*
	 * Search operation in Over Speed Report Client Side
	 * 
	 */
	
	
	public List<Report> search_over_speed_report_(String org_id,String vechicle_reg_no,String from_date,String from_time,String to_date,String to_time){
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
			
			resultSet = statement.executeQuery("Select org_id,vechicle_reg_no, count(exceed_speed_limit) as over_speed_count from tbl_vechicle_tracking_history where  org_id='"+org_id+"' and vechicle_reg_no='"+vechicle_reg_no+"' and exceed_speed_limit='1' and (bus_tracking_timestamp>='"+from_date+" "+from_time+"' and bus_tracking_timestamp<='"+to_date+" "+to_time+"')");
			System.out.println("Select org_id,vechicle_reg_no, count(exceed_speed_limit) as over_speed_count from tbl_vechicle_tracking_history where  org_id='"+org_id+"' and vechicle_reg_no='"+vechicle_reg_no+"' and exceed_speed_limit='1' and (bus_tracking_timestamp>='"+from_date+" "+from_time+"' and bus_tracking_timestamp<='"+to_date+" "+to_time+"')");
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("org_id"),resultSet.getString("vechicle_reg_no"),resultSet.getString("over_speed_count")));
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
	
	
	/*
	 * Download/Export Over Speed Report Client Side
	 * 
	 */
	
	public List<Report> export_overspeedreport(String org_id){
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
			
			resultSet = statement.executeQuery("Select t2.driver_name,t1.org_id,t1.vechicle_reg_no,count(t1.exceed_speed_limit) as over_speed_count,bus_tracking_timestamp from tbl_vechicle_tracking_history as t1 join tbl_vechicle as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.org_id='"+org_id+"' and t1.exceed_speed_limit='1'");
			System.out.println("Select t2.driver_name,t1.org_id,t1.vechicle_reg_no,count(t1.exceed_speed_limit) as over_speed_count,bus_tracking_timestamp from tbl_vechicle_tracking_history as t1 join tbl_vechicle as t2 on t1.vechicle_reg_no=t2.vechicle_reg_no where t1.org_id='"+org_id+"' and t1.exceed_speed_limit='1'");
			while(resultSet.next())
					{
					reportForms.add(new Report(resultSet.getString("vechicle_reg_no"),resultSet.getString("driver_name"),resultSet.getString("over_speed_count"),resultSet.getString("bus_tracking_timestamp")));
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
