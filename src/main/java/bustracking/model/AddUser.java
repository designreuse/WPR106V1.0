package bustracking.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class AddUser{
	
	
	private String org_id;
	
	@NotEmpty
	private String org_name;
	
	@NotEmpty
	private String branch;
	
	@NotEmpty
	@Length(min=4,max=32,message="First Name should between 4 to 32 characters!!!")
	private String firstname;
	
	@NotEmpty
	@Length(min=4,max=32,message="Last Name should between 4 to 32 characters!!!")
	private String lastname;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty
	@Length(min=5,max=32,message="User Name should between 5 to 32 characters!!!")
	private String username;
	
	@NotEmpty
	@Length(min=4,max=32,message="Password should between 4 to 32 characters!!!")
	private String password;
	
	@NotEmpty
	@Length(min=4,max=32,message="Password should between 4 to 32 characters!!!")
	private String confirm_password;

	public AddUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public AddUser(String org_name, String branch,
			String firstname, String lastname, String email, String username,
			String password) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.username = username;
		this.password = password;
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

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}


	// Constructor for Edit Operation
	
	
	public AddUser(String org_name, String branch, String firstname,
			String lastname, String email, String username, String password,
			String confirm_password) {
		super();
		this.org_name = org_name;
		this.branch = branch;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.username = username;
		this.password = password;
		this.confirm_password = confirm_password;
	}
	
	
	
	
}