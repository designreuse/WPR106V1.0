package bustracking.model;



import java.lang.*;


public class Report{
	
	private String org_name;
	private String branch;
	private String fromdate;
	private String todate;
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
	
	
	
	public Report(String org_name, String branch, String fromdate, String todate) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.fromdate = fromdate;
		this.todate = todate;
	}
	
	
	
	
}
