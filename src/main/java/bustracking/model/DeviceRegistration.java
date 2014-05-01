package bustracking.model;

import java.sql.Timestamp;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class DeviceRegistration

{
	

	private String device_id;
	private String manufacturer;
	
	private String model_no;
	
	private String carrier;
	
	private String sim_card_number;
	
	private String device_procured_date;
	
	private String device_invoice_number;
	
	private String device_imei_number;
	
	private String device_tested;
	
	private String sim_procured_date;
	
	private String sim_invoice_number;
	
	private String sim_card_tested;
	
	private String device_sim_paired;
	
	private String  is_assigned;
	
	private String password;
	
	private String device_status;
	
	private String port_no;
	
	private String comments;
	
	private String apn;
	
	private String adminip;
	
	private String configuration_date;
	
	private String create_user_id;

	public DeviceRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	//Device IMEI Number Constructor
	
	public DeviceRegistration(String device_imei_number) {
		super();
		this.device_imei_number = device_imei_number;
	}



	public DeviceRegistration(String manufacturer, String model_no,
			String carrier, String sim_card_number,
			String device_procured_date, String device_invoice_number,
			String device_imei_no, String device_tested,
			String sim_procured_date, String sim_invoice_number,
			String sim_card_tested, String device_sim_paired,
			String is_assigned, String password, String device_status,
			String port_no, String comments, String apn, String adminip, String configuration_date, String create_user_id) {
		super();
		
		this.manufacturer = manufacturer;
		this.model_no = model_no;
		this.carrier = carrier;
		this.sim_card_number = sim_card_number;
		this.device_procured_date = device_procured_date;
		this.device_invoice_number = device_invoice_number;
		this.device_imei_number = device_imei_no;
		this.device_tested = device_tested;
		this.sim_procured_date = sim_procured_date;
		this.sim_invoice_number = sim_invoice_number;
		this.sim_card_tested = sim_card_tested;
		this.device_sim_paired = device_sim_paired;
		this.is_assigned = is_assigned;
		this.password = password;
		this.device_status = device_status;
		this.port_no = port_no;
		this.comments = comments;
		this.apn=apn;
		this.adminip=adminip;
		this.configuration_date=configuration_date;
		this.create_user_id=create_user_id;
	}


	public String getDevice_id() {
		return device_id;
	}


	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}


	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getModel_no() {
		return model_no;
	}

	public void setModel_no(String model_no) {
		this.model_no = model_no;
	}

	public String getDevice_procured_date() {
		return device_procured_date;
	}

	public void setDevice_procured_date(String device_procured_date) {
		this.device_procured_date = device_procured_date;
	}

	public String getDevice_invoice_number() {
		return device_invoice_number;
	}

	public void setDevice_invoice_number(String device_invoice_number) {
		this.device_invoice_number = device_invoice_number;
	}

	public String getDevice_tested() {
		return device_tested;
	}

	public void setDevice_tested(String device_tested) {
		this.device_tested = device_tested;
	}

	public String getSim_procured_date() {
		return sim_procured_date;
	}

	public void setSim_procured_date(String sim_procured_date) {
		this.sim_procured_date = sim_procured_date;
	}

	public String getSim_invoice_number() {
		return sim_invoice_number;
	}

	public void setSim_invoice_number(String sim_invoice_number) {
		this.sim_invoice_number = sim_invoice_number;
	}

	public String getSim_card_tested() {
		return sim_card_tested;
	}

	public void setSim_card_tested(String sim_card_tested) {
		this.sim_card_tested = sim_card_tested;
	}

	public String getDevice_sim_paired() {
		return device_sim_paired;
	}

	public void setDevice_sim_paired(String device_sim_paired) {
		this.device_sim_paired = device_sim_paired;
	}


	public String getCarrier() {
		return carrier;
	}


	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}


	public String getSim_card_number() {
		return sim_card_number;
	}


	public void setSim_card_number(String sim_card_number) {
		this.sim_card_number = sim_card_number;
	}


	public String getDevice_imei_number() {
		return device_imei_number;
	}


	public void setDevice_imei_number(String device_imei_number) {
		this.device_imei_number = device_imei_number;
	}


	public String getIs_assigned() {
		return is_assigned;
	}


	public void setIs_assigned(String is_assigned) {
		this.is_assigned = is_assigned;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getDevice_status() {
		return device_status;
	}


	public void setDevice_status(String device_status) {
		this.device_status = device_status;
	}


	public String getPort_no() {
		return port_no;
	}


	public void setPort_no(String port_no) {
		this.port_no = port_no;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getApn() {
		return apn;
	}


	public void setApn(String apn) {
		this.apn = apn;
	}


	public String getAdminip() {
		return adminip;
	}


	public void setAdminip(String adminip) {
		this.adminip = adminip;
	}


	public String getConfiguration_date() {
		return configuration_date;
	}


	public void setConfiguration_date(String configuration_date) {
		this.configuration_date = configuration_date;
	}


	public String getCreate_user_id() {
		return create_user_id;
	}


	public void setCreate_user_id(String create_user_id) {
		this.create_user_id = create_user_id;
	}
	
	
	

	
}