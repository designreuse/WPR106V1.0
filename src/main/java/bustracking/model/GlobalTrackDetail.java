package bustracking.model;

public class GlobalTrackDetail
{
	private String route_no;
	
	private String stop_id;
	
	public GlobalTrackDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String last_distance;

	public String getRoute_no() {
		return route_no;
	}

	public GlobalTrackDetail(String route_no, String stop_id,
			String last_distance) {
		super();
		this.route_no = route_no;
		this.stop_id = stop_id;
		this.last_distance = last_distance;
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

	public String getLast_distance() {
		return last_distance;
	}

	public void setLast_distance(String last_distance) {
		this.last_distance = last_distance;
	}
}