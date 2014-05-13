 package bustracking.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

//import org.junit.runner.Request;


import bustracking.model.AddUser;
import bustracking.model.DeviceFail;
import bustracking.model.DeviceRegistration;
import bustracking.model.MessageSender;


public class DeviceRegistrationDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private static java.sql.Timestamp getCurrentTimeStamp() {
		 
		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());
	 
	}
	
	public List<String> getcarriername(){
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
	    	String cmd="select DISTINCT carrier from tbl_apn";
	    	//System.out.println(org_name);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegister.add(resultSet.getString("carrier"));
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
	
	
	public List<String> getapn(String carrier){
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
	    	String cmd="select apn from tbl_apn where carrier='"+carrier+"'";
	    	//System.out.println(org_id);
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while(resultSet.next())
			{
				busRegistrations.add(resultSet.getString("apn"));
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
	
	
	/*public String sms(DeviceRegistration device){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String role="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			String computername=InetAddress.getLocalHost().getHostName();
			System.out.println(computername);

		    System.out.println("currenttime"+getCurrentTimeStamp()+device.getSim_card_tested());
		    
		    
		    
		    System.out.println("Device Configuring");
			PreparedStatement preparedStatement=con.prepareStatement("insert into tbl_device_config_changes_history(manufacturer,model_no,carrier,sim_card_number,device_procured_date,device_invoice_number,device_imei_number,device_tested,sim_procured_date,sim_invoice_number,sim_card_tested,device_sim_paired,is_assigned,password,device_status,port_no,comments,apn,adminip,configuration_date,create_user_id,create_timestamp,create_user_system_name,modified_user_id,modified_timestamp,modified_user_syste_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
			preparedStatement.setString(1,device.getManufacturer());
			preparedStatement.setString(2,device.getModel_no());
			preparedStatement.setString(3,device.getCarrier());
			preparedStatement.setString(4,device.getSim_card_number());
			preparedStatement.setString(5,device.getDevice_procured_date());
			preparedStatement.setString(6,device.getDevice_invoice_number());
			preparedStatement.setString(7,device.getDevice_imei_number());
			preparedStatement.setString(8,device.getDevice_tested());
			preparedStatement.setString(9,device.getSim_procured_date());
			preparedStatement.setString(10,device.getSim_invoice_number());
			preparedStatement.setString(11,device.getSim_card_tested());
			preparedStatement.setString(12,device.getDevice_sim_paired());
			preparedStatement.setString(13,device.getIs_assigned());
			preparedStatement.setString(14,device.getPassword());
			preparedStatement.setString(15,device.getDevice_status());
			preparedStatement.setString(16,device.getPort_no());
			preparedStatement.setString(17,device.getComments());
			preparedStatement.setString(18,device.getApn());
			preparedStatement.setString(19,device.getAdminip());
			preparedStatement.setString(20,device.getConfiguration_date());
			preparedStatement.setString(21,device.getCreate_user_id());
			preparedStatement.setTimestamp(22, getCurrentTimeStamp());
			preparedStatement.setString(23,computername);
			preparedStatement.setString(24,"aaaa");
			preparedStatement.setString(25,"2014-04-26 12:00:14");
			preparedStatement.setString(26,"PC");
			preparedStatement.execute();
			
			
			PreparedStatement preparedStatement1=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement1.setString(1,device.getSim_card_number());
			preparedStatement1.setString(2,"begin"+device.getPassword());
			preparedStatement1.setString(3,"NULL");
			preparedStatement1.setString(4,"NULL");
			preparedStatement1.setString(5,"NULL");
			preparedStatement1.execute();
			
			
		    	System.out.println("Message Sending");
				System.out.println("Message send to "+device.getSim_card_number());
				System.out.println("sdasdas"+getmyid());
				System.out.println("myid"+this.getmyid());
				
				
				MessageSender.sendMessage1("9659885881", "begin"+device.getPassword(), this.getmyid());
				
				
		    
		    String cmd1="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+this.getmyid()+"'";
		    System.out.println(cmd1);
	    	statement.execute(cmd1);
		    
		    PreparedStatement preparedStatement2=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement2.setString(1,device.getSim_card_number());
			preparedStatement2.setString(2,"apn"+device.getPassword()+ " " +device.getApn());
			preparedStatement2.setString(3,"NULL");
			preparedStatement2.setString(4,"NULL");
			preparedStatement2.setString(5,"NULL");
			preparedStatement2.execute();
			
		    MessageSender.sendMessage1(device.getSim_card_number(), "apn"+device.getPassword()+" "+device.getApn(), device.getMyid());
		    
		    String cmd2="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+device.getMyid()+"'";
		    System.out.println(cmd2);
	    	statement.execute(cmd2);
		    
		    PreparedStatement preparedStatement3=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement3.setString(1,device.getSim_card_number());
			preparedStatement3.setString(2,"adminip"+device.getPassword()+ " " +device.getAdminip()+ " " + device.getPort_no());
			preparedStatement3.setString(3,"NULL");
			preparedStatement3.setString(4,"NULL");
			preparedStatement3.setString(5,"NULL");
			preparedStatement3.execute();
			
		    MessageSender.sendMessage1(device.getSim_card_number(), "adminip"+device.getPassword()+ " " +device.getAdminip()+ " "+ device.getPort_no(), device.getMyid());
		   
		    String cmd3="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+device.getMyid()+"'";
		    System.out.println(cmd3);
	    	statement.execute(cmd3);
		    
		    PreparedStatement preparedStatement4=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement4.setString(1,device.getSim_card_number());
			preparedStatement4.setString(2,"GPRS"+device.getPassword());
			preparedStatement4.setString(3,"NULL");
			preparedStatement4.setString(4,"NULL");
			preparedStatement4.setString(5,"NULL");
			preparedStatement4.execute();
		    
		    MessageSender.sendMessage1(device.getSim_card_number(), "GPRS"+device.getPassword(), device.getMyid());
		    
		    String cmd4="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+device.getMyid()+"'";
		    System.out.println(cmd4);
	    	statement.execute(cmd4);
		    
		    PreparedStatement preparedStatement5=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement5.setString(1,device.getSim_card_number());
			preparedStatement5.setString(2,"load"+device.getPassword());
			preparedStatement5.setString(3,"NULL");
			preparedStatement5.setString(4,"NULL");
			preparedStatement5.setString(5,"NULL");
			preparedStatement5.execute();
		    
		    MessageSender.sendMessage1(device.getSim_card_number(), "load"+device.getPassword(), device.getMyid());
		    
		    String cmd5="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+device.getMyid()+"'";
		    System.out.println(cmd5);
	    	statement.execute(cmd5);
		    
		    PreparedStatement preparedStatement6=con.prepareStatement("insert into sms_track(sim_card_number,message,status,updated_on,res) values(?,?,?,?,?)");
			preparedStatement6.setString(1,device.getSim_card_number());
			preparedStatement6.setString(2,"fix030s***n"+device.getPassword());
			preparedStatement6.setString(3,"NULL");
			preparedStatement6.setString(4,"NULL");
			preparedStatement6.setString(5,"NULL");
			preparedStatement6.execute();
		    
		    MessageSender.sendMessage1(device.getSim_card_number(), "fix030s***n"+device.getPassword(), device.getMyid());
		    
		    
		    
		    String cmd6="UPDATE sms_track SET status='"+device.getStatus()+"' , updated_on='"+device.getUpdated_on()+"', res='"+device.getRes()+"' WHERE myid='"+device.getMyid()+"'";
		    System.out.println(cmd6);
	    	statement.execute(cmd6);
	    	
	    	String cmd="UPDATE tbl_device_configuration SET configuration_date='"+device.getConfiguration_date()+"' , is_assigned='"+device.getIs_assigned()+"'  WHERE device_imei_number='"+device.getDevice_imei_number()+"'";
	    	System.out.println(cmd);
	    	statement.execute(cmd);
	    	
			
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
	    return role;
		
		
		
		
	}*/
	
	public String getmyid(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String deviceid="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			String cmd_sql="select max(myid) as myid from sms_track";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceid=resultSet.getString("myid");
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
	    return deviceid;
		
	}
	public String insert_device(DeviceRegistration deviceRegistration,String user_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String role="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
			String computername=InetAddress.getLocalHost().getHostName();
			System.out.println(computername);

			

			System.out.println("currenttime"+getCurrentTimeStamp()+deviceRegistration.getSim_card_tested());
			PreparedStatement preparedStatement=con.prepareStatement("insert into tbl_device_configuration(manufacturer,model_no,carrier,sim_card_number,device_procured_date,device_invoice_number,device_imei_number,device_tested,sim_procured_date,sim_invoice_number,sim_card_tested,device_sim_paired,is_assigned,password,device_status,port_no,comments,apn,adminip,configuration_date,create_user_id,create_timestamp,user_system_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
			preparedStatement.setString(1,deviceRegistration.getManufacturer());
			preparedStatement.setString(2,deviceRegistration.getModel_no());
			preparedStatement.setString(3,deviceRegistration.getCarrier());
			preparedStatement.setString(4,deviceRegistration.getSim_card_number());
			preparedStatement.setString(5,deviceRegistration.getDevice_procured_date());
			preparedStatement.setString(6,deviceRegistration.getDevice_invoice_number());
			preparedStatement.setString(7,deviceRegistration.getDevice_imei_number());
			preparedStatement.setString(8,deviceRegistration.getDevice_tested());
			preparedStatement.setString(9,deviceRegistration.getSim_procured_date());
			preparedStatement.setString(10,deviceRegistration.getSim_invoice_number());
			preparedStatement.setString(11,deviceRegistration.getSim_card_tested());
			preparedStatement.setString(12,deviceRegistration.getDevice_sim_paired());
			preparedStatement.setString(13,deviceRegistration.getIs_assigned());
			preparedStatement.setString(14,deviceRegistration.getPassword());
			preparedStatement.setString(15,deviceRegistration.getDevice_status());
			preparedStatement.setString(16,deviceRegistration.getPort_no());
			preparedStatement.setString(17,deviceRegistration.getComments());
			preparedStatement.setString(18,deviceRegistration.getApn());
			preparedStatement.setString(19,deviceRegistration.getAdminip());
			preparedStatement.setString(20,deviceRegistration.getConfiguration_date());
			preparedStatement.setString(21,deviceRegistration.getCreate_user_id());
			preparedStatement.setTimestamp(22, getCurrentTimeStamp());
			preparedStatement.setString(23,computername);
			preparedStatement.execute();
			
			
			
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
	    return role;
		
	}
	public List<DeviceRegistration> get_devices(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DeviceRegistration> deviceRegistrations=new ArrayList<DeviceRegistration>();
		try{
			String cmd_sql="Select * from tbl_device_configuration";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(new DeviceRegistration(resultSet.getString("manufacturer"), resultSet.getString("model_no"),resultSet.getString("carrier"),resultSet.getString("sim_card_number"),resultSet.getString("device_procured_date"),resultSet.getString("device_invoice_number"),resultSet.getString("device_imei_number"),resultSet.getString("device_tested"),resultSet.getString("sim_procured_date"),resultSet.getString("sim_invoice_number"),resultSet.getString("sim_card_tested"),resultSet.getString("device_sim_paired"),resultSet.getString("is_assigned"),resultSet.getString("password"),resultSet.getString("device_status"),resultSet.getString("port_no"),resultSet.getString("comments"),resultSet.getString("apn"),resultSet.getString("adminip"),resultSet.getString("configuration_date"),resultSet.getString("create_user_id")));
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
	    return deviceRegistrations;
		
	}
	//find device 10/05/2014
	

	public List<String> get_imei(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select sim_invoice_number from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("sim_invoice_number"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_simdate(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select sim_procured_date from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("sim_procured_date"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_simcardno(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select sim_card_number from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("sim_card_number"));
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
	    return deviceRegistrations;
		
	}
	public List<String> get_modelno(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select model_no from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("model_no"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_devicedate(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select device_procured_date from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("device_procured_date"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_deviceinvoice(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select device_invoice_number from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("device_invoice_number"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_pass(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select password from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("password"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_comments(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select comments from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("comments"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_manu(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select manufacturer from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("manufacturer"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_carrier(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select carrier from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("carrier"));
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
	    return deviceRegistrations;
		
	}
	public List<String> get_stested(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select sim_card_tested from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("sim_card_tested"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_dspaired(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select device_sim_paired from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("device_sim_paired"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_status(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select device_status from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("device_status"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_assigned(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select is_assigned from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("is_assigned"));
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
	    return deviceRegistrations;
		
	}
	
	public List<String> get_dtested(String device_imei_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> deviceRegistrations=new ArrayList<String>();
		try{
			String cmd_sql="Select device_tested from tbl_device_configuration where device_imei_number='"+device_imei_number+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(resultSet.getString("device_tested"));
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
	    return deviceRegistrations;
		
	}
	
	public boolean check_simcard_no(DeviceRegistration simno){
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
			
			resultSet = statement.executeQuery("select * from tbl_device_configuration where sim_card_number='"+simno.getSim_card_number()+"'");
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
	
	public boolean check_device_invoice(DeviceRegistration dinvoiceno){
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
			
			resultSet = statement.executeQuery("select * from tbl_device_configuration where device_invoice_number='"+dinvoiceno.getDevice_invoice_number()+"'");
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
	
	public boolean check_sim_invoice(DeviceRegistration sinvoiceno){
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
			
			resultSet = statement.executeQuery("select * from tbl_device_configuration where sim_invoice_number='"+sinvoiceno.getSim_invoice_number()+"'");
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
	
	public boolean check_imei_no(DeviceRegistration imeino){
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
			
			resultSet = statement.executeQuery("select * from tbl_device_configuration where device_imei_number='"+imeino.getDevice_imei_number()+"'");
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

	public List<DeviceRegistration> find_devices(String device_imei_number, String device_sim_number,String adminip,String create_user_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DeviceRegistration> deviceRegistrations=new ArrayList<DeviceRegistration>();
		try{
			String cmd_sql="Select * from tbl_device_configuration where device_imei_number='"+device_imei_number+"' or device_sim_number='"+device_sim_number+"' or adminip='"+adminip+"' or create_user_id='"+create_user_id+"'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				deviceRegistrations.add(new DeviceRegistration(resultSet.getString("manufacturer"), resultSet.getString("model_no"),resultSet.getString("carrier"),resultSet.getString("sim_card_number"),resultSet.getString("device_procured_date"),resultSet.getString("device_invoice_number"),resultSet.getString("device_imei_number"),resultSet.getString("device_tested"),resultSet.getString("sim_procured_date"),resultSet.getString("sim_invoice_number"),resultSet.getString("sim_card_tested"),resultSet.getString("device_sim_paired"),resultSet.getString("is_assigned"),resultSet.getString("password"),resultSet.getString("device_status"),resultSet.getString("port_no"),resultSet.getString("comments"),resultSet.getString("apn"),resultSet.getString("adminip"),resultSet.getString("configuration_date"),resultSet.getString("create_user_id")));
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
	    return deviceRegistrations;
		
	}
	
	

	//Get Device IMEI Number
	
	public List<DeviceRegistration> getDevice_imei_no(){
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DeviceRegistration> device_imei=new ArrayList<DeviceRegistration>();
		try{
			String cmd_sql="Select device_imei_number from tbl_device_configuration where is_assigned='0'";
			resultSet=statement.executeQuery(cmd_sql);
			
			while(resultSet.next())
			{
				device_imei.add(new DeviceRegistration(resultSet.getString("device_imei_number")));
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
	    return device_imei;
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
