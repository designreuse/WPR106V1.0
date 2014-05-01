package bustracking.model;


public class FleetHomepage {

	private String vehicle_no;
	
	private String address;
	
	private String speed;
	
	private String date_time;
	
	private String device_imei_number;

	public FleetHomepage(String vehicle_no, String address, String speed,
			String date_time, String device_imei_number) {
		super();
		this.vehicle_no = vehicle_no;
		this.address = address;
		this.speed = speed;
		this.date_time = date_time;
		this.device_imei_number = device_imei_number;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpeed() {
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getDate_time() {
		return date_time;
	}

	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}

	public String getDevice_imei_number() {
		return device_imei_number;
	}

	public void setDevice_imei_number(String device_imei_number) {
		this.device_imei_number = device_imei_number;
	}
	
}
