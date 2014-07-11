package bustracking.dao;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import bustracking.model.AddUser;
import bustracking.model.BusDeviceRegistration;
import bustracking.model.BusRegistration;

import bustracking.model.OrgRegistration;

public class BusDeviceRegistrationDAO {

	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// insert bus device
	
	public int insertBusDeviceRegistration(BusDeviceRegistration busDeviceRegistration){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	
	
	try{
		String cmd_insert_busdevice="insert into tbl_device_bus values('"+busDeviceRegistration.getOrg_id()+"','"+busDeviceRegistration.getBus_id()+"','"+busDeviceRegistration.getDevice_id()+"','"+busDeviceRegistration.getBus_reg_id()+"','"+busDeviceRegistration.getDevice_imei_number()+"','"+busDeviceRegistration.getDevice_sim_number()+"','"+busDeviceRegistration.getDriver_id()+"','"+busDeviceRegistration.getDescription()+"','"+busDeviceRegistration.getIsactive()+"',now())";
		statement.execute(cmd_insert_busdevice);
		
	
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
    return 1;
	
}
	//max id bus device

	public Long getMax_BusDeviceReg(){
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
			
			resultSet = statement.executeQuery("select max(bus_id) as max_reg from tbl_device_bus");
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
	
	//view bus device
	
	public List<BusDeviceRegistration> getBusdeviceregistration(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusDeviceRegistration> busDeviceRegistrations = new ArrayList<BusDeviceRegistration>();
		try{
			resultSet = statement.executeQuery("select * from tbl_vechicle");
			while(resultSet.next()){
				busDeviceRegistrations.add(new BusDeviceRegistration(resultSet.getString("vechicle_reg_no"), resultSet.getString("device_imei_number")));
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
		
	}
	
	public List<BusDeviceRegistration> getdevice_imei_number_for_personal(String org_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusDeviceRegistration> device_imei_number = new ArrayList<BusDeviceRegistration>();
		try{
			resultSet = statement.executeQuery("select device_imei_number from tbl_vechicle where org_id='"+org_id+"'");
			while(resultSet.next()){
				device_imei_number.add(new BusDeviceRegistration(resultSet.getString("device_imei_number")));
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
	    return device_imei_number;
		
	}
	
	//Search admin device
	
	
		public List<BusDeviceRegistration> SearchBusdevice(String device_imei_number, String device_sim_number,String adminip,String create_user_id){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			List<BusDeviceRegistration> busDeviceRegistrations = new ArrayList<BusDeviceRegistration>();
			try{
				resultSet = statement.executeQuery("select * from tbl_vechicle where device_imei_number='"+device_imei_number+"' or device_sim_number='"+device_sim_number+"' or adminip='"+adminip+"' or create_user_id='"+create_user_id+"'");
				while(resultSet.next()){
					busDeviceRegistrations.add(new BusDeviceRegistration(resultSet.getString("vechicle_reg_no"), resultSet.getString("device_imei_number")));
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
			
		}
	public List<BusDeviceRegistration> getBusdeviceregistration_byid(String device_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BusDeviceRegistration> busDeviceRegistrations = new ArrayList<BusDeviceRegistration>();
		try{
			resultSet = statement.executeQuery("select * from tbl_device_bus where device_id='"+device_id+"'");
			while(resultSet.next()){
				busDeviceRegistrations.add(new BusDeviceRegistration(resultSet.getString("org_id"),resultSet.getString("bus_id"), resultSet.getString("device_id"), resultSet.getString("bus_reg_no"),resultSet.getString("device_imei_number"),resultSet.getString("device_sim_number"),resultSet.getString("driver_id"), resultSet.getString("description"),resultSet.getString("isactive"),resultSet.getString("creation_time")));
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
		
	}
	
	public int updateBusDevice(String device_id,BusDeviceRegistration busDeviceRegistration)
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
	    	String cmd="UPDATE tbl_device_bus SET bus_id='"+busDeviceRegistration.getBus_id()+"', bus_reg_no='"+busDeviceRegistration.getBus_reg_id()+"',device_imei_number='"+busDeviceRegistration.getDevice_imei_number()+"', device_sim_number='"+busDeviceRegistration.getDevice_sim_number()+"', driver_id='"+busDeviceRegistration.getDriver_id()+"', description='"+busDeviceRegistration.getDescription()+"', isactive='"+busDeviceRegistration.getIsactive()+"' WHERE device_id='"+busDeviceRegistration.getDevice_id()+"';";
	    	String Desc="Update busDeviceRegistration "+busDeviceRegistration.getDevice_id();
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
	
	
	
	
	public int deleteBusDevice(String device_id){
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
			
	    	 String cmd ="select device_id from tbl_device_bus where device_id='"+device_id+"'";
	    	 String Desc="Delete report ";
	    	 resultSet=statement.executeQuery(cmd);
				
				if(resultSet.next())
					Desc=Desc+resultSet.getString(1);
				statement.execute("delete from tbl_device_bus where device_id='"+device_id+"'");
				
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
