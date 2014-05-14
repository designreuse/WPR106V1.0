package bustracking.model;

public class Trackinginfo
{
	private String org_id;
	
	private String vechicle_reg_no;
	
	private String latitude;
	
	private String longitude;
	
	private String bus_arrival_time;
	
	private String speed;
	
	private String exceed_speed_limit;
	
	private String bus_tracking_time;
	
	private String address;
	
	private String flag;

	public Trackinginfo(String org_id, String vechicle_reg_no, String latitude,
			String longitude, String bus_arrival_time, String speed,
			String exceed_speed_limit, String bus_tracking_time,
			String address, String flag) {
		super();
		this.org_id = org_id;
		this.vechicle_reg_no = vechicle_reg_no;
		this.latitude = latitude;
		this.longitude = longitude;
		this.bus_arrival_time = bus_arrival_time;
		this.speed = speed;
		this.exceed_speed_limit = exceed_speed_limit;
		this.bus_tracking_time = bus_tracking_time;
		this.address = address;
		this.flag = flag;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getBus_arrival_time() {
		return bus_arrival_time;
	}

	public void setBus_arrival_time(String bus_arrival_time) {
		this.bus_arrival_time = bus_arrival_time;
	}

	public String getSpeed() {
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getExceed_speed_limit() {
		return exceed_speed_limit;
	}

	public void setExceed_speed_limit(String exceed_speed_limit) {
		this.exceed_speed_limit = exceed_speed_limit;
	}

	public String getBus_tracking_time() {
		return bus_tracking_time;
	}

	public void setBus_tracking_time(String bus_tracking_time) {
		this.bus_tracking_time = bus_tracking_time;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
}