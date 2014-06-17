package bustracking.model;



import java.lang.*;


public class Report{
	
	private String org_id;
	
	private String org_name;
	
	private String branch;
	
	public Report(String org_id, String student_roll_no,
			String sms_trigger_time, String status, String mobile_number) {
		super();
		this.org_id = org_id;
		this.student_roll_no = student_roll_no;
		this.sms_trigger_time = sms_trigger_time;
		this.status = status;
		this.mobile_number = mobile_number;
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



	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	private String student_roll_no;
	
	private String sms_trigger_time;
	
	private String status;
	
	private String mobile_number;

	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	public String getStudent_roll_no() {
		return student_roll_no;
	}

	public void setStudent_roll_no(String student_roll_no) {
		this.student_roll_no = student_roll_no;
	}

	public String getSms_trigger_time() {
		return sms_trigger_time;
	}

	public void setSms_trigger_time(String sms_trigger_time) {
		this.sms_trigger_time = sms_trigger_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Constructor for Admin Side SMS Report

	public Report(String org_id, String org_name, String branch,
			String student_roll_no, String sms_trigger_time, String status,
			String mobile_number) {
		super();
		this.org_id = org_id;
		this.org_name = org_name;
		this.branch = branch;
		this.student_roll_no = student_roll_no;
		this.sms_trigger_time = sms_trigger_time;
		this.status = status;
		this.mobile_number = mobile_number;
	}

	/*
	 * Get Student roll no for Client Track SMS
	 */
	
	
	public Report(String student_roll_no, String mobile_number) {
		super();
		this.student_roll_no = student_roll_no;
		this.mobile_number = mobile_number;
	}



	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
