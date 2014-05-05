package bustracking.model;

import java.util.*;
import java.lang.*;

public class SuperAdminHome{
	
	private String org_name;
	private String branch;
	private String no_of_vechicle;
	private String no_of_student;
	
	
	
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
	public String getNo_of_vechicle() {
		return no_of_vechicle;
	}
	public void setNo_of_vechicle(String no_of_vechicle) {
		this.no_of_vechicle = no_of_vechicle;
	}
	public String getNo_of_student() {
		return no_of_student;
	}
	public void setNo_of_student(String no_of_student) {
		this.no_of_student = no_of_student;
	}
	
	
	public SuperAdminHome(String org_name, String branch,
			String no_of_vechicle, String no_of_student) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.no_of_vechicle = no_of_vechicle;
		this.no_of_student = no_of_student;
	}
	
}

