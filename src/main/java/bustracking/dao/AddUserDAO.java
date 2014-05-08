package bustracking.dao;

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

import bustracking.forms.AddUserForm;
import bustracking.model.AddUser;
import bustracking.model.OrgRegistration;
import bustracking.model.StudentRegistration;

public class AddUserDAO{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource= dataSource;
	}
	public int insert_user(AddUser user)
	{
		Connection con=null;
		Statement statement=null;
       
        int flag=0;
        try
        {
        	con= dataSource.getConnection();
        	statement=con.createStatement();
        }
        catch(SQLException e)
        {
        	e.printStackTrace();
        }
        
        try{
        	String type="";
        	String cmd_type="select * from tbl_organization where org_id='"+user.getOrg_id()+"'";
        	ResultSet resultSet;
        	resultSet=statement.executeQuery(cmd_type);
        	if(resultSet.next())
        	{
        		type=resultSet.getString("type_of_organization");
        	}
        	

        	/*PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_user(firstname,lastname,email,username,password,confirm_password,enabled,role) values(?,?,?,?,?,?,?,?)");
        	preparedStatement.setString(1,user.getFirstname());
        	preparedStatement.setString(2,user.getLastname());
        	preparedStatement.setString(3,user.getEmail());
        	preparedStatement.setString(4,user.getUsername());
        	preparedStatement.setString(5,user.getPassword());
        	preparedStatement.setString(6,user.getConfirm_password());
        	preparedStatement.setInt(7,1);
        	preparedStatement.setString(8,"ROLE_ADMIN");*/
	
        	
        	
        	PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_user(org_id,firstname,lastname,email,username,password,confirm_password,enabled,role) values(?,?,?,?,?,?,?,?,?)");
        	
        	preparedStatement.setString(1,user.getOrg_id());
        	preparedStatement.setString(2,user.getFirstname());
        	preparedStatement.setString(3,user.getLastname());
        	preparedStatement.setString(4,user.getEmail());
        	preparedStatement.setString(5,user.getUsername());
        	preparedStatement.setString(6,user.getPassword());
        	preparedStatement.setString(7,user.getConfirm_password());
        	preparedStatement.setInt(8,1);
        		if(type.equals("School")||type.equals("College")||type.equals("School & College"))
        			preparedStatement.setString(9,"ROLE_ADMIN");
        		else
        			preparedStatement.setString(9,"ROLE_FCLIENT");

        	preparedStatement.execute();
        }
        catch(Exception e)
        {
        	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    }finally{
	    	
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		if(flag==1)
    		return 1;
    	else
    		return 0;
        
	}
	
	/*public List<String> getBus_id(String org_name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busRegistrations = new ArrayList<String>();
	    try{
	    	String cmd="select branch from tbl_organization where org_name='"+org_name+"'";
	    	//System.out.println(org_id);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegistrations.add(resultSet.getString("branch"));
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
	        return busRegistrations;
	    }
	
	public List<String> getorgname(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> busRegister = new ArrayList<String>();
	    try{
	    	String cmd="select DISTINCT org_name from tbl_organization";
	    	//System.out.println(org_name);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegister.add(resultSet.getString("org_name"));
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
	        return busRegister;
	    }
*/
	
	public Long getMax_adminReg(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		Long MaxID=2014100001L;
		try{
			
			resultSet = statement.executeQuery("select max(admin_reg_no) as max_reg from tbl_user");
			while(resultSet.next()){
				MaxID=Long.parseLong(resultSet.getString("max_reg"))+1;
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
	    return MaxID;
		
	}
	public boolean check_user_name(AddUser addUser){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		int count=0;
		try{
			
			resultSet = statement.executeQuery("select * from tbl_user where username='"+addUser.getUsername()+"'");
			if(resultSet.next())
			{
				count=1;
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
	    if(count==1)
	    	return false;
	    else
	    	return true;
	    
		
	}
	
	
	public List<AddUser> getAdduser(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<AddUser> adduserform = new ArrayList<AddUser>();
		try{
			System.out.println("hi");
			resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.firstname,t2.lastname,t2.email,t2.username,t2.password from tbl_organization as t1 join tbl_user as t2 on t1.org_id=t2.org_id");
			while(resultSet.next()){
				adduserform.add(new AddUser(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("firstname"),resultSet.getString("lastname"),resultSet.getString("email"),resultSet.getString("username"),resultSet.getString("password")));
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
	    return adduserform;
		
	}
	
	// Get Users For Edit
	
	public List<AddUser> getUsers(String username)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<AddUser> adduser=new ArrayList<AddUser>();
		{
		try
		{
			String cmd="SELECT t1.org_name,t1.branch,t2.firstname,t2.lastname,t2.email,t2.username,t2.password,t2.confirm_password from tbl_organization as t1 join tbl_user as t2 on t1.org_id=t2.org_id where t2.username='"+username+"'";
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next())
			{
				adduser.add(new AddUser(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("firstname"),resultSet.getString("lastname"),resultSet.getString("email"),resultSet.getString("username"),resultSet.getString("password"),resultSet.getString("confirm_password")));
			System.out.print(username);
			}
		}
			catch(Exception e){
		        System.out.println(e.toString());
		        	releaseResultSet(resultSet);
		        	releaseStatement(statement);
		        	releaseConnection(con);
		        }
		finally{
		        	releaseResultSet(resultSet);
		        	releaseStatement(statement);
		        	releaseConnection(con);	    	
		        }
		        
		    
		}
		return adduser;
	}
	
	
	// Update User Info
	
	public int updateUser(AddUser user)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	    try{
	    	String cmd="UPDATE tbl_user SET firstname='"+user.getFirstname()+"',lastname='"+user.getLastname()+"',email='"+user.getEmail()+"',password='"+user.getPassword()+"',confirm_password='"+user.getConfirm_password()+"' WHERE username='"+user.getUsername()+"'";
	    	//String Desc="Update user "+user.getAdmin_reg_no();
	    	System.out.println(cmd);
	    	statement.execute(cmd);
	    	flag=1;
	    }
	    	 catch(Exception e){
	 	    	System.out.println(e.toString());
	 	    	releaseStatement(statement);
	 	    	releaseConnection(con);
	 	    	flag=0;
	 	    	//return 0;
	 	    }finally{
	 	     	releaseStatement(statement);
	 	    	releaseConnection(con);	    
	 	    	
	 	    }
	 	    if(flag==1)
	     		return 1;
	     	else
	     		return 0;
	}
	
	
	public int deleteUser(String org_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try
		{
			
			String cmd ="select org_id from tbl_user where org_id='"+org_id+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_user where org_id='"+org_id+"'");
				
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
	
	public List<AddUser> finduser( String org_name,String branch, String firstname, String lastname, String email){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AddUser> adduser = new ArrayList<AddUser>();
	    try{
	    	String cmd="SELECT t1.org_name,t1.branch,t2.firstname,t2.lastname,t2.email,t2.username,t2.password from tbl_organization as t1 join tbl_user as t2 on t1.org_id=t2.org_id where org_name='"+org_name+"' or branch='"+branch+"' or firstname='"+firstname+"' or lastname='"+lastname+"' or email='"+email+"'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				adduser.add(new AddUser(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("firstname"),resultSet.getString("lastname"),resultSet.getString("email"),resultSet.getString("username"),resultSet.getString("password")));
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
	    return adduser;
		
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