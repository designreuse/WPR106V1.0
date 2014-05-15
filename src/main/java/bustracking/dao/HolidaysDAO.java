package bustracking.dao;

import java.util.*;
import java.sql.*;
import java.lang.*;

import javax.sql.DataSource;

import bustracking.model.Holidays;


public class HolidaysDAO{
	
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	// Insert Holidays
	
	public int insert_holiday(Holidays holiday){
		
		Connection con=null;
		Statement statement=null;
		int status=0;
		try{
			con=dataSource.getConnection();
			statement=con.createStatement();
		}catch(SQLException e1){
			
			e1.printStackTrace();
		}
		
		try{
			String cmd_insert = "insert into tbl_holidays(org_id,holiday_date,holiday_reason) values('"+holiday.getOrg_id()+"','"+holiday.getHoliday_date()+"','"+holiday.getHoliday_reason()+"')";
			statement.execute(cmd_insert);
			} catch (Exception e) {
		System.out.println(e.toString());
		
		releaseStatement(statement);
		releaseConnection(con);
			
		}
		finally {
			
			releaseStatement(statement);
			releaseConnection(con);
		}

		
		return status;
	}
	
	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}
	
}