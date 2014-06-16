package bustracking.model;

public class LatLong{
	private String Latitude;
	private String Longitude;
	private String speed;
	private String address;
	private String date;
	private String exceed_speed;
	
	
	public String getExceed_speed() {
		return exceed_speed;
	}
	public void setExceed_speed(String exceed_speed) {
		this.exceed_speed = exceed_speed;
	}
	public String getSpeed() {
		return speed;
	}
	
	
	
	public LatLong(String latitude, String longitude, String speed,
			String address, String date, String exceed_speed) {
		super();
		Latitude = latitude;
		Longitude = longitude;
		this.speed = speed;
		this.address = address;
		this.date = date;
		this.exceed_speed = exceed_speed;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLatitude() {
		return Latitude;
	}
	public void setLatitude(String latitude) {
		Latitude = latitude;
	}
	public String getLongitude() {
		return Longitude;
	}
	public void setLongitude(String longitude) {
		Longitude = longitude;
	}
	
	public LatLong() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}