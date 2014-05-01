package bustracking.model;

public class Trackinginfo
{
	private String org_id;
	public Trackinginfo(String latitude, String langitude) {
		super();
		this.latitude = latitude;
		this.langitude = langitude;
	}
	private String route_id;
	private String device_id;
	private String time_stamp;
	private String pickup_stop_id;
	private String drop_stop_id;
	private String latitude;
	private String langitude;
	private String speed_kph;
	private String heading;
	private String altitude;
	private String address;
	private String message_sent;
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getRoute_id() {
		return route_id;
	}
	public void setRoute_id(String route_id) {
		this.route_id = route_id;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public String getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}
	public String getPickup_stop_id() {
		return pickup_stop_id;
	}
	public void setPickup_stop_id(String pickup_stop_id) {
		this.pickup_stop_id = pickup_stop_id;
	}
	public String getDrop_stop_id() {
		return drop_stop_id;
	}
	public void setDrop_stop_id(String drop_stop_id) {
		this.drop_stop_id = drop_stop_id;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLangitude() {
		return langitude;
	}
	public void setLangitude(String langitude) {
		this.langitude = langitude;
	}
	public String getSpeed_kph() {
		return speed_kph;
	}
	public void setSpeed_kph(String speed_kph) {
		this.speed_kph = speed_kph;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getAltitude() {
		return altitude;
	}
	public void setAltitude(String altitude) {
		this.altitude = altitude;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage_sent() {
		return message_sent;
	}
	public void setMessage_sent(String message_sent) {
		this.message_sent = message_sent;
	}
	public Trackinginfo(String org_id, String route_id, String device_id,
			String time_stamp, String pickup_stop_id, String drop_stop_id,
			String latitude, String langitude, String speed_kph,
			String heading, String altitude, String address, String message_sent) {
		super();
		this.org_id = org_id;
		this.route_id = route_id;
		this.device_id = device_id;
		this.time_stamp = time_stamp;
		this.pickup_stop_id = pickup_stop_id;
		this.drop_stop_id = drop_stop_id;
		this.latitude = latitude;
		this.langitude = langitude;
		this.speed_kph = speed_kph;
		this.heading = heading;
		this.altitude = altitude;
		this.address = address;
		this.message_sent = message_sent;
	}
	public Trackinginfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}