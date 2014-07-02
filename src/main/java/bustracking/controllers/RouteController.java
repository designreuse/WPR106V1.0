package bustracking.controllers;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import bustracking.dao.MainDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.dao.RouteDAO;
import bustracking.dao.StudentRegistrationDAO;
import bustracking.forms.AddUserForm;
import bustracking.forms.BusDeviceRegistrationForm;
import bustracking.forms.BusRegistrationForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.RouteForm;
import bustracking.forms.RouteViewForm;
import bustracking.forms.StudentRegistrationForm;
import bustracking.model.AddUser;
import bustracking.model.OrgRegistration;
import bustracking.model.Route;
import bustracking.model.Route_view;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;

import bustracking.model.OrgRegistration;
import bustracking.forms.OrgRegistrationForm;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.dao.BusRegistrationDAO;
import bustracking.forms.BusRegistrationForm;



@Controller
@SessionAttributes({"routes","org_name","branch","vechicle_reg_no","trip","route_no","session_route"})
public class RouteController
{
	@Autowired
	RouteDAO routeDAO;
	
	@Autowired  
	MainDAO mainDAO; 
		
	@Autowired
	
	BusRegistrationDAO busDAO;

	@Autowired  
	StudentRegistrationDAO studentDAO;
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	

	static int stop_id=10001;
	

	@RequestMapping(value="/insert_route",method=RequestMethod.GET)
	public String getroute(HttpSession session,ModelMap model,Route route, Principal principal){
		
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("route_no");
		
		List<Route> routes=new ArrayList<Route>();
		session.setAttribute("session_route", routes);
		
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		
		return "add_route";
	}
	
	@RequestMapping(value="/route_ajax",method=RequestMethod.POST)
	public @ResponseBody String sr_reg(@RequestParam("org_name") String org_name, @RequestParam("branch") String branch ,ModelMap model) {
		
		String returnText="";
		List <String> studroute=new ArrayList<String>();
		studroute=studentDAO.getStud_route(org_name,branch);
		
		returnText=returnText+"<script id='script_route_id'>$(document).ready(function() { $('#route_id').select2(); });</script><select name='route_no' id='route_id' style='width:220px'>";
		returnText+="<option value='' selected>--Select Route No--</option>";
		for(String sr:studroute)
		{
			returnText+="<option value='"+sr+"'>"+sr+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
		
		return returnText;
	
	}
	
	// View Route Information In Admin Side
	
	@RequestMapping(value="/viewroute", method=RequestMethod.GET)
	public String viewroute(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal){
		
		
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("vechicle_reg_no");
		session.removeAttribute("route_no");
		session.removeAttribute("trip");
		session.removeAttribute("routes");
		
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm1",routeViewForm1);
		
		RouteViewForm routeViewForm2=new RouteViewForm();
		routeViewForm2.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm2",routeViewForm2);
		
		return "view_route";
	}

	// Show Full Information For particular route admin side
	
	@RequestMapping(value="/showfulldetails",method=RequestMethod.GET)
	public String showfulldetailsforroute(@RequestParam("route_no") String route_no,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model,Principal principal){
		
	RouteViewForm routeViewForm=new RouteViewForm();
	routeViewForm.setRoute_views(routeDAO.getRoutes_for_detail_view(route_no,org_name,branch));
	model.addAttribute("routeViewForm",routeViewForm);
	
	return "show_route_full_details";
	}
	
	
	
	//Client Side View
	
	@RequestMapping(value="/clientviewroutedetails", method = RequestMethod.GET)
	public String driverlist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		session.removeAttribute("route_no");
		session.removeAttribute("routes");
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("routeViewForm1",routeViewForm1);
		
		
		
		return "client_view_route_details";
	}
	
	// Show Full Information For particular route client side
	
	@RequestMapping(value="/showfulldetailsclient",method=RequestMethod.GET)
	public String showfulldetailsroute(@RequestParam("route_no") String route_no,ModelMap model,Principal principal){
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes_for_detail_view_client(route_no));
		model.addAttribute("routeViewForm",routeViewForm);
	
