package bustracking.model;

public class Route_view
{
	private String org_name;
	
	private String branch;
	
	private String org_id;
	
	private String route_no;
	
	private String stop_id;
	
	private String bus_reg_no;
	
	private String trip;
	
	private String bus_stop_address;
	
	private String bus_arrival_time;
	
	private String no_of_stops;

	public Route_view() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Route_view(String bus_stop_address) {
		super();
		this.bus_stop_address = bus_stop_address;
	}


	public Route_view(String org_name, String branch, String org_id,
			String route_no, String stop_id, String bus_reg_no, String trip,
			String bus_stop_address) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.org_id = org_id;
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.bus_reg_no = bus_reg_no;
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
	}

	//Constructor for Client Side view
	
	public Route_view(String route_no, String no_of_stops, String bus_reg_no,
			String trip, String bus_stop_address, String bus_arrival_time) {
		super();
		this.route_no = route_no;
		this.no_of_stops = no_of_stops;
		this.bus_reg_no = bus_reg_no;
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
		this.bus_arrival_time = bus_arrival_time;
	}
	

	// Constructor For Admin Side Edit
	
	public Route_view(String org_id,String org_name, String branch, String route_no,
			 String trip, String bus_stop_address,
			String bus_arrival_time) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.route_no = route_no;
		
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
		this.bus_arrival_time = bus_arrival_time;
	}

	// Constructor For Message Log table
	public Route_view(String route_no, String stop_id, String bus_reg_no) {
		super();
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.bus_reg_no = bus_reg_no;
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

	public String getBus_reg_no() {
		return bus_reg_no;
	}

	public void setBus_reg_no(String bus_reg_no) {
		this.bus_reg_no = bus_reg_no;
	}

	public String getTrip() {
		return trip;
	}

	public void setTrip(String trip) {
		this.trip = trip;
	}

	public String getBus_stop_address() {
		return bus_stop_address;
	}

	public void setBus_stop_address(String bus_stop_address) {
		this.bus_stop_address = bus_stop_address;
	}


public String getNo_of_stops() {
		return no_of_stops;
	}



	public void setNo_of_stops(String no_of_stops) {
		this.no_of_stops = no_of_stops;
	}



	public String getBus_arrival_time() {
		return bus_arrival_time;
	}



	public void setBus_arrival_time(String bus_arrival_time) {
		this.bus_arrival_time = bus_arrival_time;
	}
	

	// Constructor For View Routes in admin side

	public Route_view(String org_name, String branch, String org_id,
			String route_no, String stop_id, String bus_reg_no, String trip,
			String bus_stop_address, String bus_arrival_time, String no_of_stops) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.org_id = org_id;
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.bus_reg_no = bus_reg_no;
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
		this.bus_arrival_time = bus_arrival_time;
		this.no_of_stops = no_of_stops;
	}


   // Constructor for Search operations in Route
	
	public Route_view(String org_name, String branch, String org_id,
			String route_no, String stop_id, String bus_reg_no, String trip,
			String bus_stop_address, String bus_arrival_time) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.org_id = org_id;
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.bus_reg_no = bus_reg_no;
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
		this.bus_arrival_time = bus_arrival_time;
	}

// Constructor for Show Full Information

	public Route_view(String route_no, String stop_id, String trip,
			String bus_stop_address, String bus_arrival_time) {
		super();
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.trip = trip;
		this.bus_stop_address = bus_stop_address;
		this.bus_arrival_time = bus_arrival_time;
	}


	
}