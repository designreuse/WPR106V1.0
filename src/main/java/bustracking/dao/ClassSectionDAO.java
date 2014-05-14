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
				classSections.add(new ClassSection(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("class_std"),resultSet.getString("section"),resultSet.getString("service")));
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
	
	//Get Class For Edit operation in Admin Side
	
public List<String> getclass_for_edit(String org_name,String branch){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> class_std = new ArrayList<String>();
		try{
			resultSet = statement.executeQuery("SELECT class FROM tbl_class WHERE org_id=(SELECT org_id FROM tbl_organization WHERE org_name='"+org_name+"' and branch='"+branch+"')");
			while(resultSet.next()){
				class_std.add(resultSet.getString("class"));
				
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
	    return class_std;
		
	}
	
	
	
	
//search class and section 06/05/2014
	public List<ClassSection> view_classsection(String org_name , String branch,String class_std,String section){
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
			String sql="Select t1.org_name,t1.branch,t2.class,t2.section,t2.service from tbl_organization as t1 join tbl_class as t2 ON t1.org_id=t2.org_id where org_name='"+org_name+"' or branch='"+branch+"' or class='"+class_std+"' or section='"+section+"';";
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
	
	
	
	
	// Edit Class and Section 
	
	public List<ClassSection> edit_classsection(String org_name , String branch){
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
		List<ClassSection> classSection=new ArrayList<ClassSection>();
		try{
			String sql="Select t1.org_name,t1.branch,t2.class,t2.section,t2.service from tbl_organization as t1 join tbl_class as t2 ON t1.org_id=t2.org_id where org_name='"+org_name+"' and branch='"+branch+"'";
			resultSet=statement.executeQuery(sql);
		
			
			while(resultSet.next())
			{
				classSection.add(new ClassSection(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("class"),resultSet.getString("section"),resultSet.getString("service")));
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
	    return classSection;
		
	}
	
	
	// Update Class and Section by TD
	
	public int update_classsection(ClassSection class_standard){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			String sql="UPDATE tbl_class SET service='"+class_standard.getService()+"' where class='"+class_standard.getClass_std()+"' and section='"+class_standard.getSection()+"'";
			statement.execute(sql);
			System.out.println(sql);
			flag=1;
			
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
		
		if(flag==1)
			return 1;
		else
			return 0;
			
	}
	
	// Delete Class and Section
	
	public int deleteclass(String org_name,String branch,String class_std,String section){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
			
	    	 String cmd ="select * from tbl_class where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and class='"+class_std+"' and section='"+section+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_class where where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"') and class='"+class_std+"' and section='"+section+"'");
				
				flag=1;
				
		    }catch(Exception e){
		    	System.out.println(e.toString());
		    	flag=0;
		    	releaseResultSet(resultSet);
		    	releaseStatement(statement);
		    	releaseConnection(con);
		    }finally{
		    	
		    	releaseResultSet(resultSet);
		    	releaseStatement(statement);
		    	releaseConnection(con);	    	
		    }
		   		if(flag==1)
		   			return 1;
		   		else
		   			return 0;
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