	return "client_show_full_route_details";
	}
	
	
	//*******************************************************************************************************************
		//find route client side
		//*******************************************************************************************************************
		@RequestMapping(value="/clientfindroutedetails", method = RequestMethod.GET)
		public String clientfindroutedetails(HttpSession session,HttpServletRequest request,@RequestParam("route_no") String route_no,@RequestParam("trip") String trip,@ModelAttribute("route") @Valid Route route,ModelMap model, Principal principal ) {
			
			session.setAttribute("route_no", route_no);
			session.setAttribute("routes",route);
			
			
			if(route_no=="" && trip==""){
				
				RouteViewForm routeViewForm1=new RouteViewForm();
				routeViewForm1.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("routeViewForm1",routeViewForm1);
				
				return "client_view_route_details";
			}
			else{
				RouteViewForm routeViewForm=new RouteViewForm();
				routeViewForm.setRoute_views(mainDAO.searchRouteclient(mainDAO.getOrg_id(principal.getName()),route_no,trip));
				model.addAttribute("routeViewForm",routeViewForm);
				
				RouteViewForm routeViewForm1=new RouteViewForm();
				routeViewForm1.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("routeViewForm1",routeViewForm1);
				
				return "client_view_route_details";
			}
		}
	
@SuppressWarnings("unchecked")
@RequestMapping(value="/insert_route_stop", method = RequestMethod.POST)

	public String inserting_route(HttpSession session,HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("route_no") String route_no,@ModelAttribute("route") @Valid Route route,BindingResult result,ModelMap model, Principal principal ) {
		
	if(result.hasErrors())
	{
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		model.addAttribute("orgname",orgname);
		
		return "add_route";
	}
		String[] stop_info=new String[100];
		String[] trip_info=new String[100];
		String[] stop_time=new String[100];
		
	   List<Route> ses_route=new ArrayList<Route>();
	   
	   ses_route=(List<Route>) session.getAttribute("session_route");
		
	   int index=0;
	   for (Route route2 : ses_route) {
		stop_info[index]=route2.getAddress();
		stop_time[index]=route2.getBus_arrival_time();
		trip_info[index]=route2.getTrip();
		index++;
	}
		
		int no_of_pick=0,no_of_drop=0,k=0;
				
		for (k=0;k<index;k++) {
			
			switch (Integer.parseInt(trip_info[k])) {
			case 0:no_of_pick++;			
				break;
			case 1:no_of_drop++;
				break;
			case 2:no_of_pick++;no_of_drop++;
			    break;
			default://nothing to do
				break;
			}			
			
		}
		
		int pick_count=0;
		int drop_count=no_of_drop-1;

		//setting the route values
		  route.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		//insert route
		for (int i=0;i<index;i++)
		{
			
			switch (Integer.parseInt(trip_info[i])) {
			case 0:	route.setStop_id("S"+pick_count);
					route.setAddress(stop_info[i]);
					route.setLatitude(getLat(stop_info[i]));
					route.setLongitude(getLong(stop_info[i]));
					route.setTrip(trip_info[i]);
					route.setBus_arrival_time(stop_time[i]);
					routeDAO.insert_route(route);	
					pick_count++;
					break;
			case 1:
				route.setStop_id("S"+drop_count);
				route.setAddress(stop_info[i]);
				route.setLatitude(getLat(stop_info[i]));
				route.setLongitude(getLong(stop_info[i]));
				route.setTrip(trip_info[i]);
				route.setBus_arrival_time(stop_time[i]);
				routeDAO.insert_route(route);	
				drop_count--;
				break;
			case 2:	
				route.setStop_id("S"+pick_count);
				route.setAddress(stop_info[i]);
				route.setLatitude(getLat(stop_info[i]));
				route.setLongitude(getLong(stop_info[i]));
				route.setTrip("0");
				route.setBus_arrival_time(stop_time[i]);
				routeDAO.insert_route(route);	
				pick_count++;
				route.setStop_id("S"+drop_count);
				route.setAddress(stop_info[i]);
				route.setLatitude(getLat(stop_info[i]));
				route.setLongitude(getLong(stop_info[i]));
				route.setTrip("1");
				route.setBus_arrival_time(stop_time[i]);
				routeDAO.insert_route(route);
				drop_count--;
				break;
			default:
				break;
			}
			
			
		}
		routeDAO.insert_message_log(request.getParameter("route_no"));
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm1",routeViewForm1);
		
		return "view_route";
	
}
	
	
	
	public String getLat(String Stoplocation)
	{
		final Geocoder geocoder = new Geocoder();		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(Stoplocation).setLanguage("en").getGeocoderRequest();
		GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
	
		return geocoderResponse.getResults().get(0).getGeometry().getLocation().getLat().toString();
	}
	public String getLong(String Stoplocation)
	{
		final Geocoder geocoder = new Geocoder();		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(Stoplocation).setLanguage("en").getGeocoderRequest();
		GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
	
		return geocoderResponse.getResults().get(0).getGeometry().getLocation().getLng().toString();
	}
	
	public void setInfo(Route route,String Stoplocation)
	{
	
		
		route.setAddress(Stoplocation);	
		route.setBus_arrival_time("2038-01-19 03:14:07");
		route.setLatitude(this.getLat(Stoplocation));
		
		
		route.setLongitude(this.getLong(Stoplocation));
		//route.setStop_drop_time("2038-01-19 03:14:07");
		
		System.out.println(Stoplocation);
		System.out.println(this.getLat(Stoplocation));
		//System.out.println(this.getLong(Stoplocation));
		stop_id=stop_id+3;
		
		
	}
	
	// Update Route Information
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/update_route_stop", method = RequestMethod.POST)

	public String update_route(HttpSession session,HttpServletRequest request,ModelMap model,Route_view route,Route updateroute, Principal principal ) {
		
	 
          updateroute.setOrg_id(orgRegistrationDAO.getOrg_id(route.getOrg_name(),route.getBranch()));
		
		//this.setInfo(route, route.getRoute_from(),"both",request.getParameter("route_pick_time"),request.getParameter("route_drop_time"));
		
		String[] stop_locations=new String[100];
		String[] stop_pick_drop=new String[100];
		String[] stop_timings=new String[100];
		/*int stop_count=Integer.parseInt(request.getParameter("number_of_stops"));
		System.out.println(stop_count);
		*/
		List<Route_view> ses_route=new ArrayList<Route_view>();
		   
		   ses_route=(List<Route_view>) session.getAttribute("session_route");
			
		   int index=0;
		   for (Route_view route2 : ses_route) {
			stop_locations[index]=route2.getBus_stop_address();
			stop_timings[index]=route2.getBus_arrival_time();
			stop_pick_drop[index]=route2.getTrip();
			index++;
		}
		
		
	
		// Delete Route Information While updating route
		
		routeDAO.deleteRoute_while_update(route);
		
		
		//setting the route values
		  updateroute.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		  
		String stop_location;
		for (int i=0;i<index;i++)
		{
				stop_location=stop_locations[i];
				updateroute.setStop_id("S"+i);
				updateroute.setAddress(stop_location);
				updateroute.setLatitude(getLat(stop_location));
				updateroute.setLongitude(getLong(stop_location));
				updateroute.setTrip(stop_pick_drop[i]);
				updateroute.setBus_arrival_time(stop_timings[i]);
				routeDAO.updateRoute(updateroute);
		
				
		}
		
		routeDAO.insert_message_log(request.getParameter("route_no"));
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm1",routeViewForm1);
		
	
		
		return "view_route";
	}
	
	// Delete Route Information 
	
	@RequestMapping(value="/deleteroute",method=RequestMethod.GET)
	public String deleteroute(@RequestParam("route_no") String route_no,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("vechicle_reg_no") String vechicle_reg_no,ModelMap model,Principal principal){
		
		int status=routeDAO.deleteRoute(route_no,org_name,branch,vechicle_reg_no);
		
		if(status==1)
		{
			
			RouteViewForm routeViewForm=new RouteViewForm();
			routeViewForm.setRoute_views(routeDAO.getRoutes());
			model.addAttribute("routeViewForm",routeViewForm);
		
			RouteViewForm routeViewForm1=new RouteViewForm();
			routeViewForm1.setRoute_views(routeDAO.getRoutes());
			model.addAttribute("routeViewForm1",routeViewForm1);
			
			
		}
		
		return "view_route";
	}
	
	
	//Ajax for org name and branch
	
	@RequestMapping(value="/route_reg_ajax",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@RequestParam("org_name") String org_name,ModelMap model) {
	
		String returnText="";
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(org_name);
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select name='branch' id='bid' onchange='doAjaxPost1()' style='width:220px'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
	return returnText;
	}
	
	//find route 06/05/2014 

