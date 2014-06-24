package bustracking.controllers;
 
import java.util.Date;
import java.util.TimeZone;
import java.text.SimpleDateFormat;

import java.security.Principal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.aspectj.weaver.ltw.LTWWorld;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;


import bustracking.dao.BusDeviceRegistrationDAO;
import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.ClientHomeDAO;
import bustracking.dao.FleetHomepageDAO;
import bustracking.dao.MainDAO;
import bustracking.dao.OrgBusinessRuleDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.dao.RouteDAO;
import bustracking.dao.TrackingInfoDAO;
import bustracking.dao.MessageSending;

import bustracking.forms.BusDeviceRegistrationForm;
/*import bustracking.forms.DeviceFailForm;*/
import bustracking.forms.BusRegistrationForm;
import bustracking.forms.ClientHomeForm;
import bustracking.forms.DeviceRegistrationForm;
import bustracking.forms.FleetHomepageForm;
import bustracking.forms.OrgBusinessRuleForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.RouteViewForm;
import bustracking.forms.SmsparentForm;
import bustracking.forms.SuperAdminHomeForm;

import bustracking.forms.LatLongForm;
import bustracking.model.*;



import bustracking.model.XMLWriter;
@Controller
@SessionAttributes({"sample","device","listsize","menu","role","org_name","branch","vec_imei","holi","vechicle_reg_no","from_date","to_date"})
public class MainController {
	@Autowired
	RouteDAO routeDAO;
	
	@Autowired  
	MainDAO mainDAO; 
	

	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired
	BusRegistrationDAO busDAO;
	
	@Autowired  
	ClientHomeDAO clientHomeDAO; 
	
	
	@Autowired
	OrgBusinessRuleDAO businessRuleDAO;
 
	@Autowired
	TrackingInfoDAO trackingInfoDAO;
	
	@Autowired
	BusDeviceRegistrationDAO busDeviceRegistrationDAO;
	
	@Autowired
	BusRegistrationDAO busRegistrationDAO;
	
	@Autowired
	MessageSending messageSending;
	
	@Autowired
	FleetHomepageDAO fleetHomepageDAO;
	
