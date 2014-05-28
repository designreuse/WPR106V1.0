package bustracking.dao;

import java.util.*;
import java.sql.*;
import java.awt.print.Printable;
import java.lang.*;

import javax.sql.DataSource;

import bustracking.model.Holidays;
import bustracking.model.OrgBusinessRule;


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
	
	// View Holidays Information
	
	public List<Holidays> getHolidays_client(String org_id){
		Connection con=null;
		Statement statement=null;
ResultSet resultSet=null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} 
		catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Holidays> holidays=new ArrayList<Holidays>();
		{	
				try{
					
					String cmd="Select t1.*,t2.org_name,t2.branch from tbl_holidays as t1 join tbl_organization as t2 on t1.org_id=t2.org_id where t1.org_id='"+org_id+"'";
					resultSet=statement.executeQuery(cmd);
					while(resultSet.next())
					{
						holidays.add(new Holidays(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("holiday_date"),resultSet.getString("holiday_reason")));
					
					}
				}

					catch(Exception e){
				        System.out.println(e.toString());
				        	releaseResultSet(resultSet);
				        	releaseStatement(statement);
				        	releaseConnection(con);
				        }finally{
				        	releaseResultSet(resultSet);
				        	releaseStatement(statement);
				        	releaseConnection(con);	    	
				        }
		}
		return holidays;
	
		
	}
	
	// Search Holidays
	
	public List<Holidays> findHolidays(String org_name,String branch,String holiday_date){
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Holidays> holidays = new ArrayList<Holidays>();
	    try{
	    	String cmd="Select t2.*,t1.org_name,t1.branch from tbl_organization as t1 join tbl_holidays as t2 ON t1.org_id=t2.org_id where org_name='"+org_name+"' or branch='"+branch+"' or holiday_date='"+holiday_date+"'";
			
	    	resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				holidays.add(new Holidays(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("holiday_date"),resultSet.getString("holiday_reason")));
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
	    return holidays;
		
		
		
	}
	
	
	// Delete Holidays
	
	public int deleteHolidays(String org_name,String branch,String holiday_date){
		
		int flag=0;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try{
			con=dataSource.getConnection();
			statement=con.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		try{
			String cmd="select *from tbl_holidays where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and holiday_date='"+holiday_date+"'";
			System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			
			if(resultSet.next())
				statement.execute("delete from tbl_holidays where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and holiday_date='"+holiday_date+"'");
				System.out.println("delete from tbl_holidays where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and holiday_date='"+holiday_date+"'");
			
			flag=1;
		}
		catch(Exception e)
		{
			releaseResultSet(resultSet);
        	releaseStatement(statement);
        	releaseConnection(con);
		}
		finally{
			releaseResultSet(resultSet);
        	releaseStatement(statement);
        	releaseConnection(con);
		}
		return flag;
	}
	
	// View Holiday Client Side
	
	public List<Holidays> getHolidays(){
		Connection con=null;
		Statement statement=null;
ResultSet resultSet=null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} 
		catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Holidays> holidays=new ArrayList<Holidays>();
		{	
				try{
					System.out.println("this is another hai");
					String cmd="Select t1.holiday_date,t1.holiday_reason,t2.org_name,t2.branch from tbl_holidays as t1 join tbl_organization as t2 on t1.org_id=t2.org_id";
					resultSet=statement.executeQuery(cmd);
					while(resultSet.next())
					{
						holidays.add(new Holidays(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("holiday_date"),resultSet.getString("holiday_reason")));
					
					}
				}

					catch(Exception e){
				        System.out.println(e.toString());
				        	releaseResultSet(resultSet);
				        	releaseStatement(statement);
				        	releaseConnection(con);
				        }finally{
				        	releaseResultSet(resultSet);
				        	releaseStatement(statement);
				        	releaseConnection(con);	    	
				        }
		}
		return holidays;
	
		
	}
	

	// Search Holidays in Client Side
	
	public List<Holidays> clientfindHolidays(String holiday_date,String org_id){
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Holidays> holidays = new ArrayList<Holidays>();
	    try{
	    	String cmd="Select t2.*,t1.org_name,t1.branch from tbl_organization as t1 join tbl_holidays as t2 ON t1.org_id=t2.org_id where t2.holiday_date='"+holiday_date+"' and t2.org_id='"+org_id+"'";
			
	    	resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				holidays.add(new Holidays(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("holiday_date"),resultSet.getString("holiday_reason")));
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
	    return holidays;
		
	}
	
	// Delete holidays in client side
	
public int clientdeleteHolidays(String holiday_date,String org_id){
		
		int flag=0;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try{
			con=dataSource.getConnection();
			statement=con.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		try{
			String cmd="select *from tbl_holidays where holiday_date='"+holiday_date+"' and org_id='"+org_id+"'";
			System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			
			if(resultSet.next())
				statement.execute("delete from tbl_holidays where holiday_date='"+holiday_date+"' and org_id='"+org_id+"'");
				System.out.println("delete from tbl_holidays where holiday_date='"+holiday_date+"'and org_id='"+org_id+"'");
			
			flag=1;
		}
		catch(Exception e)
		{
			releaseResultSet(resultSet);
        	releaseStatement(statement);
        	releaseConnection(con);
		}
		finally{
			releaseResultSet(resultSet);
        	releaseStatement(statement);
        	releaseConnection(con);
		}
		return flag;
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