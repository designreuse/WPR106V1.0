package bustracking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import bustracking.model.ClassSection;

public class ClassSectionDAO
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public int insert_classsection(ClassSection classSection){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String role="";
		int result=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			String sql="Select * from tbl_class where org_id='"+classSection.getOrg_id()+"'and class='"+classSection.getClass_std()+"' and section='"+classSection.getSection()+"'";
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
			{
				result=1;
			}
			else
			{		
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_class(org_id,class,section,service) values(?,?,?,?)");
			
			preparedStatement.setString(1,classSection.getOrg_id());
			preparedStatement.setString(2,classSection.getClass_std());
			preparedStatement.setString(3,classSection.getSection());
			preparedStatement.setString(4,classSection.getService());
			
			if(preparedStatement.execute())
				result=2;
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
	    return result;
		
	}
	public List<ClassSection> get_classsection(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		int result=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ClassSection> classSections=new ArrayList<ClassSection>();
		try{
			String sql="Select t1.org_name,t1.branch,t2.class,t2.section,t2.service from tbl_organization as t1 join tbl_class as t2 ON t1.org_id=t2.org_id;";
			resultSet=statement.executeQuery(sql);
		
			
			while(resultSet.next())
			{
				classSections.add(new ClassSection(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("class"),resultSet.getString("section"),resultSet.getString("service")));
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
	    return classSections;
		
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