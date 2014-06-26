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
	private String device_imei_number;
	private String device_status;
	
	

	private String route_no;
	private String stop_id;
	private String trip;
	private String reached;
	private String last_message_send_pick;
	private String is_pick_message_send;
	
	
	public String getDevice_status() {
		return device_status;
	}

	public void setDevice_status(String device_status) {
		this.device_status = device_status;
	}

	public String getTrip() {
		return trip;
	}

	public void setTrip(String trip) {
		this.trip = trip;
	}

	public String getLast_message_send_pick() {
		return last_message_send_pick;
	}

	public void setLast_message_send_pick(String last_message_send_pick) {
		this.last_message_send_pick = last_message_send_pick;
	}

	public String getDevice_imei_number() {
		return device_imei_number;
	}

	public void setDevice_imei_number(String device_imei_number) {
		this.device_imei_number = device_imei_number;
	}

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

	
	public ClientHome(String device_status,String vechicle_reg_no,
			String address, String speed,
			String bus_tracking_timestamp,String device_imei_number) {
		super();
		
		this.device_status=device_status;
		this.vechicle_reg_no = vechicle_reg_no;
		this.address = address;
		
		this.speed = speed;
		this.bus_tracking_timestamp = bus_tracking_timestamp;
		this.device_imei_number=device_imei_number;
	}

	// Client home Search Page
	
	public ClientHome(String speed, String vechicle_reg_no, String address,
			String bus_tracking_timestamp) {
		super();
		this.speed = speed;
		this.vechicle_reg_no = vechicle_reg_no;
		this.address = address;
		this.bus_tracking_timestamp = bus_tracking_timestamp;
	}

	

	/*
	 *  Vehicle InforMation In client Side
	 */

	public ClientHome(String last_message_send_pick, String vechicle_reg_no, String route_no,
			String stop_id,String address,String trip, String reached,
			String is_pick_message_send) {
		super();
		
		this.last_message_send_pick = last_message_send_pick;
		this.vechicle_reg_no = vechicle_reg_no;
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.address = address;
		this.trip = trip;
		this.reached = reached;
		this.is_pick_message_send = is_pick_message_send;
	}

	/*
	 *  Vehicle Reg No For Vehicle Information Search
	 */
	
	public ClientHome(String vechicle_reg_no) {
		super();
		this.vechicle_reg_no = vechicle_reg_no;
	}
	
	public String getRoute_no() {
		return route_no;
	}

	
	public void setRoute_no(String route_no) {
		this.route_no = route_no;
	}

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public String getReached() {
		return reached;
	}

	public void setReached(String reached) {
		this.reached = reached;
	}

	public String getIs_pick_message_send() {
		return is_pick_message_send;
	}

	public void setIs_pick_message_send(String is_pick_message_send) {
		this.is_pick_message_send = is_pick_message_send;
	}
	
	
	
}
