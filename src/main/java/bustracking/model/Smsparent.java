package bustracking.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Smsparent{
	
	
	@NotEmpty
	private String route;
	
	@NotEmpty
	private String shift;
	
	@NotEmpty
	private String trip;
	
	@NotEmpty
	private String message;

	public Smsparent() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Smsparent(String route, String shift, String trip, String message) {
		super();
		this.route = route;
		this.shift = shift;
		this.trip = trip;
		this.message = message;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getTrip() {
		return trip;
	}

	public void setTrip(String trip) {
		this.trip = trip;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}