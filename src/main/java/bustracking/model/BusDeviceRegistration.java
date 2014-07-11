package bustracking.model;

import org.hibernate.validator.constraints.NotEmpty;

public class BusDeviceRegistration {

	private String org_id;
	
	@NotEmpty
	private String bus_id;
	
	@NotEmpty
	private String device_id;
	
	@NotEmpty
	private String bus_reg_id;
	 private String adminip;
	 private String create_user_id;
	 
	public BusDeviceRegistration(String bus_reg_id, String device_imei_number) {
		super();
		this.bus_reg_id = bus_reg_id;
		this.device_imei_number = device_imei_number;
	}
	public BusDeviceRegistration(String device_imei_number) {
		super();
		this.device_imei_number = device_imei_number;
	}
	@NotEmpty
	private String device_imei_number;
	
	@NotEmpty
	private String device_sim_number;
	
	@NotEmpty
	private String driver_id;
	
	@NotEmpty
	private String description;
	
	@NotEmpty
	private String isactive;

	private String creation_time;
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getBus_id() {
		return bus_id;
	}
	public void setBus_id(String bus_id) {
		this.bus_id = bus_id;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public String getBus_reg_id() {
		return bus_reg_id;
	}
	public void setBus_reg_id(String bus_reg_id) {
		this.bus_reg_id = bus_reg_id;
	}
	public String getDevice_imei_number() {
		return device_imei_number;
	}
	public void setDevice_imei_number(String device_imei_number) {
		this.device_imei_number = device_imei_number;
	}
	public String getDevice_sim_number() {
		return device_sim_number;
	}
	public void setDevice_sim_number(String device_sim_number) {
		this.device_sim_number = device_sim_number;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsactive() {
		return isactive;
	}
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}
	public String getCreation_time() {
		return creation_time;
	}
	public void setCreation_time(String creation_time) {
		this.creation_time = creation_time;
	}
	
	public String getAdminip() {
		return adminip;
	}
	public void setAdminip(String adminip) {
		this.adminip = adminip;
	}
	public String getCreate_user_id() {
		return create_user_id;
	}
	public void setCreate_user_id(String create_user_id) {
		this.create_user_id = create_user_id;
	}
	public BusDeviceRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusDeviceRegistration(String org_id, String bus_id,
			String device_id, String bus_reg_id, String device_imei_number,
			String device_sim_number, String driver_id, String description,
			String isactive, String creation_time) {
		super();
		this.org_id = org_id;
		this.bus_id = bus_id;
		this.device_id = device_id;
		this.bus_reg_id = bus_reg_id;
		this.device_imei_number = device_imei_number;
		this.device_sim_number = device_sim_number;
		this.driver_id = driver_id;
		this.description = description;
		this.isactive = isactive;
		this.creation_time = creation_time;
	}
	public BusDeviceRegistration(String org_id, String bus_id,
			String device_id, String bus_reg_id, String device_imei_number,
			String device_sim_number, String driver_id, String description,
			String isactive, String creation_time,String adminip,String create_user_id) {
		super();
		this.org_id = org_id;
		this.bus_id = bus_id;
		this.device_id = device_id;
		this.bus_reg_id = bus_reg_id;
		this.device_imei_number = device_imei_number;
		this.device_sim_number = device_sim_number;
		this.driver_id = driver_id;
		this.description = description;
		this.isactive = isactive;
		this.creation_time = creation_time;
		this.adminip=adminip;
		this.create_user_id=create_user_id;
	}
	
	
	
}
