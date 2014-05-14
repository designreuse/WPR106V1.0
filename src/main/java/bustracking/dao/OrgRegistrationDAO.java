package bustracking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Address;
import javax.sql.DataSource;
import javax.validation.constraints.Max;

import java.sql.PreparedStatement;

import bustracking.forms.OrgRegistrationForm;

import bustracking.model.OrgRegistration;
import bustracking.model.Route;
import bustracking.model.StudentRegistration;

public class OrgRegistrationDAO{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		}
	public int insert_organisation(OrgRegistration org){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		int flag=0;
		try{
			con = dataSource.getConnection();
			stmt = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
		//	String cmd="insert into tbl_org(org_name,address,city,pincode,contact_person_name,contact_person_mobile_no,email_id,is_active,is_this_education_institute) values('"+org.getOrg_name()+"','"+org.getAddress()+"','"+org.getCity()+"','"+org.getPincode()+"','"+org.getContact_person_name()+"','"+org.getContact_person_mobile_no()+"','"+org.getEmail_id()+"','"+org.getIs_active()+"','"+org.getIs_this_education_institute()+"')";
			
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_organization(org_name,branch,address,country,state,city,pincode,type_of_organization,office_land_line1,office_land_line2,office_fax,email_id,chairman_name,chairman_telephone_number,principal_name,principal_telephone_number,transport_officer_name,transport_officer_number,is_active) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1,org.getOrg_name());
			preparedStatement.setString(2,org.getBranch());
			preparedStatement.setString(3,org.getAddress());
			preparedStatement.setString(4,org.getCountry());
			preparedStatement.setString(5,org.getState());
			preparedStatement.setString(6,org.getCity());
			preparedStatement.setString(7,org.getPincode());
			preparedStatement.setString(8,org.getType_of_organization());
			preparedStatement.setString(9,org.getOffice_land_line1());
			preparedStatement.setString(10,org.getOffice_land_line2());
			preparedStatement.setString(11,org.getOffice_fax());
			preparedStatement.setString(12,org.getEmail_id());
			preparedStatement.setString(13,org.getChairman_name());
			preparedStatement.setString(14,org.getChairman_telephone_number());
			preparedStatement.setString(15,org.getPrincipal_name());
			preparedStatement.setString(16,org.getPrincipal_telephone_number());
			preparedStatement.setString(17,org.getTransport_officer_name());
			preparedStatement.setString(18,org.getTransport_officer_number());
			preparedStatement.setString(19,org.getIs_active());
			
			
			preparedStatement.execute();
			
	
			flag=1;
		}
		catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(stmt);
	    	releaseConnection(con);
	    	flag=0;
	    }
		finally{
	    	
	    	releaseStatement(stmt);
	    	releaseConnection(con);	    	
	    }
		if(flag==1)
    		return 1;
    	else
    		return 0;
	    
		
	}
	/*public int getOrg_id(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		int MaxID=1;
		
		try{
			
			resultSet = statement.executeQuery("select max(org_id) as max_id from tbl_organization");
			if(resultSet.next())
			{
				MaxID=Integer.parseInt(resultSet.getString("max_id"));
				MaxID=MaxID+1;
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
		
	}*/
	
	//Get organization id and insert into table
		public String getOrg_id(String org_name, String branch){
		
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			String org_id="0";
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				try{
				resultSet = statement.executeQuery("select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"'");
				if(resultSet.next())
				{
					org_id=resultSet.getString("org_id");
					
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
		    return org_id;
			
		}
	
	
	
	public List<OrgRegistration> getOrgregistration()
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
		List<OrgRegistration> orgregistrationform=new ArrayList<OrgRegistration>();
		try{
			resultSet = statement.executeQuery("select * from tbl_organization");
			while(resultSet.next()){	
				orgregistrationform.add(new OrgRegistration(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("city"),resultSet.getString("country"),resultSet.getString("type_of_organization"),resultSet.getString("is_active"),resultSet.getString("address"),resultSet.getString("state"),resultSet.getString("pincode"),resultSet.getString("office_land_line1"),resultSet.getString("office_land_line2"),resultSet.getString("office_fax"),resultSet.getString("email_id"),resultSet.getString("chairman_name"),resultSet.getString("chairman_telephone_number"),resultSet.getString("principal_name"),resultSet.getString("principal_telephone_number"),resultSet.getString("transport_officer_name"),resultSet.getString("transport_officer_number")));
			
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
	    
	    return orgregistrationform;
		
	}
	
	public List<OrgRegistration> getBranch(String org_name)
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
		List<OrgRegistration> orgregistrationform=new ArrayList<OrgRegistration>();
		try{
			resultSet = statement.executeQuery("select * from tbl_organization where='"+org_name+"'");
			while(resultSet.next()){	
				orgregistrationform.add(new OrgRegistration(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("address"),resultSet.getString("country"),resultSet.getString("state"),resultSet.getString("city"),resultSet.getString("pincode"),resultSet.getString("type_of_organization"),resultSet.getString("office_land_line1"),resultSet.getString("office_land_line2"),resultSet.getString("office_fax"),resultSet.getString("email_id"),resultSet.getString("chairman_name"),resultSet.getString("chairman_telephone_number"),resultSet.getString("principal_name"),resultSet.getString("principal_telephone_number"),resultSet.getString("transport_officer_name"),resultSet.getString("transport_officer_number"),resultSet.getString("is_active")));
			
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
	    
	    return orgregistrationform;
		
	}
	
	// Check Unique Organization and branch
	 public boolean checkUnique(String org_name,String branch)
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
	         boolean result=false;
	          try 
	          {
				resultSet = statement.executeQuery("select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"'");
			    if(resultSet.next())
			    {
			    	result=true;
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
	 
	public List<OrgRegistration> getOrgregistration_id(String org_name,String branch)
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
		List<OrgRegistration> orgregistration=new ArrayList<OrgRegistration>();
		{
		try
		{
			String cmd="select *from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"'";
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next())
			{
				orgregistration.add(new OrgRegistration(resultSet.getString("org_name"),resultSet.getString("office_fax"), resultSet.getString("branch"),resultSet.getString("email_id"),resultSet.getString("address"), resultSet.getString("chairman_name"), resultSet.getString("country"),resultSet.getString("chairman_telephone_number"), resultSet.getString("state"), resultSet.getString("principal_name"), resultSet.getString("city"),resultSet.getString("principal_telephone_number"),resultSet.getString("pincode"),resultSet.getString("transport_officer_name"), resultSet.getString("type_of_organization"),resultSet.getString("transport_officer_number"), resultSet.getString("office_land_line1"), resultSet.getString("is_active"),resultSet.getString("office_land_line2")));
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
		return orgregistration;
	}
	
	
	
	
	public int updateOrganization(OrgRegistration orgRegistration)
	{
		Connection con = null;
		Statement statement = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	    try{
	    	String cmd="UPDATE tbl_organization SET address='"+orgRegistration.getAddress()+"', country='"+orgRegistration.getCountry()+"', state='"+orgRegistration.getState()+"',city='"+orgRegistration.getCity()+"',pincode='"+orgRegistration.getPincode()+"',type_of_organization='"+orgRegistration.getType_of_organization()+"',office_land_line1='"+orgRegistration.getOffice_land_line1()+"',office_land_line2='"+orgRegistration.getOffice_land_line2()+"',office_fax='"+orgRegistration.getOffice_fax()+"',email_id='"+orgRegistration.getEmail_id()+"',chairman_name='"+orgRegistration.getChairman_name()+"',chairman_telephone_number='"+orgRegistration.getChairman_telephone_number()+"',principal_name='"+orgRegistration.getPrincipal_name()+"',principal_telephone_number='"+orgRegistration.getPrincipal_telephone_number()+"',transport_officer_name='"+orgRegistration.getTransport_officer_name()+"',transport_officer_number='"+orgRegistration.getTransport_officer_number()+"',is_active='"+orgRegistration.getIs_active()+"' WHERE org_name='"+orgRegistration.getOrg_name()+"' and branch='"+orgRegistration.getBranch()+"'";
	    	String Desc="Update orgRegistration "+orgRegistration.getOrg_name();
	    	//System.out.println(cmd);
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
	
	
	// Delete Organization Information
	
	public int deleteorganization(String org_name,String branch){
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
			
	    	 String cmd ="select * from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"'");
				
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
	
	
	public List<OrgRegistration> findOrganization(String org_name, String branch,String city, String country){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<OrgRegistration> orgRegistration = new ArrayList<OrgRegistration>();
	    try{
	    	String cmd="Select * from tbl_organization where org_name='"+org_name+"' or branch='"+branch+"' or city='"+city+"' or country='"+country+"';";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				orgRegistration.add(new OrgRegistration(resultSet.getString("org_id"),resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("city"),resultSet.getString("country"),resultSet.getString("type_of_organization"),resultSet.getString("is_active"),resultSet.getString("address"),resultSet.getString("state"),resultSet.getString("pincode"),resultSet.getString("office_land_line1"),resultSet.getString("office_land_line2"),resultSet.getString("office_fax"),resultSet.getString("email_id"),resultSet.getString("chairman_name"),resultSet.getString("chairman_telephone_number"),resultSet.getString("principal_name"),resultSet.getString("principal_telephone_number"),resultSet.getString("transport_officer_name"),resultSet.getString("transport_officer_number")));
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
	    return orgRegistration;
		
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