package bustracking.model;

import javax.validation.ReportAsSingleViolation;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class StudentRegistration{
	private String org_id;
	
	@NotEmpty
	private String org_name;
	
	@NotEmpty
	private String branch;
	
	@NotEmpty
	private String student_roll_no;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String first_name;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String last_name;
	
	private String gender;
	
	private String transport_facility;
	
	@NotEmpty
	private String pickup_route_no;
	
	@NotEmpty
	private String pickup_point_address;
	
	private String pickup_stop_id;
	
	@NotEmpty
	private String drop_route_no;
	
	@NotEmpty
	private String drop_point_address;
	
	private String drop_stop_id;
	
	private String kg_drop;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String parent_name1;
	
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String parent_name2;
	
	@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
	@NotEmpty
	private String parent_mobile1;
	
	@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
	@NotEmpty
	private String parent_mobile2;
	
	@Email
	@NotEmpty
	private String parent_email1;
	
	@Email
	@NotEmpty
	private String parent_email2;
	
	@NotEmpty
	private String class_standard;
	
	@NotEmpty
	private String section;

	
	public StudentRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudentRegistration(String org_id, String student_roll_no,
			String first_name, String last_name, String gender,
			String transport_facility, String pickup_route_no,
			String pickup_point_address,String pickup_stop_id, String drop_route_no,
			String drop_point_address,String drop_stop_id, String kg_drop, String parent_name1,
			String parent_name2, String parent_mobile1, String parent_mobile2,
			String parent_email1, String parent_email2, String class_standard,
			String section) {
		super();
		this.org_id = org_id;
		this.student_roll_no = student_roll_no;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.transport_facility = transport_facility;
		this.pickup_route_no = pickup_route_no;
		this.pickup_point_address = pickup_point_address;
		this.pickup_stop_id=pickup_stop_id;
		this.drop_route_no = drop_route_no;
		this.drop_point_address = drop_point_address;
		this.drop_stop_id=drop_stop_id;
		this.kg_drop = kg_drop;
		this.parent_name1 = parent_name1;
		this.parent_name2 = parent_name2;
		this.parent_mobile1 = parent_mobile1;
		this.parent_mobile2 = parent_mobile2;
		this.parent_email1 = parent_email1;
		this.parent_email2 = parent_email2;
		this.class_standard = class_standard;
		this.section = section;
	}

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

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTransport_facility() {
		return transport_facility;
	}

	public void setTransport_facility(String transport_facility) {
		this.transport_facility = transport_facility;
	}

	public String getPickup_route_no() {
		return pickup_route_no;
	}

	public void setPickup_route_no(String pickup_route_no) {
		this.pickup_route_no = pickup_route_no;
	}

	public String getPickup_point_address() {
		return pickup_point_address;
	}

	public void setPickup_point_address(String pickup_point_address) {
		this.pickup_point_address = pickup_point_address;
	}

	public String getDrop_route_no() {
		return drop_route_no;
	}

	public void setDrop_route_no(String drop_route_no) {
		this.drop_route_no = drop_route_no;
	}

	public String getDrop_point_address() {
		return drop_point_address;
	}

	public void setDrop_point_address(String drop_point_address) {
		this.drop_point_address = drop_point_address;
	}

	public String getPickup_stop_id() {
		return pickup_stop_id;
	}

	public void setPickup_stop_id(String pickup_stop_id) {
		this.pickup_stop_id = pickup_stop_id;
	}

	public String getDrop_stop_id() {
		return drop_stop_id;
	}

	public void setDrop_stop_id(String drop_stop_id) {
		this.drop_stop_id = drop_stop_id;
	}

	public String getKg_drop() {
		return kg_drop;
	}

	public void setKg_drop(String kg_drop) {
		this.kg_drop = kg_drop;
	}

	public String getParent_name1() {
		return parent_name1;
	}

	public void setParent_name1(String parent_name1) {
		this.parent_name1 = parent_name1;
	}

	public String getParent_name2() {
		return parent_name2;
	}

	public void setParent_name2(String parent_name2) {
		this.parent_name2 = parent_name2;
	}

	public String getParent_mobile1() {
		return parent_mobile1;
	}

	public void setParent_mobile1(String parent_mobile1) {
		this.parent_mobile1 = parent_mobile1;
	}

	public String getParent_mobile2() {
		return parent_mobile2;
	}

	public void setParent_mobile2(String parent_mobile2) {
		this.parent_mobile2 = parent_mobile2;
	}

	public String getParent_email1() {
		return parent_email1;
	}

	public void setParent_email1(String parent_email1) {
		this.parent_email1 = parent_email1;
	}

	public String getParent_email2() {
		return parent_email2;
	}

	public void setParent_email2(String parent_email2) {
		this.parent_email2 = parent_email2;
	}

	public String getClass_standard() {
		return class_standard;
	}

	public void setClass_standard(String class_standard) {
		this.class_standard = class_standard;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
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

	public StudentRegistration(String org_name, String branch,
			String student_roll_no, String first_name, String last_name,String pickup_route_no,String drop_route_no,String class_standard) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.student_roll_no = student_roll_no;
		this.first_name = first_name;
		this.last_name = last_name;
		this.pickup_route_no=pickup_route_no;
		this.drop_route_no=drop_route_no;
		this.class_standard=class_standard;
	}
	
	
	
	//Constructor for Client Side view
	
	public StudentRegistration(String student_roll_no,
			String first_name, String last_name, String gender,
			 String pickup_route_no,
			String pickup_point_address, String drop_route_no,
			String drop_point_address, String kg_drop, String parent_name1,
			String parent_name2, String parent_mobile1, String parent_mobile2,
			String parent_email1, String parent_email2, String class_standard,
			String section) {
		super();
		
		this.student_roll_no = student_roll_no;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.pickup_route_no = pickup_route_no;
		this.pickup_point_address = pickup_point_address;
		this.drop_route_no = drop_route_no;
		this.drop_point_address = drop_point_address;
		this.kg_drop = kg_drop;
		this.parent_name1 = parent_name1;
		this.parent_name2 = parent_name2;
		this.parent_mobile1 = parent_mobile1;
		this.parent_mobile2 = parent_mobile2;
		this.parent_email1 = parent_email1;
		this.parent_email2 = parent_email2;
		this.class_standard = class_standard;
		this.section = section;
	}

	 // Client Side Edit Constructor
	
	public StudentRegistration(String org_id,String org_name,String branch,String student_roll_no, String first_name,
			String last_name, String pickup_route_no,
			String pickup_point_address,String pickup_stop_id, String drop_route_no,
			String drop_point_address,String drop_stop_id, String parent_name1,
			String parent_name2, String parent_mobile1, String parent_mobile2,
			String parent_email1, String parent_email2,String class_standard,String section) {
		super();
		this.org_id=org_id;
		this.org_name=org_name;
		this.branch=branch;
		this.student_roll_no = student_roll_no;
		this.first_name = first_name;
		this.last_name = last_name;
		this.pickup_route_no = pickup_route_no;
		this.pickup_point_address = pickup_point_address;
		this.pickup_stop_id=pickup_stop_id;
		this.drop_route_no = drop_route_no;
		this.drop_point_address = drop_point_address;
		this.drop_stop_id=drop_stop_id;
		this.parent_name1 = parent_name1;
		this.parent_name2 = parent_name2;
		this.parent_mobile1 = parent_mobile1;
		this.parent_mobile2 = parent_mobile2;
		this.parent_email1 = parent_email1;
		this.parent_email2 = parent_email2;
		this.class_standard=class_standard;
		this.section=section;
		
	}

	

	// Admin Side Edit Constructor
	
	public StudentRegistration(String org_name, String branch,
			String student_roll_no, String first_name, String last_name,
			String gender, String transport_facility, String pickup_route_no,
			String pickup_point_address,String pickup_stop_id, String drop_route_no,
			String drop_point_address,String drop_stop_id, String kg_drop, String parent_name1,
			String parent_name2, String parent_mobile1, String parent_mobile2,
			String parent_email1, String parent_email2, String class_standard,
			String section) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.student_roll_no = student_roll_no;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.transport_facility = transport_facility;
		this.pickup_route_no = pickup_route_no;
		this.pickup_point_address = pickup_point_address;
		this.pickup_stop_id=pickup_stop_id;
		this.drop_route_no = drop_route_no;
		this.drop_point_address = drop_point_address;
		this.drop_stop_id=drop_stop_id;
		this.kg_drop = kg_drop;
		this.parent_name1 = parent_name1;
		this.parent_name2 = parent_name2;
		this.parent_mobile1 = parent_mobile1;
		this.parent_mobile2 = parent_mobile2;
		this.parent_email1 = parent_email1;
		this.parent_email2 = parent_email2;
		this.class_standard = class_standard;
		this.section = section;
	}

	
	
}