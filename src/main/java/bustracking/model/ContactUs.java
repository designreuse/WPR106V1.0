package bustracking.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class ContactUs{
	
	@NotEmpty
	private String firstname;
	
	@NotEmpty
	private String lastname;
	
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String organisation;
	
	@NotEmpty
	private String mobile;
	
	@NotEmpty
	private String address1;
	
	@NotEmpty
	private String address2;
	
	@NotEmpty
	private String state;
	
	@NotEmpty
	private String city;

	public ContactUs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContactUs(String firstname, String lastname, String email,
			String organisation, String mobile, String address1,
			String address2, String state, String city) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.organisation = organisation;
		this.mobile = mobile;
		this.address1 = address1;
		this.address2 = address2;
		this.state = state;
		this.city = city;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrganisation() {
		return organisation;
	}

	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
	
	
}