package bustracking.model;

import java.lang.*;

public class Holidays{
	
	private String org_id;
	private String org_name;
	private String branch;
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
	
	public Holidays(String org_id, String holiday_date, String holiday_reason) {
		super();
		this.org_id = org_id;
		this.holiday_date = holiday_date;
		this.holiday_reason = holiday_reason;
	}
	
	// View Holidays 
	
	public Holidays(String org_name, String branch, String holiday_date,
			String holiday_reason) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.holiday_date = holiday_date;
		this.holiday_reason = holiday_reason;
	}
	
	public Holidays() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}