@RequestMapping(value="/findroute",method=RequestMethod.GET)
public String findroute(HttpSession session,HttpServletRequest request,
		@RequestParam("org_name") String org_name,
		@RequestParam("branch")String branch,
		@RequestParam("vechicle_reg_no") String vechicle_reg_no,
		@RequestParam("route_no") String route_no,
		@RequestParam("trip") String trip,@ModelAttribute("route") Route route,ModelMap model)
{
	
	session.setAttribute("org_name",org_name );
	session.setAttribute("branch",branch );
	session.setAttribute("vechicle_reg_no",vechicle_reg_no );
	session.setAttribute("routes",route);
	session.setAttribute("route_no",route_no );
	
	
	if( org_name== " " && branch== " " && vechicle_reg_no==" " && route_no==" " && trip==" ")
	{
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		return "view_route";
	}
	else
	{
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.findroute(org_name,branch,vechicle_reg_no,route_no,trip));
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm1",routeViewForm1);
		
	 return "view_route";
	}
}

	
	/*
@RequestMapping(value="/viewroute", method=RequestMethod.GET)
public String viewuser(ModelMap model, Principal principal){
	
	System.out.println("view route!!!!");
	
	
	RouteForm routeForm=new RouteForm();
	routeForm.setRoutes(routeDAO.getRoutes());
	model.addAttribute("routeForm",routeForm);
	
	return "view_route";
}*/

