package bustracking.model;

import java.sql.Date;

public class BusRegistration
{
	private String org_id;
	public BusRegistration(String org_name, String branch,
			String vechicle_reg_no, String device_imei_number, String driver_name,
			String driver_licence_no, String driver_licence_exp_date) {
		super();
		
		this.org_name = org_name;
		this.branch = branch;
		this.vechicle_reg_no = vechicle_reg_no;
		this.device_imei_number = device_imei_number;
		this.driver_name = driver_name;
		this.driver_licence_no = driver_licence_no;
		this.driver_licence_exp_date = driver_licence_exp_date;
	}

	private String org_name;
	private String branch;
	private String vechicle_reg_no;
	private String device_imei_number;
	private String driver_name;
	private String driver_licence_no;
	private String driver_licence_exp_date;
	private String route_no;
	
	public String getRoute_no() {
		return route_no;
	}

	public void setRoute_no(String route_no) {
		this.route_no = route_no;
	}

	public BusRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	
	public String getVechicle_reg_no() {
		return vechicle_reg_no;
	}

	public void setVechicle_reg_no(String vechicle_reg_no) {
		this.vechicle_reg_no = vechicle_reg_no;
	}

	public String getDevice_imei_number() {
		return device_imei_number;
	}

	public void setDevice_imei_number(String device_imei_number) {
		this.device_imei_number = device_imei_number;
	}

	public String getDriver_name() {
		return driver_name;
	}

	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}

	public String getDriver_licence_no() {
		return driver_licence_no;
	}

	public void setDriver_licence_no(String driver_licence_no) {
		this.driver_licence_no = driver_licence_no;
	}

	public String getDriver_licence_exp_date() {
		return driver_licence_exp_date;
	}

	public void setDriver_licence_exp_date(String driver_licence_exp_date) {
		this.driver_licence_exp_date = driver_licence_exp_date;
	}

	public BusRegistration( String vechicle_reg_no,
			String driver_name, String driver_licence_no,
			String driver_licence_exp_date) {
		super();
	
		this.vechicle_reg_no = vechicle_reg_no;
		this.driver_name = driver_name;
		this.driver_licence_no = driver_licence_no;
		this.driver_licence_exp_date = driver_licence_exp_date;
	}
	public BusRegistration(String org_id, String vechicle_reg_no,
			String driver_name, String driver_licence_no,
			String driver_licence_exp_date) {
		super();
		this.org_id=org_id;
		this.vechicle_reg_no = vechicle_reg_no;
		this.driver_name = driver_name;
		this.driver_licence_no = driver_licence_no;
		this.driver_licence_exp_date = driver_licence_exp_date;
	}
	public BusRegistration(String route_no) {
		super();
		this.route_no = route_no;
	}

	
	
	// 	Constructor for Edit Operation
	
	public BusRegistration(String org_name, String branch,
			String vechicle_reg_no, String device_imei_number,
			String driver_name, String driver_licence_no,
			String driver_licence_exp_date, String route_no) {
		super();
		
		this.org_name = org_name;
		this.branch = branch;
		this.vechicle_reg_no = vechicle_reg_no;
		this.device_imei_number = device_imei_number;
		this.driver_name = driver_name;
		this.driver_licence_no = driver_licence_no;
		this.driver_licence_exp_date = driver_licence_exp_date;
		this.route_no = route_no;
	}

	
	
	
}