	@RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	public String printWelcome(HttpSession session,ModelMap model, Principal principal ) {
	
		String role=mainDAO.getRole(principal.getName());
		session.setAttribute("menu",mainDAO.getRole(principal.getName()));
		
		if(role.equals("ROLE_SUPERADMIN")){
			
			session.removeAttribute("org_name");
			session.removeAttribute("branch");
			
			SuperAdminHomeForm superAdminHomeForm = new SuperAdminHomeForm();
			superAdminHomeForm.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm",superAdminHomeForm);
			
			SuperAdminHomeForm superAdminHomeForm1 = new SuperAdminHomeForm();
			superAdminHomeForm1.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm1",superAdminHomeForm1);
			
			return "superadmin_homepage";
		}
			
			
		else if(role.equals("ROLE_FCLIENT"))
		{
		    FleetHomepageForm fleetHomepageForm=new FleetHomepageForm();
		    
		    System.out.println("Fleet Org_id:"+mainDAO.getOrg_id(principal.getName()));
		    
		    fleetHomepageForm.setFleetHomepages(fleetHomepageDAO.getFleethomedetails(mainDAO.getOrg_id(principal.getName()),principal.getName()));
		    model.addAttribute("fleetHomepageForm",fleetHomepageForm);
			return "fleetclient_homepage";
				
		}
		else{
			
			session.removeAttribute("vechcicle_reg_no");
			
			ClientHomeForm clientHomeForm= new ClientHomeForm();
			clientHomeForm.setClienthome(clientHomeDAO.getClienthome(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("clientHomeForm",clientHomeForm);
			
			ClientHomeForm clientHomeForm1= new ClientHomeForm();
			clientHomeForm1.setClienthome(clientHomeDAO.getClienthome(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("clientHomeForm1",clientHomeForm1);
			
			return "client_home";
		}
 
		
 
	}

	@RequestMapping(value="/adminmenu", method = RequestMethod.GET)
	public String adminmenu(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "admin_menu";
	}
	@RequestMapping(value="/demo", method = RequestMethod.GET)
	public String demo_page(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		System.out.println("came!!!");
		
		System.out.println("latitude:"+request.getParameter("lat"));
		System.out.println("longitude:"+request.getParameter("long"));
		
		
		
		return "demo";
	}
	
	/*Client Dependent actions ::::GPS*/
	@RequestMapping(value="/clienthome", method = RequestMethod.GET)
	public String clienthome(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		session.removeAttribute("vechicle_reg_no");
		
		return "client_home";
	}
	
	
	
	/*@RequestMapping(value="/clientviewroutedetails", method = RequestMethod.GET)
	public String clientviewroutedetails(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_view_route_details";
	}
	*/
	
	/*
	 * Vehicle Information In Client Side
	 * 
	 */
	
	
	@RequestMapping(value="/clientvechicledetails", method = RequestMethod.GET)
	public String clientbusnodetails(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		session.removeAttribute("vechicle_reg_no");
		session.removeAttribute("from_date");
		session.removeAttribute("to_date");
		
		ClientHomeForm clientHomeForm=new ClientHomeForm();
		clientHomeForm.setClienthome(clientHomeDAO.vechicle_traveled_information(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("clientHomeForm",clientHomeForm);
		
		ClientHomeForm clientHomeForm1=new ClientHomeForm();
		clientHomeForm1.setClienthome(clientHomeDAO.vechicle_reg_no_for_vechicle_information(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("clientHomeForm1",clientHomeForm1);
		
		return "client_busno_details";
	}
	
	
	/*
	 * Vehicle Information Search Client Side
	 * 
	 */
	
	
	@RequestMapping(value="/searchvechicleinformation", method = RequestMethod.GET)
	public String searchvechicleinformation(HttpSession session,HttpServletRequest request,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@RequestParam("from_date") String from_date,@RequestParam("to_date") String to_date,ModelMap model, Principal principal ) {
		
		session.setAttribute("vechicle_reg_no",vechicle_reg_no);
		session.setAttribute("from_date",from_date);
		session.setAttribute("to_date", to_date);
		
		if(vechicle_reg_no=="" && from_date=="" && to_date==""){
			

			ClientHomeForm clientHomeForm1=new ClientHomeForm();
			clientHomeForm1.setClienthome(clientHomeDAO.vechicle_reg_no_for_vechicle_information(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("clientHomeForm1",clientHomeForm1);
			
			return "client_busno_details";
		}
		else{
			
			ClientHomeForm clientHomeForm=new ClientHomeForm();
			clientHomeForm.setClienthome(clientHomeDAO.vechicle_information_search(mainDAO.getOrg_id(principal.getName()),vechicle_reg_no, from_date, to_date));
			model.addAttribute("clientHomeForm",clientHomeForm);
			
			ClientHomeForm clientHomeForm1=new ClientHomeForm();
			clientHomeForm1.setClienthome(clientHomeDAO.vechicle_reg_no_for_vechicle_information(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("clientHomeForm1",clientHomeForm1);
			
			return "client_busno_details";
		}
		
		
	}
	
	
	
	/*@RequestMapping(value="/clientviewstudent", method = RequestMethod.GET)
	public String clientviewstudent(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_view_student";
	}
	
	
	@RequestMapping(value="/clientsmsoption", method = RequestMethod.GET)
	public String clientsmsoption(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_sms_option";
	}
	
	@RequestMapping(value="/clientreport", method = RequestMethod.GET)
	public String clientreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_report_page";
	}
	

	@RequestMapping(value="/adminreport", method = RequestMethod.GET)
	public String adminreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "view_report";
	}
	
	

	@RequestMapping(value="/adminholiday", method = RequestMethod.GET)
	public String adminholiday(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "view_holiday";
	}
	*/
	

	@RequestMapping(value="/trackinghistory", method = RequestMethod.GET)
	public String trackinghistory(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "admin_tracking_history";
	}
	

	@RequestMapping(value="/routeinfo", method = RequestMethod.GET)
	public String routeinfo(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		

		return "client_view_routes";
	}
	
	

	@RequestMapping(value="/driverlist", method = RequestMethod.GET)
	public String driverlist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		session.removeAttribute("driver_name");
		session.removeAttribute("vechicle_reg_no");
		session.removeAttribute("driver_licence_number");
		
		BusRegistrationForm busRegistrationForm=new BusRegistrationForm();
		busRegistrationForm.setBusregistration(busRegistrationDAO.getBusregistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busRegistrationForm",busRegistrationForm);
		
		BusRegistrationForm busRegistrationForm1=new BusRegistrationForm();
		busRegistrationForm1.setBusregistration(busRegistrationDAO.getBusregistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busRegistrationForm1",busRegistrationForm1);
		
		return "client_driver_list";
		
	}
	
	// Find the Deriver List in Client Side
	
	@RequestMapping(value="/finddriverclient",method=RequestMethod.GET)
	public String finddriverClient(HttpSession session,HttpServletRequest request,@RequestParam("driver_name") String driver_name,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@RequestParam("driver_licence_number") String driver_licence_number,ModelMap model, Principal principal)
	{
		session.setAttribute("driver_name", driver_name);
		session.setAttribute("vechicle_reg_no", vechicle_reg_no);
		session.setAttribute("driver_licence_number", driver_licence_number);
		
		
		if(driver_name=="" && vechicle_reg_no=="" && driver_licence_number=="")
		{

			BusRegistrationForm busRegistrationForm1=new BusRegistrationForm();
			busRegistrationForm1.setBusregistration(busRegistrationDAO.getBusregistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("busRegistrationForm1",busRegistrationForm1);
			
			return "client_driver_list";
		}
		else
		{
			
		BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
		busRegistrationForm.setBusregistration(busRegistrationDAO.clientdriverlistsearch(mainDAO.getOrg_id(principal.getName()),driver_name,vechicle_reg_no, driver_licence_number));
        model.addAttribute("busRegistrationForm", busRegistrationForm);    
        
        BusRegistrationForm busRegistrationForm1=new BusRegistrationForm();
		busRegistrationForm1.setBusregistration(busRegistrationDAO.getBusregistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busRegistrationForm1",busRegistrationForm1);
        
		return "client_driver_list";
		}
		
	}


	@RequestMapping(value="/clientstudentlist", method = RequestMethod.GET)
	public String clientstudentlist(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_student_list";
	}
	



	@RequestMapping(value="/clientstudentdata", method = RequestMethod.GET)
	public String clientstudentdata(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_student_data";
	}
	



	@RequestMapping(value="/clientstudentroutemap", method = RequestMethod.GET)
	public String clientstudentroutemap(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_student_routemap";
	}
	



	@RequestMapping(value="/clientsmsparent", method = RequestMethod.GET)
	public String clientsmsparent(HttpServletRequest request,String trip, String org_id, ModelMap model, Principal principal ) {
		
		
		return "client_smstoparent";
	}
	

	@RequestMapping(value="/trip_ajax",method=RequestMethod.POST)
	public @ResponseBody String trip(@RequestParam("trip") String trip,ModelMap model, Principal principal) {
		String returnText="";
		List <String> route=new ArrayList<String>();
		route=mainDAO.get_route(trip,mainDAO.getOrg_id(principal.getName()));
		String a=mainDAO.getOrg_id(principal.getName());
		System.out.println("orgid"+a);
		returnText=returnText+"<script id='script_bid'> $(document).ready(function() {$('#route').select2(); });</script><select style='width:220px;' name='route_no' id='route' >";
		returnText+="<option value='none' selected>--Select Route--</option>";
		for(String bname:route)
		{
			 
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
		}			
		
		
		return returnText;
		
	
	}
	
	@RequestMapping(value="/smsparent", method = RequestMethod.POST)
	public String sms_route(HttpServletRequest req,HttpServletResponse response,HttpSession session,@ModelAttribute("Smsparent") @Valid Smsparent parent, String org_id, BindingResult result,ModelMap model, Principal principal ) {
	 
		
		
		
		
	   mainDAO.sms_parent(parent);
	  /* 	*/
		
		return "client_smstoparent";
	}

	


	@RequestMapping(value="/clientbusinessrules", method = RequestMethod.GET)
	public String clientbusinessrules(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_business_rules";
	}
	
/*################################################Holiday###############################################################*/


	@RequestMapping(value="/clientholiday", method = RequestMethod.GET)
	public String clientholiday(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
	
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		
		
		return "client_holiday";
	}
	

	@RequestMapping(value="/clientdeviceview", method = RequestMethod.GET)
	public String clientdeviceview(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "client_device_view";
	}
	@RequestMapping(value="/autocompleteSearch_org", method = RequestMethod.GET)
	public String autocompleteSearch(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		return "autocomplete_Search_org";
	}
		
//admin home search 06/05/2014
	
	@RequestMapping(value="/findsuperadminhome", method = RequestMethod.GET)
	public String findadminhome(HttpSession session,HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model, Principal principal ) {
		
		session.setAttribute("org_name", org_name);
		session.setAttribute("branch", branch);
		
		if(org_name=="" && branch==""){
			
			SuperAdminHomeForm superAdminHomeForm1 = new SuperAdminHomeForm();
			superAdminHomeForm1.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm1",superAdminHomeForm1);
		
			SuperAdminHomeForm superAdminHomeForm = new SuperAdminHomeForm();
			superAdminHomeForm.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm",superAdminHomeForm);
			
			return "superadmin_homepage";
		}
		else{
			
			SuperAdminHomeForm superAdminHomeForm1 = new SuperAdminHomeForm();
			superAdminHomeForm1.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm1",superAdminHomeForm1);
			
			SuperAdminHomeForm superAdminHomeForm = new SuperAdminHomeForm();
			superAdminHomeForm.setSuperAdminHome(mainDAO.findadminhome(org_name ,branch));
			model.addAttribute("superAdminHomeForm",superAdminHomeForm);
			
			return "superadmin_homepage";
		}
		
		
	}
	
	
	@RequestMapping(value="/findsuperadminSr", method = RequestMethod.GET)
	public String findsuperadminSr(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model, Principal principal ) {
		if(org_name=="" && branch==""){
			SuperAdminHomeForm superAdminHomeForm = new SuperAdminHomeForm();
			superAdminHomeForm.setSuperAdminHome(mainDAO.getAdminHomes());
			model.addAttribute("superAdminHomeForm",superAdminHomeForm);
			return "superadmin_homepage";
		}
		else{
			SuperAdminHomeForm superAdminHomeForm = new SuperAdminHomeForm();
			superAdminHomeForm.setSuperAdminHome(mainDAO.findadminhome(org_name ,branch));
			model.addAttribute("superAdminHomeForm",superAdminHomeForm);
			return "search_Sadminhome";
		}
		
		
	}
	
	
	@RequestMapping(value="/calculate", method = RequestMethod.POST)
	public String calculate(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		System.out.println("calculate came!!!");
		
		
		Double doub=new Double("99999.0");
		@SuppressWarnings("static-access")
		double lat1=doub.parseDouble(request.getParameter("lat1"));
		@SuppressWarnings("static-access")
		double long1=doub.parseDouble(request.getParameter("long1"));
		@SuppressWarnings("static-access")
		double lat2=doub.parseDouble(request.getParameter("lat2"));
		@SuppressWarnings("static-access")
		double long2=doub.parseDouble(request.getParameter("long2"));
		@SuppressWarnings("static-access")
		double speed=doub.parseDouble(request.getParameter("speed"));
		
		
		
		//distance(lat1, lat2, long1, long2,speed);
		
		
		
		return "demo";
	}
	
	@RequestMapping(value="/getlocationdevice", method = RequestMethod.POST)
	public String getlocation_device(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		System.out.println(request.getParameter("device_id"));
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
	
		
		
		
		
		
		return "view_map";
		
		
		//return "view_map";
	}
	
	
	
	
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
 
	}
	/*@RequestMapping(value="/insert_organisation", method = RequestMethod.GET)
	public String insert_org(ModelMap model) {
		return "insert_organisation";
 
	}*/
	@RequestMapping(value="/add_adminuser", method = RequestMethod.GET)
	public String add_adminuser(ModelMap model) {
		return "add_adminuser";
 
	}
	
	@RequestMapping(value="/admin_viewmap", method = RequestMethod.GET)
	public String view_map(HttpSession session,ModelMap model) {
		
	
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("vec_imei");
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);			
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		
		LatLongForm latLongForm=new LatLongForm();
		//latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo("359710042476300"),'');		
		model.addAttribute("latLongForm",latLongForm);	
		model.addAttribute("device_id","");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		
	    return "adminTrack";
 
	}
	

	// Vechicle reg no for Live Tracking Map Ajax // AAJJAAXX
	
	@RequestMapping(value="/vechicle_reg_no",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model ) {
	
		String returnText="";
			List <BusDeviceRegistration> vechicle_reg_no=new ArrayList<BusDeviceRegistration>();
		vechicle_reg_no=mainDAO.get_vechicle_no(org_name, branch);
		
		returnText=returnText+"<select id='device' class='input_cmbbx' name='device_id' onchange='doAction(this.value);' style='width:220px;'>";
		returnText+="<option value='' selected>--Select vechicle--</option>";
		for(BusDeviceRegistration vechicle_no:vechicle_reg_no)
		{
			returnText+="<option value='"+vechicle_no.getDevice_imei_number()+"'>"+vechicle_no.getBus_reg_id()+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
	
	
	@RequestMapping(value="/live_track", method = RequestMethod.GET)
	public String Live_track(@RequestParam("id") String device_id,HttpSession session,ModelMap model) {
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		model.addAttribute("device_id",device_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		return "view_map";
 
	}
	
	// Client live Track
	
	@RequestMapping(value="/client_live_track", method = RequestMethod.GET)
	public String client_Live_track(@RequestParam("id") String device_id,HttpSession session,ModelMap model) {
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		model.addAttribute("device_id",device_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
	    
		return "client_live_track";
 
	}
	
	// Client Tacking Map History
	
	@RequestMapping(value="/client_view_map_history", method = RequestMethod.GET)
	public String client_view_map_history(HttpSession session,ModelMap model,Principal principal) {
		
	
		
		session.removeAttribute("device_id");
		
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no_for_client(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busDeviceRegistrationForm1",busDeviceRegistrationForm1);
		
		LatLongForm latLongForm=new LatLongForm();
		//latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo("359710042476300"),'');
		
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("first",1);
		
		return "client_view_map_history";
 
	}
	
	// Client Tracking history after selecting vechicle no
	
		@RequestMapping(value="/clientviewmaphistory", method = RequestMethod.POST)
		public String client_view_particular_device(HttpServletRequest request,HttpSession session,@RequestParam("device_id") String vechicle_reg_no,ModelMap model,Principal principal) {
			
		
		    session.setAttribute("device_id",vechicle_reg_no);
		    
			
			BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
			busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
			model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
			
			BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
			busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no_for_client(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("busDeviceRegistrationForm1",busDeviceRegistrationForm1);
			
			
			LatLongForm latLongForm=new LatLongForm();
			System.out.println("Selected Date:"+request.getParameter("date").toString());
			latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo(request.getParameter("device_id"),request.getParameter("date")));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
		    Date date=new Date();
		    
		    model.addAttribute("click_time",sdf.format(date));
			model.addAttribute("latLongForm",latLongForm);
			model.addAttribute("first",2);
			model.addAttribute("device",request.getParameter("device_id"));
			model.addAttribute("date",request.getParameter("date"));
			
			return "client_view_map_history";
	 
		}
		
	
	
	@RequestMapping(value="/view_map_history", method = RequestMethod.GET)
	public String view_map_history(HttpSession session,ModelMap model,Principal principal) {
		
	
	
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		
		BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no_for_client(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busDeviceRegistrationForm1",busDeviceRegistrationForm1);
		
		LatLongForm latLongForm=new LatLongForm();
		//latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo("359710042476300"),'');
		
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("first",1);
		
		return "view_map_history";
 
	}
	
	// Admin Tracking History
	
	@RequestMapping(value="/admin_view_map_history", method = RequestMethod.GET)
	public String admin_view_map_history(HttpSession session,ModelMap model) {
		
	
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("device_id");
	
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		
		LatLongForm latLongForm=new LatLongForm();
		//latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo("359710042476300"),'');
		
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("first",1);
		
		return "admin_view_map_history";
 
	}
	
	
	// Admin Tracking history after selecting vechicle no
	
	@RequestMapping(value="/adminviewmaphistory", method = RequestMethod.POST)
	public String admin_view_particular_device(HttpServletRequest request,HttpSession session,@RequestParam("org_name") String org_name,@RequestParam("branch") String bid,@RequestParam("device_id") String device_id,ModelMap model) {
		
		session.setAttribute("org_name", org_name);
		session.setAttribute("branch", bid);
		session.setAttribute("device_id", device_id);
	
	
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		model.addAttribute("branch_array",busDAO.getBus_id(org_name));
		
		BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no(org_name, bid));
		
		model.addAttribute("vehicle_array",busDeviceRegistrationForm1);
		
		LatLongForm latLongForm=new LatLongForm();
		System.out.println("Selected Date:"+request.getParameter("date").toString());
		latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo(request.getParameter("device_id"),request.getParameter("date")));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("first",2);
		model.addAttribute("device",request.getParameter("device_id"));
		model.addAttribute("date",request.getParameter("date"));
		
		return "admin_view_map_history";
 
	}
	
	@RequestMapping(value="/viewmap_with_id", method = RequestMethod.GET)
	public String view_map_reload(@RequestParam("id") String device,HttpSession session,ModelMap model) {
		
	
		System.out.println("came");
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		
		LatLongForm latLongForm=new LatLongForm();
		//latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo("359710042476300"),'');
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("device_id","");
		model.addAttribute("id",device);
		
		return "view_map";
 
	}
	
	@RequestMapping(value="/adminviewmap_with_id", method = RequestMethod.GET)
	public String adminview_map_reload(@RequestParam("org_name") String org_name,@RequestParam("branch") String bid,@RequestParam("id") String device,HttpSession session,ModelMap model) {
		
	
		System.out.println("came");
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		
		session.setAttribute("org_name",org_name);
		session.setAttribute("branch",bid);
		session.setAttribute("vec_imei",device);
		
		model.addAttribute("orgname",orgname);
		model.addAttribute("branch_array",busDAO.getBus_id(org_name));
		
		BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no(org_name, bid));
		
		model.addAttribute("vehicle_array",busDeviceRegistrationForm1);
		
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		model.addAttribute("device_id",device);
		return "adminTrack";
 
	}
	
	
	
	
	@RequestMapping(value="/viewmap", method = RequestMethod.POST)
	public String view_particular_device(HttpServletRequest request,HttpSession session,ModelMap model,Principal principal) {
		
	
	
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);		
		
		BusDeviceRegistrationForm busDeviceRegistrationForm1=new BusDeviceRegistrationForm();
		busDeviceRegistrationForm1.setBusDeviceRegistrations(mainDAO.get_vechicle_no_for_client(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("busDeviceRegistrationForm1",busDeviceRegistrationForm1);
		
		
		
		LatLongForm latLongForm=new LatLongForm();
		System.out.println("Selected Date:"+request.getParameter("date").toString());
		latLongForm.setLatLongs(trackingInfoDAO.getTrackingInfo(request.getParameter("device_id"),request.getParameter("date")));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone.setDefault(TimeZone.getTimeZone("IST"));
	    Date date=new Date();
	    
	    model.addAttribute("click_time",sdf.format(date));
		model.addAttribute("latLongForm",latLongForm);
		model.addAttribute("first",2);
		model.addAttribute("device",request.getParameter("device_id"));
		model.addAttribute("date",request.getParameter("date"));
		
		return "view_map_history";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/json", method = RequestMethod.POST)
	public @ResponseBody LatLongForm json(@RequestParam("device_id") String device,@RequestParam("click_time") String click_time,ModelMap model) {
		
		System.out.println(device);
		
		LatLongForm latLongForm=new LatLongForm();
		
		
		latLongForm.setLatLongs(trackingInfoDAO.getLiveTrackingInfo(device,click_time));
		
		return latLongForm;
	
 
	}
	/*@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(Model model) {
		model.addAttribute(new UserProfile());
	return "edit";
	}
	
	@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(UserProfile userProfile) {
		
		System.out.println("Save User" + userProfile.getFullName());
		return "/welcome";
	}
	*/
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(ModelMap model) {
		//model.addAttribute(new UserProfile());
		return "addparticipants";
	}
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(ModelMap model) {
		
		return "viewparticipants";
	}
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(ModelMap model) {
		
		return "addparticipantgroups";
	}
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(ModelMap model) {
		
		return "viewparticipantgroups";
	}
	
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(ModelMap model) {
		
		return "addadminuser";
	}
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(ModelMap model) {
		
		return "activityofadmin";
	}
	
	/*@RequestMapping(value="/devicefail", method=RequestMethod.GET)
	public String fail_note(DeviceFail deviceFail,ModelMap model) {
		
		DeviceFailForm deviceFailForm=new DeviceFailForm();
		deviceFailForm.setDeviceFails(mainDAO.getdevicefails());
		model.addAttribute("deviceFailForm",deviceFailForm);
		return "device_fail_status";
	}*/
	
	
	@RequestMapping(value="/textmsgsettings", method=RequestMethod.GET)
	public String textMsgSettings(ModelMap model) {
		
		return "textmsg";
	}
	
	@RequestMapping(value="/route_stop", method=RequestMethod.GET)
	public String stop_route(ModelMap model) {
		
		return "Route_stop";
	}
	/*
	@RequestMapping(value="/insert_route", method=RequestMethod.GET)
	public String insert_route(ModelMap model) {
		
		return "add_route";
	}*/
	@RequestMapping(value="/admin_settings", method=RequestMethod.GET)
	public String admin_settings(ModelMap model) {
		
		return "admin_settings";
	}
	
	
	@RequestMapping(value="/sendMessage",method=RequestMethod.GET)
	public void send_message()
	{
		System.out.println("Request Get going to send sms!!!!");
		 String requestUrl1="http://203.212.70.200/smpp/sendsms?username=apitbpdemo&password=del12345@12&to=9659885881&from=track&text=Testing&udh=&dlr-mask=19&dlr-url=http://118.95.103.206:8080/BusTrackingApp/deviceregistration?myid=44&status=%25d&updated_on=%25t&res=%252";
		 
		 System.out.println("Open Connection");

	}
	
	/*
	 * SMS To Parent In client Side
	 * 
	 */
	
	@RequestMapping(value="/sms_to_parent", method=RequestMethod.POST)
	public String sms_to_parent(@RequestParam("route_no") String route_no,@RequestParam("message") String Message,@ModelAttribute("smsparent") @Valid Smsparent smsparent,BindingResult result,ModelMap model,Principal principal)
	{
		if(result.hasErrors())
		{
			
			return "client_smstoparent";
		}
		else{
			messageSending.SMS_to_parent(route_no, Message);
			model.addAttribute("suceess","true");
			
		}
		
		return "tracksms";
	}
	
	//Search Operation in Client Home
	
	@RequestMapping(value="/findclienthome", method = RequestMethod.GET)
	public String findclienthome(HttpSession session,HttpServletRequest request,@RequestParam("vechicle_reg_no") String vechicle_reg_no,ModelMap model, Principal principal ) {
	
	session.setAttribute("vechicle_reg_no",vechicle_reg_no);	
		
	ClientHomeForm clientHomeForm= new ClientHomeForm();
	clientHomeForm.setClienthome(clientHomeDAO.findclienthome(mainDAO.getOrg_id(principal.getName()), vechicle_reg_no));
	model.addAttribute("clientHomeForm",clientHomeForm);
	
	ClientHomeForm clientHomeForm1= new ClientHomeForm();
	clientHomeForm1.setClienthome(clientHomeDAO.getClienthome(mainDAO.getOrg_id(principal.getName())));
	model.addAttribute("clientHomeForm1",clientHomeForm1);
	
	return "client_home";
	}
	
	
	
  }