// Admin Side Edit Route Information 


@RequestMapping(value="/editroute",method=RequestMethod.GET)
public String edituser(HttpServletRequest request,@RequestParam("route_no")String route_no,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model,OrgRegistration orgregistration)
{
	
	RouteViewForm routeForm= new RouteViewForm();
	routeForm.setRoute_views(routeDAO.getRoutesView(route_no,org_name,branch));
	model.addAttribute("routeForm",routeForm);
	
	return "edit_route";
	
}

/*
@RequestMapping(value="/updateroute",method=RequestMethod.POST)

public String updateuser(HttpServletRequest request,@ModelAttribute ("Route") Route route,ModelMap model)


{
		int status = routeDAO.updateRoute(route);
		System.out.println(status);
		if(status==1)
		{
			
			RouteForm routeForm=new RouteForm();
			routeForm.setRoutes(routeDAO.getRoutes());
			model.addAttribute("routeForm",routeForm);
		}
	
		return "view_route";
		
}




@RequestMapping(value="/routedetails", method=RequestMethod.GET)
	public String userdetails(HttpServletRequest request,@RequestParam("route_id") String route_id,ModelMap model,AddUser adduser)
	{
		
		
	RouteForm routeForm=new RouteForm();
	routeForm.setRoutes(routeDAO.getRoutesView(route_id));
	model.addAttribute("routeForm",routeForm);
		
		
		return "route_details";
	}
*/


@SuppressWarnings("unchecked")
@RequestMapping(value="/populate_stops",method=RequestMethod.POST)
public @ResponseBody String populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("stop_address_info")String stop_address_info,@RequestParam("stop_pick_info") String stop_pick_info,@RequestParam("stop_time_info") String stop_time_info,ModelMap model)
{
	List<Route> routes=new ArrayList<Route>();
	routes=(List<Route>) session.getAttribute("session_route");
	routes.add(new Route(stop_pick_info, stop_address_info,stop_time_info));
	String returnString="<div style='height:200px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route route : routes) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getAddress()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	i++;
	}
	returnString+="</div>";
	session.setAttribute("session_route", routes);
	return returnString;
	
}
@SuppressWarnings("unchecked")
@RequestMapping(value="/remove_populate_stops",method=RequestMethod.POST)
public @ResponseBody String remove_populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("id")String id,ModelMap model)
{
	List<Route> routes=new ArrayList<Route>();
	routes=(List<Route>) session.getAttribute("session_route");
	routes.remove(Integer.parseInt(id));
	String returnString="<div style='height:200px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route route : routes) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getAddress()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	i++;
	}
	returnString+="</div>";
	session.setAttribute("session_route", routes);
	return returnString;
	
}


/*@SuppressWarnings("unchecked")
@RequestMapping(value="/removeedit_populate_stops",method=RequestMethod.POST)
public @ResponseBody String removeedit_populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("id")String id,ModelMap model)
{
	List<Route_view> routes=new ArrayList<Route_view>();
	routes=(List<Route_view>) session.getAttribute("session_route");
	routes.remove(Integer.parseInt(id));
	String returnString="<div style='height:200px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route_view route : routes) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getBus_stop_address()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	i++;
	}
	returnString+="</div>";
	session.setAttribute("session_route", routes);
	return returnString;
	
}


*/


@SuppressWarnings("unchecked")
@RequestMapping(value="/edit_populate_stops",method=RequestMethod.POST)
public @ResponseBody String edit_populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch")String branch,@RequestParam("route_no") String route_no,ModelMap model)
{
	
	
	RouteViewForm routeForm= new RouteViewForm();
	routeForm.setRoute_views(routeDAO.getRoutesView(route_no,org_name,branch));
	model.addAttribute("routeForm",routeForm);
	
	List<Route_view> route_views=new ArrayList<Route_view>();	
	route_views=routeDAO.getRoutesView(route_no, org_name, branch);
	
	session.setAttribute("session_route",route_views);
		
	String returnString="<div style='height:120px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route_view route : route_views) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getBus_stop_address()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#' style='margin-right:10px;' onclick='doEditstop("+i+")'>Edit</a><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	    i++;
	}
	returnString+="</div>";
	
	return returnString;
	
}

