package bustracking.model;


import javax.validation.GroupSequence;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@GroupSequence({OrgRegistration.class})
public class OrgRegistration
{
private String org_id;


//@Length(min=4,max=32,groups=Default.class,message="Organization Name should between 4 to 32 characters!!!")

 
@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String org_name;


@NotEmpty
@Pattern(regexp="(^$|[0-9]{10})",message="Invalid Fax Number!!!")
private String office_fax;


@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String branch;


@NotEmpty
@Email
private String email_id;

@NotEmpty
private String address;


private String chairman_name;


@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String country;

@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
private String chairman_telephone_number;


@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String state;


private String principal_name;


@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String city;

@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
private String principal_telephone_number;

@NotEmpty
@Pattern(regexp="(^$|[0-9]{6})",message="Invalid Pincode!!!")
private String pincode;


@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
private String transport_officer_name;

@NotEmpty
private String type_of_organization;

@NotEmpty
@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
private String transport_officer_number;

@NotEmpty
@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
private String office_land_line1;

@NotEmpty
private String is_active;

@NotEmpty
@Pattern(regexp="(^$|[7-9]{1}[0-9]{9})",message="Invalid Mobile Number!!!")
private String office_land_line2;


public OrgRegistration() {
	super();
	// TODO Auto-generated constructor stub
}

public OrgRegistration(String org_id, String org_name, 
		String branch, String city,String country,String type_of_organization,String is_active, String email_id, String address,String office_fax, String chairman_name,
		 String chairman_telephone_number, String state,
		String principal_name, String principal_telephone_number,
		String pincode, String transport_officer_name,
		 String transport_officer_number,
		String office_land_line1,  String office_land_line2
		) {
	super();
	this.org_id = org_id;
	this.org_name = org_name;
    this.branch = branch;
	this.city = city;
	this.country = country;
	this.is_active = is_active;
	this.email_id = email_id;
	this.address = address;
	this.chairman_name = chairman_name;
	this.chairman_telephone_number = chairman_telephone_number;
	this.state = state;
	this.office_fax = office_fax;
	this.principal_name = principal_name;
	
	this.principal_telephone_number = principal_telephone_number;
	this.pincode = pincode;
	this.transport_officer_name = transport_officer_name;
	this.type_of_organization = type_of_organization;
	this.transport_officer_number = transport_officer_number;
	this.office_land_line1 = office_land_line1;
	
	this.office_land_line2 = office_land_line2;
	
}

public String getOrg_id() {
	return org_id;
}

public void setOrg_id(String org_id) {
	this.org_id = org_id;
}

public String getOrg_name() {
	return org_name;
}

public void setOrg_name(String org_name) {
	this.org_name = org_name;
}

public String getOffice_fax() {
	return office_fax;
}

public void setOffice_fax(String office_fax) {
	this.office_fax = office_fax;
}

public String getBranch() {
	return branch;
}

public void setBranch(String branch) {
	this.branch = branch;
}

public String getEmail_id() {
	return email_id;
}

public void setEmail_id(String email_id) {
	this.email_id = email_id;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getChairman_name() {
	return chairman_name;
}

public void setChairman_name(String chairman_name) {
	this.chairman_name = chairman_name;
}

public String getCountry() {
	return country;
}

public void setCountry(String country) {
	this.country = country;
}

public String getChairman_telephone_number() {
	return chairman_telephone_number;
}

public void setChairman_telephone_number(String chairman_telephone_number) {
	this.chairman_telephone_number = chairman_telephone_number;
}

public String getState() {
	return state;
}

public void setState(String state) {
	this.state = state;
}

public String getPrincipal_name() {
	return principal_name;
}

public void setPrincipal_name(String principal_name) {
	this.principal_name = principal_name;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getPrincipal_telephone_number() {
	return principal_telephone_number;
}

public void setPrincipal_telephone_number(String principal_telephone_number) {
	this.principal_telephone_number = principal_telephone_number;
}

public String getPincode() {
	return pincode;
}

public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String getTransport_officer_name() {
	return transport_officer_name;
}

public void setTransport_officer_name(String transport_officer_name) {
	this.transport_officer_name = transport_officer_name;
}

public String getType_of_organization() {
	return type_of_organization;
}

public void setType_of_organization(String type_of_organization) {
	this.type_of_organization = type_of_organization;
}

public String getTransport_officer_number() {
	return transport_officer_number;
}

public void setTransport_officer_number(String transport_officer_number) {
	this.transport_officer_number = transport_officer_number;
}

public String getOffice_land_line1() {
	return office_land_line1;
}

public void setOffice_land_line1(String office_land_line1) {
	this.office_land_line1 = office_land_line1;
}

public String getIs_active() {
	return is_active;
}

public void setIs_active(String isactive) {
	this.is_active = isactive;
}

public String getOffice_land_line2() {
	return office_land_line2;
}

public void setOffice_land_line2(String office_land_line2) {
	this.office_land_line2 = office_land_line2;
}


// Constructor For Edit

public OrgRegistration(String org_name, String office_fax, String branch,
		String email_id, String address, String chairman_name, String country,
		String chairman_telephone_number, String state, String principal_name,
		String city, String principal_telephone_number, String pincode,
		String transport_officer_name, String type_of_organization,
		String transport_officer_number, String office_land_line1,
		String is_active, String office_land_line2) {
	super();
	this.org_name = org_name;
	this.office_fax = office_fax;
	this.branch = branch;
	this.email_id = email_id;
	this.address = address;
	this.chairman_name = chairman_name;
	this.country = country;
	this.chairman_telephone_number = chairman_telephone_number;
	this.state = state;
	this.principal_name = principal_name;
	this.city = city;
	this.principal_telephone_number = principal_telephone_number;
	this.pincode = pincode;
	this.transport_officer_name = transport_officer_name;
	this.type_of_organization = type_of_organization;
	this.transport_officer_number = transport_officer_number;
	this.office_land_line1 = office_land_line1;
	this.is_active = is_active;
	this.office_land_line2 = office_land_line2;
}



}