package bustracking.model;

public class Route
{
	private String org_id;
	private String route_no;
	private String stop_id;
	private String trip;
	private String address;
	private String latitude;
	private String longitude;
	private String bus_arrival_time;
	public Route() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Route(String org_id, String route_no, String stop_id, String trip,
			String address, String latitude, String longitude,
			String bus_arrival_time) {
		super();
		this.org_id = org_id;
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.trip = trip;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.bus_arrival_time = bus_arrival_time;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
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
	public String getTrip() {
		return trip;
	}
	public void setTrip(String trip) {
		this.trip = trip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	
	
	

	
}