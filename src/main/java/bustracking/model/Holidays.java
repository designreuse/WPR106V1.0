package bustracking.model;

import java.lang.*;

public class Holidays{
	
	private String org_id;
	private String holiday_date;
	private String holiday_reason;
	
	
	
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getHoliday_date() {
		return holiday_date;
	}
	public void setHoliday_date(String holiday_date) {
		this.holiday_date = holiday_date;
	}
	public String getHoliday_reason() {
		return holiday_reason;
	}
	public void setHoliday_reason(String holiday_reason) {
		this.holiday_reason = holiday_reason;
	}
	
	
	public Holidays(String org_id, String holiday_date, String holiday_reason) {
		super();
		this.org_id = org_id;
		this.holiday_date = holiday_date;
		this.holiday_reason = holiday_reason;
	}
	
	public Holidays() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}