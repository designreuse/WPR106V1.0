package bustracking.model;

import java.lang.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


public class Holidays{
	
	
	private String org_id;
	
	@NotEmpty
	private String org_name;
	
	@NotEmpty
	private String branch;
	
	
	private String group1;
	
	private String fromdate;
	
	private String todate;
	
	private String holiday_date;
	
	@NotEmpty
	private String holiday_reason;
	
	
	
	
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
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
	
	
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
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