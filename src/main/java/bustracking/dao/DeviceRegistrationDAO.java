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


import bustracking.model.DeviceFail;
import bustracking.model.DeviceRegistration;


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
