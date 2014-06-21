package bustracking.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ClassSection
{
	
	private String org_id;
	
	@NotEmpty
	private String class_std;
	
	@NotEmpty
	private String section;
	
	@NotEmpty
	private String org_name;
	
	@NotEmpty
	private String branch;
	
	@NotEmpty
	private String service;
	
	
	
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
	public String getClass_std() {
		return class_std;
	}
	public void setClass_std(String class_std) {
		this.class_std = class_std;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	
	
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public ClassSection() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassSection(String org_name, String branch,String class_std, String section, String service) {
		super();
		
		this.class_std = class_std;
		this.section = section;
		this.branch=branch;
		this.org_name=org_name;
		this.service=service;
		
	}
}