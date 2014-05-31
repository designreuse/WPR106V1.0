package bustracking.controllers;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String getroute(ModelMap model,Route route, Principal principal){
		
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
	public String viewroute(HttpServletRequest request,ModelMap model, Principal principal){
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm1",routeViewForm1);
		
		RouteViewForm routeViewForm2=new RouteViewForm();
		routeViewForm2.setRoute_views(routeDAO.getRoutes_for_detail_view());
		model.addAttribute("routeViewForm2",routeViewForm2);
		
		
		return "view_route";
	}

	//Client Side View
	
	@RequestMapping(value="/clientviewroutedetails", method = RequestMethod.GET)
	public String driverlist(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("routeViewForm",routeViewForm);
		
		RouteViewForm routeViewForm1=new RouteViewForm();
		routeViewForm1.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("routeViewForm1",routeViewForm1);
		
		return "client_view_route_details";
	}
	
	//*******************************************************************************************************************
		//find route client side
		//*******************************************************************************************************************
		@RequestMapping(value="/clientfindroutedetails", method = RequestMethod.GET)
		public String clientfindroutedetails(HttpServletRequest request,@RequestParam("route_no") String route_no,@RequestParam("trip") String trip,ModelMap model, Principal principal ) {
			if(route_no=="" && trip==""){
				RouteViewForm routeViewForm=new RouteViewForm();
				routeViewForm.setRoute_views(routeDAO.getRoute_by_org_id(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("routeViewForm",routeViewForm);
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
	
@RequestMapping(value="/insert_route_stop", method = RequestMethod.POST)

	public String inserting_route(HttpServletRequest request,ModelMap model,Route route, Principal principal ) {
		
	
	   route.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		
		//this.setInfo(route, route.getRoute_from(),"both",request.getParameter("route_pick_time"),request.getParameter("route_drop_time"));
		System.out.println(request.getParameter("org_name"));
		System.out.println(request.getParameter("branch"));
		System.out.println(request.getParameter("stop[]"));
		String[] stop_locations=new String[100];
		String[] stop_pick_drop=new String[100];
		String[] stop_timings=new String[100];
		int stop_count=Integer.parseInt(request.getParameter("number_of_stops"));
		System.out.println(stop_count);
		stop_locations=request.getParameterValues("stop[0]");
		stop_pick_drop=request.getParameterValues("stop_pick[0]");
		stop_timings=request.getParameterValues("particular_stop_pickup_time[0]");
	
		//setting the route values
		  route.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		  
		String stop_location;
		for (int i=0;i<=stop_count;i++)
		{
			System.out.println("request.getParameter(stop["+i+"])");
			if(!request.getParameter("stop["+i+"]").equals(""))
			{
				stop_location=request.getParameter("stop["+i+"]");
				route.setStop_id("S"+i);
				route.setAddress(stop_location);
				route.setLatitude(getLat(stop_location));
				route.setLongitude(getLong(stop_location));
				route.setTrip(request.getParameter("stop_pick["+i+"]"));
				route.setBus_arrival_time(request.getParameter("particular_stop_pickup_time["+i+"]"));
				routeDAO.insert_route(route);
				
			}
			
			System.out.println(route);
			 
				
		}
		
		/*
			if(request.getParameter("stop_pick["+k+"]").equals("0"))
				System.out.println(request.getParameter("stop_pick["+k+"]"));
			this.setInfo(route, stop_location);
		if(request.getParameter("stop_pick["+k+"]").equals("1"))
			this.setInfo(route, stop_location);
		if(request.getParameter("stop_pick["+k+"]").equals("2"))
			this.setInfo(route, stop_location);
		k++;
		*/
	
		//System.out.println(request.getParameter("stop_pick["+k+"]"));
		//route.setStop_id("S"+(k+1));
		//this.setInfo(route, route.getRoute_to());
		
		//model.addAttribute("org_id",orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		
		routeDAO.insert_message_log(request.getParameter("route_no"));
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		
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
	
	@RequestMapping(value="/update_route_stop", method = RequestMethod.POST)

	public String update_route(HttpServletRequest request,ModelMap model,Route_view route,Route updateroute, Principal principal ) {
		
	 
route.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		
		//this.setInfo(route, route.getRoute_from(),"both",request.getParameter("route_pick_time"),request.getParameter("route_drop_time"));
		System.out.println(request.getParameter("org_name"));
		System.out.println(request.getParameter("branch"));
		System.out.println(request.getParameter("stop[]"));
		String[] stop_locations=new String[100];
		String[] stop_pick_drop=new String[100];
		String[] stop_timings=new String[100];
		int stop_count=Integer.parseInt(request.getParameter("number_of_stops"));
		System.out.println(stop_count);
		stop_locations=request.getParameterValues("stop[0]");
		stop_pick_drop=request.getParameterValues("stop_pick[0]");
		stop_timings=request.getParameterValues("particular_stop_pickup_time[0]");
	
		// Delete Route Information While updating route
		
		routeDAO.deleteRoute_while_update(route);
		
		
		//setting the route values
		  route.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		  
		String stop_location;
		for (int i=0;i<=stop_count;i++)
		{
			System.out.println("request.getParameter(stop["+i+"])");
			if(!request.getParameter("stop["+i+"]").equals(""))
			{
				stop_location=request.getParameter("stop["+i+"]");
				route.setStop_id("S"+i);
				updateroute.setAddress(stop_location);
				updateroute.setLatitude(getLat(stop_location));
				updateroute.setLongitude(getLong(stop_location));
				updateroute.setTrip(request.getParameter("stop_pick["+i+"]"));
				updateroute.setBus_arrival_time(request.getParameter("particular_stop_pickup_time["+i+"]"));
				routeDAO.updateRoute(updateroute);
				
			}
			
			System.out.println(route);
			routeDAO.insert_message_log(request.getParameter("route_no"));
				
		}
		
		RouteViewForm routeViewForm=new RouteViewForm();
		routeViewForm.setRoute_views(routeDAO.getRoutes());
		model.addAttribute("routeViewForm",routeViewForm);
		
		
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
public String findroute(HttpServletRequest request,
		@RequestParam("org_name") String org_name,
		@RequestParam("branch")String branch,
		@RequestParam("vechicle_reg_no") String vechicle_reg_no,
		@RequestParam("route_no") String route_no,
		@RequestParam("trip") String trip,ModelMap model)
{
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
public String edituser(HttpServletRequest request,@RequestParam("route_no")String route_no,ModelMap model,OrgRegistration orgregistration)
{
	
	RouteViewForm routeForm= new RouteViewForm();
	routeForm.setRoute_views(routeDAO.getRoutesView(route_no));
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

}

