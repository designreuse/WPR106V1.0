package bustracking.model;



public class ClientHome
{
	private String org_id;
	private String org_name;
	private String branch;
	private String speed;	
	private String vechicle_reg_no;
	private String address;
	private String bus_tracking_timestamp;
	
	public ClientHome() {
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

	
	public String getSpeed() {
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBus_tracking_timestamp() {
		return bus_tracking_timestamp;
	}

	public void setBus_tracking_timestamp(String bus_tracking_timestamp) {
		this.bus_tracking_timestamp = bus_tracking_timestamp;
	}

	public String getVechicle_reg_no() {
		return vechicle_reg_no;
	}

	public void setVechicle_reg_no(String vechicle_reg_no) {
		this.vechicle_reg_no = vechicle_reg_no;
	}

	
	public ClientHome(String vechicle_reg_no,
			String address, String speed,
			String bus_tracking_timestamp) {
		super();
	
		this.vechicle_reg_no = vechicle_reg_no;
		this.address = address;
		
		this.speed = speed;
		this.bus_tracking_timestamp = bus_tracking_timestamp;
	}
	
	
	
}
