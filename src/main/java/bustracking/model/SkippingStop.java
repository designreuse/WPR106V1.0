package bustracking.model;

public class SkippingStop
{
	private String route_no;
	
	private String stop_id;

	public SkippingStop(String route_no, String stop_id) {
		super();
		this.route_no = route_no;
		this.stop_id = stop_id;
	}

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public String getRoute_no() {
		return route_no;
	}

	public void setRoute_no(String route_no) {
		this.route_no = route_no;
	}
	
	
	
}

