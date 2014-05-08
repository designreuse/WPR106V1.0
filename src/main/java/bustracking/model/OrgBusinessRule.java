package bustracking.model;
import java.util.*;

public class OrgBusinessRule{
	
	private String org_id;
	private String org_name;
	private String branch;
	private String sms_sending;
	private String sms_options;
	private String speed_limit;
	private String pickup_start_time;
	private String pickup_end_time;
	private String drop_start_time;
	private String drop_end_time;
	private String kg_start_time;
	private String kg_end_time;
	private String google_map_traffic;
	private String saturday;
	private String alert_time_interval;
	
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
	
	public String getSms_options() {
		return sms_options;
	}
	public void setSms_options(String sms_options) {
		this.sms_options = sms_options;
	}
	public String getAlert_time_interval() {
		return alert_time_interval;
	}
	public void setAlert_time_interval(String alert_time_interval) {
		this.alert_time_interval = alert_time_interval;
	}
	public String getSms_sending() {
		return sms_sending;
	}
	public void setSms_sending(String sms_sending) {
		this.sms_sending = sms_sending;
	}
	public String getGoogle_map_traffic() {
		return google_map_traffic;
	}
	public void setGoogle_map_traffic(String google_map_traffic) {
		this.google_map_traffic = google_map_traffic;
	}
	
	public String getSpeed_limit() {
		return speed_limit;
	}
	public void setSpeed_limit(String speed_limit) {
		this.speed_limit = speed_limit;
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
	public void setDrop_start_time(String drop_strart_time) {
		this.drop_start_time = drop_strart_time;
	}
	public String getDrop_end_time() {
		return drop_end_time;
	}
	
	public String getKg_start_time() {
		return kg_start_time;
	}
	public void setKg_start_time(String kg_start_time) {
		this.kg_start_time = kg_start_time;
	}
	public String getKg_end_time() {
		return kg_end_time;
	}
	public void setKg_end_time(String kg_end_time) {
		this.kg_end_time = kg_end_time;
	}
	
	public void setDrop_end_time(String drop_end_time) {
		this.drop_end_time = drop_end_time;
	}
	
	public OrgBusinessRule(String org_id,String google_map_traffic,String pickup_start_time, String pickup_end_time,
			String drop_start_time, String drop_end_time,String kg_start_time,String kg_end_time ,String speed_limit,
			String sms_options,String alert_time_interval,String saturday,String sms_sending) {
		super();
		this.org_id = org_id;
		this.google_map_traffic=google_map_traffic;
		this.sms_sending = sms_sending;
		this.sms_options = sms_options;
		this.speed_limit = speed_limit;
		this.pickup_start_time = pickup_start_time;
		this.pickup_end_time = pickup_end_time;
		this.drop_start_time = drop_start_time;
		this.drop_end_time = drop_end_time;
		this.kg_start_time=kg_start_time;
		this.kg_end_time=kg_end_time;
		this.saturday=saturday;
		this.alert_time_interval=alert_time_interval;
	}
	
	public OrgBusinessRule(String org_name,String branch,String google_map_traffic,String pickup_start_time,
			String pickup_end_time,	String drop_start_time, String drop_end_time,String kg_start_time,String kg_end_time ,
			String speed_limit,	String sms_options,String alert_time_interval,String saturday,String sms_sending) {
		super();
		
		this.org_name=org_name;
		this.branch=branch;
		this.google_map_traffic=google_map_traffic;
		this.sms_sending = sms_sending;
		this.sms_options = sms_options;
		this.speed_limit = speed_limit;
		this.pickup_start_time = pickup_start_time;
		this.pickup_end_time = pickup_end_time;
		this.drop_start_time = drop_start_time;
		this.drop_end_time = drop_end_time;
		this.kg_start_time=kg_start_time;
		this.kg_end_time=kg_end_time;
		this.saturday=saturday;
		this.alert_time_interval=alert_time_interval;
	}
	public OrgBusinessRule(String org_id,String org_name,String branch,String google_map_traffic,String pickup_start_time,
			String pickup_end_time,	String drop_start_time, String drop_end_time,String kg_start_time,String kg_end_time ,
			String speed_limit,	String sms_options,String alert_time_interval,String saturday,String sms_sending) {
		super();
		this.org_id=org_id;
		this.org_name=org_name;
		this.branch=branch;
		this.google_map_traffic=google_map_traffic;
		this.sms_sending = sms_sending;
		this.sms_options = sms_options;
		this.speed_limit = speed_limit;
		this.pickup_start_time = pickup_start_time;
		this.pickup_end_time = pickup_end_time;
		this.drop_start_time = drop_start_time;
		this.drop_end_time = drop_end_time;
		this.kg_start_time=kg_start_time;
		this.kg_end_time=kg_end_time;
		this.saturday=saturday;
		this.alert_time_interval=alert_time_interval;
	}
	
	public OrgBusinessRule() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}