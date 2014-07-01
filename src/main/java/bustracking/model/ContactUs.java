package bustracking.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class ContactUs{
	
	@Length(min=4,max=32,message="Firstname must be of length 4 to 32.")
	private String firstname;
	
	//@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String lastname;
	
	@NotEmpty
	private String email;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String organisation;
	
	@Length(min=10,max=10,message="Required & must be of length 10.")
	private String mobile;
	
	@NotEmpty
	private String address1;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String state;
	
	@Length(min=4,max=32,message="Required & must be of length 4 to 32.")
	private String city;

	public ContactUs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContactUs(String firstname, String lastname, String email,
			String organisation, String mobile, String address1, String state, String city) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.organisation = organisation;
		this.mobile = mobile;
		this.address1 = address1;
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