@SuppressWarnings("unchecked")
@RequestMapping(value="/edit_remove_populate_stops",method=RequestMethod.POST)
public @ResponseBody String edit_remove_populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("id")String id,ModelMap model)
{
	List<Route_view> routes=new ArrayList<Route_view>();
	routes=(List<Route_view>) session.getAttribute("session_route");
	routes.remove(Integer.parseInt(id));
	String returnString="<div style='height:120px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route_view route : routes) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getBus_stop_address()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#' style='margin-right:10px;' onclick='doEditstop("+i+")'>Edit</a><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	i++;
	}
	returnString+="</div>";
	session.setAttribute("session_route", routes);
	return returnString;
	
}



@SuppressWarnings("unchecked")
@RequestMapping(value="/edit_change_populate_stops",method=RequestMethod.POST)
public @ResponseBody String edit_change_populate_stops(HttpSession session,HttpServletRequest request,@RequestParam("id")String id,ModelMap model)
{
	List<Route_view> routes=new ArrayList<Route_view>();
	routes=(List<Route_view>) session.getAttribute("session_route");
	
	int id1=Integer.parseInt(id);
	String pick_drop="";
	if(Integer.parseInt(routes.get(id1).getTrip())==0)
		pick_drop="<option value='0' selected>Pick</option><option value='1'>Drop</option><option value='2'>Both</option>";
	else if(Integer.parseInt(routes.get(id1).getTrip())==1)
		pick_drop="<option value='0' >Pick</option><option value='1' selected>Drop</option><option value='2'>Both</option>";
	else if(Integer.parseInt(routes.get(id1).getTrip())==2)
		pick_drop="<option value='0' >Pick</option><option value='1'>Drop</option><option value='2' selected>Both</option>";
	
		
	
	String returnString="<div style='padding:20px;width:700px;height:100px;background-color:#F4F4F8;border:solid 1px 	#C6C6CF;'>" +
	"<input type='hidden' id='editid' value='"+id1+"'/><input type='text'  size='500' class='input_txtbx_height' style='width:700px;' id='stop_address_info' name='stop_address' value='"+routes.get(id1).getBus_stop_address()+"' placeholder='Stop Location' /><br/>" +
	"<select name='stop_pick' id='stop_pick_info'>'"+pick_drop+"'</select>" +
	"<input type='text' id='timepicker' value='"+routes.get(id1).getBus_arrival_time()+"' onkeydown='onKeyDown(this);'/><br/>" +
	"<input type='button' value='Update Stop' style='padding:5px;' onclick='doUpdateStops();'/>" +
	"</div>";
	

	session.setAttribute("session_route", routes);
	return returnString;
	
}
@SuppressWarnings("unchecked")
@RequestMapping(value="/update_stop",method=RequestMethod.POST)
public @ResponseBody String update_populate_stop(HttpSession session,HttpServletRequest request,@RequestParam("stop_address_info")String stop_address_info,@RequestParam("stop_pick_info") String stop_pick_info,@RequestParam("stop_time_info") String stop_time_info,@RequestParam("id") String id,ModelMap model)
{
	List<Route_view> routes=new ArrayList<Route_view>();
	routes=(List<Route_view>) session.getAttribute("session_route");
	
	routes.get(Integer.parseInt(id)).setBus_stop_address(stop_address_info);
	routes.get(Integer.parseInt(id)).setTrip(stop_pick_info);
	routes.get(Integer.parseInt(id)).setBus_arrival_time(stop_time_info);
	
	String returnString="<div style='height:120px;overflow-y:scroll;'>";
	returnString+="<table style='border:solid 1px lightgrey;'><tr style='background-color:grey;font-weight:bold;'><td width='20px'>S.No</td><td width='400px' style='overflow:hidden;'>Stop Address</td><td width='100px'>Pick/Drop/Both</td><td width='100px'>Arrival Time</td><td width='100px'></td></tr></table>";
	int i=0;
	for (Route_view route : routes) {
		
		returnString+="<table style='border:solid 1px lightgrey'><tr><td width='20px'>"+(i+1)+"</td><td width='400px' style='overflow:hidden;'>"+route.getBus_stop_address()+"</td><td width='100px'>"+route.getTrip()+"</td><td width='100px'>"+route.getBus_arrival_time()+"</td><td width='100px'><a href='#' style='margin-right:10px;' onclick='doEditstop("+i+")'>Edit</a><a href='#'  onclick='doRemovestop("+i+")'>Remove</a></td></tr></table>";
	i++;
	}
	returnString+="</div>";
	session.setAttribute("session_route", routes);
	return returnString;
	
}
}

