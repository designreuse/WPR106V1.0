package bustracking.model;

public class AdminSettings
{
	private String org_id;
	private String rule_id;
	private String sms_enabled;
	private String sms_type;
	private String time_before;
	private String acceptable_delay;
	private String speed_limit;
	private String last_update_time;
	private String pickup_start_time;
	private String pickup_end_time;
	private String drop_start_time;
	private String drop_end_time;
	private String holidays;
	private String saturday;

	public String getSaturday() {
		return saturday;
	}
	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getRule_id() {
		return rule_id;
	}
	public void setRule_id(String rule_id) {
		this.rule_id = rule_id;
	}
	public String getSms_enabled() {
		return sms_enabled;
	}
	public void setSms_enabled(String sms_enabled) {
		this.sms_enabled = sms_enabled;
	}
	public String getSms_type() {
		return sms_type;
	}
	public void setSms_type(String sms_type) {
		this.sms_type = sms_type;
	}
	public String getTime_before() {
		return time_before;
	}
	public void setTime_before(String time_before) {
		this.time_before = time_before;
	}
	public String getAcceptable_delay() {
		return acceptable_delay;
	}
	public void setAcceptable_delay(String acceptable_delay) {
		this.acceptable_delay = acceptable_delay;
	}
	public String getSpeed_limit() {
		return speed_limit;
	}
	public void setSpeed_limit(String speed_limit) {
		this.speed_limit = speed_limit;
	}
	public String getLast_update_time() {
		return last_update_time;
	}
	public void setLast_update_time(String last_update_time) {
		this.last_update_time = last_update_time;
	}
	public String getPickup_start_time() {
		return pickup_start_time;
	}
	public void setPickup_start_time(String pickup_start_time) {
		this.pickup_start_time = pickup_start_time;
	}
	public String getPickup_end_time() {
		return pickup_end_time;
	}
	public void setPickup_end_time(String pickup_end_time) {
		this.pickup_end_time = pickup_end_time;
	}
	public String getDrop_start_time() {
		return drop_start_time;
	}
	public void setDrop_start_time(String drop_start_time) {
		this.drop_start_time = drop_start_time;
	}
	public String getDrop_end_time() {
		return drop_end_time;
	}
	public void setDrop_end_time(String drop_end_time) {
		this.drop_end_time = drop_end_time;
	}
	public String getHolidays() {
		return holidays;
	}
	public void setHolidays(String holidays) {
		this.holidays = holidays;
	}
	
	public AdminSettings(String org_id, String rule_id, String sms_enabled,
			String sms_type, String time_before, String acceptable_delay,
			String speed_limit, String last_update_time,
			String pickup_start_time, String pickup_end_time,
			String drop_start_time, String drop_end_time, String holidays,
			String saturday) {
		super();
		this.org_id = org_id;
		this.rule_id = rule_id;
		this.sms_enabled = sms_enabled;
		this.sms_type = sms_type;
		this.time_before = time_before;
		this.acceptable_delay = acceptable_delay;
		this.speed_limit = speed_limit;
		this.last_update_time = last_update_time;
		this.pickup_start_time = pickup_start_time;
		this.pickup_end_time = pickup_end_time;
		this.drop_start_time = drop_start_time;
		this.drop_end_time = drop_end_time;
		this.holidays = holidays;
		this.saturday = saturday;
	}
	public AdminSettings() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}