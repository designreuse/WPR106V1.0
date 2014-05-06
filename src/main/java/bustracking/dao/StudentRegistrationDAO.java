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



import bustracking.forms.StudentRegistrationForm;
import bustracking.model.BusDeviceRegistration;
import bustracking.model.BusRegistration;
import bustracking.model.Route;
import bustracking.model.Route_view;
import bustracking.model.StudentRegistration;

public class StudentRegistrationDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private static java.sql.Timestamp getCurrentTimeStamp() {
		 
		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());
	 
	}
	public int setstudentregistration(StudentRegistration student,Principal principal){
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
			
			String computername=InetAddress.getLocalHost().getHostName();
			System.out.println(computername);
			System.out.println("orgid"+student.getOrg_id());
			
			System.out.println("inserting into tbl_student");
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_student(org_id,student_roll_no,first_name,last_name,gender,transport_facility,pickup_route_no,pickup_point_address,drop_route_no,drop_point_address,kg_drop,parent_name1,parent_name2,parent_mobile1,parent_mobile2,parent_email1,parent_email2,class_standard,section,create_timestamp,create_user_id,create_user_system_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1,student.getOrg_id());
			preparedStatement.setString(2,student.getStudent_roll_no());
			preparedStatement.setString(3,student.getFirst_name());
			preparedStatement.setString(4,student.getLast_name());
			preparedStatement.setString(5,student.getGender());
			preparedStatement.setString(6,student.getTransport_facility());
			preparedStatement.setString(7,student.getPickup_route_no());
			preparedStatement.setString(8,student.getPickup_point_address());
			preparedStatement.setString(9,student.getDrop_route_no());
			preparedStatement.setString(10,student.getDrop_point_address());
			preparedStatement.setString(11,student.getKg_drop());
			preparedStatement.setString(12,student.getParent_name1());
			preparedStatement.setString(13,student.getParent_name2());
			preparedStatement.setString(14,student.getParent_mobile1());
			preparedStatement.setString(15,student.getParent_mobile2());
			preparedStatement.setString(16,student.getParent_email1());
			preparedStatement.setString(17,student.getParent_email2());
			preparedStatement.setString(18,student.getClass_standard());
			preparedStatement.setString(19,student.getSection());
			preparedStatement.setTimestamp(20,getCurrentTimeStamp());
			preparedStatement.setString(21,principal.getName());
			preparedStatement.setString(22,computername);
			
			
        	preparedStatement.execute();
			flag=1;	
		
	    }catch(Exception e){
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
	
	
	public Long getMax_StudentReg(){
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
			
			resultSet = statement.executeQuery("select max(student_reg_no) as max_reg from tbl_student");
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
	
	
	
	// Get Route no For specific organization
	
	
	public ArrayList<String> getStud_route(String org_name, String branch){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		ArrayList<String> studrouteRegistrations = new ArrayList<String>();
	    try{
	    	String cmd="select t1.route_no from tbl_vechicle as t1  where t1.org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"')";
	    	//System.out.println(org_id);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				studrouteRegistrations.add(resultSet.getString("route_no"));//,resultSet.getString("class"),resultSet.getString("section"));
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
	        return studrouteRegistrations;
	    }
	// Get class For specific organization
	
	
		public ArrayList<String> getStud_class(String org_name, String branch){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			ArrayList<String> studclassRegistrations = new ArrayList<String>();
		    try{
		    	String cmd="select class from tbl_class  where org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"')";
		    	//System.out.println(org_id);
				resultSet = statement.executeQuery(cmd);
				System.out.println(cmd);
				while(resultSet.next())
				{
					studclassRegistrations.add(resultSet.getString("class"));//,resultSet.getString("class"),resultSet.getString("section"));
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
		        return studclassRegistrations;
		    }
	
		// Get section For specific organization
		
		
			public ArrayList<String> getStud_section(String org_name, String branch,String class_standard){
				Connection con = null;
				Statement statement = null;
				ResultSet resultSet = null;
				try {
					con = dataSource.getConnection();
					statement = con.createStatement();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				ArrayList<String> studsectionRegistrations = new ArrayList<String>();
			    try{
			    	String cmd="select section from tbl_class  where class='"+class_standard+"' and  org_id=(select org_id from tbl_organization where org_name='"+org_name+"' and branch='"+branch+"')";
			    	//System.out.println(org_id);
					resultSet = statement.executeQuery(cmd);
					System.out.println(cmd);
					while(resultSet.next())
					{
						studsectionRegistrations.add(resultSet.getString("section"));//,resultSet.getString("class"),resultSet.getString("section"));
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
			        return studsectionRegistrations;
			    }
	
	
	/*public int setstudentregistration(StudentRegistration student){
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
			String cmd="insert into tbl_student (student_reg_no,org_id,student_roll_no,name,student_class,section,age,gender,blood_group,address,father_name,mobile_number,email_id,pickup_bus_id,drop_bus_id,pickup_route_id,drop_route_id,pickup_stop_id,drop_stop_id) values('"+student.getStudent_reg_no()+"','"+student.getOrg_id()+"','"+student.getStudent_roll_no()+"','"+student.getName()+"','"+student.getStudent_class()+"','"+student.getSection()+"','"+student.getAge()+"','"+student.getGender()+"','"+student.getBlood_group()+"','"+student.getAddress()+"','"+student.getFather_name()+"','"+student.getMobile_number()+"','"+student.getEmail_id()+"','"+student.getPickup_bus_id()+"','"+student.getDrop_bus_id()+"','"+student.getPickup_route_id()+"','"+student.getDrop_route_id()+"','"+student.getPickup_stop_id()+"','"+student.getDrop_stop_id()+"')";
			statement.execute(cmd);
			System.out.println(cmd);
			flag=1;	
		
	    }catch(Exception e){
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
	    
		
	}*/
	
	
	/*public List<Route> getRouteids(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Route> routes=new ArrayList<Route>();
		try{
			
			resultSet = statement.executeQuery("select * from tbl_route where stop_id='S0'");
			while(resultSet.next()){
				routes.add(new Route(resultSet.getString("bus_id"), resultSet.getString("route_id"),resultSet.getString("stop_id"), resultSet.getString("pickup_drop_stop"), resultSet.getString("route_from"), resultSet.getString("route_to"), resultSet.getString("stop_name"), resultSet.getString("stop_latitude"), resultSet.getString("stop_longitude"), resultSet.getString("stop_pickup_time"), resultSet.getString("stop_drop_time"), resultSet.getString("distance"), resultSet.getString("date_time")));
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
	    return routes;
		
	}*/
	
	/*public List<BusDeviceRegistration> getbusRegistation(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusDeviceRegistration> busDeviceRegistrations=new ArrayList<BusDeviceRegistration>();
		try{
			
			resultSet = statement.executeQuery("select * from tbl_device_bus");
			while(resultSet.next()){
				busDeviceRegistrations.add(new BusDeviceRegistration(resultSet.getString("org_id"), resultSet.getString("bus_id"), resultSet.getString("device_id"), resultSet.getString("bus_id"), resultSet.getString("device_imei_number"), resultSet.getString("device_sim_number"), resultSet.getString("driver_id"), resultSet.getString("description"), resultSet.getString("isactive"), resultSet.getString("creation_time")));
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
	    return busDeviceRegistrations;
		
	}*/
	
	
	public List<StudentRegistration> getstudentregistration(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<StudentRegistration> studentregistration = new ArrayList<StudentRegistration>();
	try{
		resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.student_roll_no,t2.first_name,t2.last_name from tbl_organization as t1 join tbl_student as t2 on t1.org_id=t2.org_id");
		while(resultSet.next()){
			studentregistration.add(new StudentRegistration(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("student_roll_no"),resultSet.getString("first_name"),resultSet.getString("last_name")));
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
    return studentregistration;
	
}

	//Client Side Edit For Student
	
	public List<StudentRegistration> getStudent_roll_no(String student_roll_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StudentRegistration> studentregistration = new ArrayList<StudentRegistration>();
	    try{
	    	String cmd="select * from tbl_student where student_roll_no='"+student_roll_no+"'";
	    	System.out.println(student_roll_no);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				studentregistration.add(new StudentRegistration(resultSet.getString("student_roll_no"), resultSet.getString("first_name"),resultSet.getString("last_name"),resultSet.getString("pickup_route_no"),resultSet.getString("pickup_point_address"),resultSet.getString("drop_route_no"),resultSet.getString("drop_point_address"),resultSet.getString("parent_name1"),resultSet.getString("parent_name2"),resultSet.getString("parent_mobile1"),resultSet.getString("parent_mobile2"),resultSet.getString("parent_email1"),resultSet.getString("parent_email2")));
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
	        return studentregistration;
	    
	} 
	
	
	public int clientupdateStudent(StudentRegistration student)
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
	    	String cmd="UPDATE tbl_student SET pickup_route_no='"+student.getPickup_route_no()+"', pickup_point_address='"+student.getPickup_point_address()+"',drop_route_no='"+student.getDrop_route_no()+"',drop_point_address='"+student.getDrop_point_address()+"',parent_name1='"+student.getParent_name1()+"',parent_name2='"+student.getParent_name2()+"',parent_mobile1='"+student.getParent_mobile1()+"',parent_mobile2='"+student.getParent_mobile2()+"',parent_email1='"+student.getParent_email1()+"',parent_email2='"+student.getParent_email2()+"' WHERE student_roll_no='"+student.getStudent_roll_no()+"'";
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
	
	
	public int deleteStudent(int student_roll_no){
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
			
	    	 String cmd ="select name from tbl_student where student_roll_no='"+student_roll_no+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_student where student_roll_no='"+student_roll_no+"'");
				
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
	
	
	public List<StudentRegistration> findStudent(String org_name, String branch,String student_roll_no,String first_name,String last_name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StudentRegistration> studentRegistrations = new ArrayList<StudentRegistration>();
	    try{
	    		
	    		    	String cmd="SELECT t1.org_name,t1.branch,t2.student_roll_no,t2.first_name,t2.last_name from tbl_organization as t1 join tbl_student as t2 on t1.org_id=t2.org_id where org_name='"+org_name+"' or branch='"+branch+"' or  student_roll_no='"+student_roll_no+"' or first_name='"+first_name+"' or last_name='"+last_name+"';";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				
				studentRegistrations.add(new StudentRegistration(resultSet.getString("org_name"),resultSet.getString("branch"),resultSet.getString("student_roll_no"),resultSet.getString("first_name"),resultSet.getString("last_name")));
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
	    return studentRegistrations;
		
	}

	// Get Student Information for Client Side View
	
	public List<StudentRegistration> getStudentRegistration_by_org_id(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StudentRegistration> studentregistration = new ArrayList<StudentRegistration>();
		try{
			
			resultSet = statement.executeQuery("SELECT t1.org_name,t1.branch,t2.student_roll_no, t2.first_name,t2.last_name,t2.gender,t2.transport_facility,t2.pickup_route_no,t2.pickup_point_address,t2.drop_route_no,t2.drop_point_address,t2.kg_drop,t2.parent_name1,t2.parent_name2,t2.parent_mobile1,t2.parent_mobile2,t2.parent_email1,t2.parent_email2,t2.class_standard,t2.section from tbl_organization as t1 join tbl_student as t2 on t1.org_id=t2.org_id where t2.org_id='"+org_id+"'");
			while(resultSet.next()){
				studentregistration.add(new StudentRegistration(resultSet.getString("student_roll_no"),resultSet.getString("first_name"),
						resultSet.getString("last_name"),resultSet.getString("gender"),resultSet.getString("pickup_route_no"),resultSet.getString("pickup_point_address"),resultSet.getString("drop_route_no"),resultSet.getString("drop_point_address"),resultSet.getString("kg_drop"),resultSet.getString("parent_name1"),resultSet.getString("parent_name2"),resultSet.getString("parent_mobile1"),resultSet.getString("parent_mobile2"),resultSet.getString("parent_email1")
						,resultSet.getString("parent_email2"),resultSet.getString("class_standard"),resultSet.getString("section")));
				
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
	    return studentregistration;
		
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

