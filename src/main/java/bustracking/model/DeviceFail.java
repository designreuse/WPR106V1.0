package bustracking.model;

public class DeviceFail
{
	private String failure_no;
	public DeviceFail(String failure_no, String device_id,
			String device_fail_status, String date) {
		super();
		this.failure_no = failure_no;
		this.device_id = device_id;
		this.device_fail_status = device_fail_status;
		this.date = date;
	}
	public String getFailure_no() {
		return failure_no;
	}
	public void setFailure_no(String failure_no) {
		this.failure_no = failure_no;
	}
	public DeviceFail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public String getDevice_fail_status() {
		return device_fail_status;
	}
	public void setDevice_fail_status(String device_fail_status) {
		this.device_fail_status = device_fail_status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private String device_id;
	private String device_fail_status;
	private String date;
	
	
}