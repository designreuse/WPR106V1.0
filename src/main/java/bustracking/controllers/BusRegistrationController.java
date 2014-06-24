
package bustracking.controllers; 





import java.io.IOException;
import java.security.Principal;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.RouteDAO;
import bustracking.forms.BusRegistrationForm;
import bustracking.forms.RouteViewForm;

import bustracking.forms.OrgRegistrationForm;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.DeviceRegistrationForm;
import bustracking.dao.DeviceRegistrationDAO;
import bustracking.model.*;



@Controller

@SessionAttributes({"busreg","org_name","branch","device_imei_no","vechicle_reg_no"})

public class BusRegistrationController {
	
	@Autowired  
	BusRegistrationDAO busDAO;
	
	@Autowired
	RouteDAO routeDAO;
	
    
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired
	DeviceRegistrationDAO deviceRegistrationDAO;
 
	@RequestMapping(value="/busregistration", method = RequestMethod.GET)
	public String printWelcome(HttpSession session, ModelMap model, Principal principal) {
		
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("busreg");
		session.removeAttribute("device_imei_no");
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);

		model.addAttribute("orgname",orgname);
		

		System.out.println("Working fine");

	/*OrgRegistrationForm orgRegistrationForm1=new OrgRegistrationForm();
		orgRegistrationForm1.setOrgregistration(orgRegistrationDAO.getBranch(org_name));
		model.addAttribute("orgRegistrationForm1",orgRegistrationForm1);
		*/
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.getDevice_imei_no());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		
		
		
		return "add_bus_registration";
	}
	
	
	@RequestMapping(value="/busregistration", method=RequestMethod.POST)
	public String addbus(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("device_imei_number") String device_imei_number,HttpSession session,@ModelAttribute("busRegistration")  @Valid BusRegistration busRegistration,BindingResult result,ModelMap model)
	{
		System.out.println(request.getParameter("org_name"));
		System.out.println(request.getParameter("branch"));
		
		session.setAttribute("org_name",org_name);
		session.setAttribute("branch",branch);
		session.setAttribute("busreg",busRegistration);
		session.setAttribute("device_imei_no", device_imei_number);
		
		if(result.hasErrors())
		{
			List <String> orgname=new ArrayList<String>();
			orgname=busDAO.getorgname();
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);

			model.addAttribute("orgname",orgname);
			
			model.addAttribute("branch_array",busDAO.getBus_id(org_name));
			
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.getDevice_imei_no());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			
			return "add_bus_registration";
		}
		
		busRegistration.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		busDAO.setbusregistration(busRegistration);
		
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		return "view_bus_details";
	}
	

	@RequestMapping(value="/bus_reg_ajax",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@RequestParam("org_name") String org_name,ModelMap model ) {
	
		String returnText="";
		
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(org_name);
		System.out.println("org_name:"+org_name);
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select id='bid' name='branch' style='width:220px;>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
		
		
		
		
	return returnText;
	}
	
	@RequestMapping(value="/viewbus", method=RequestMethod.GET)
	public String viewbus(HttpSession session,ModelMap model, Principal principal) {
		
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("vechicle_reg_no");
		session.removeAttribute("device_imei_no");
		
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		BusRegistrationForm busregistrationform1= new BusRegistrationForm();
		busregistrationform1.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform1",busregistrationform1);
		
		return "view_bus_details";
	}
	
	/*@RequestMapping(value="/bus_details", method=RequestMethod.GET)
	public String busdetails(HttpServletRequest request,@RequestParam("bus_id") String bus_id,ModelMap model,BusRegistration busRegistration)
	{
		
		
        BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
	
		busRegistrationForm.setBusregistration(busDAO.getBus_id(bus_id));
		
		model.addAttribute("busRegistrationForm", busRegistrationForm);
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		
		return "bus_details";
	}*/
	
	@RequestMapping(value="/edit_bus", method=RequestMethod.GET)
	public String editBus(HttpServletRequest request,@RequestParam("vechicle_reg_no") String vechicle_reg_no,ModelMap model,BusRegistration busRegistration)
	{
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.getDevice_imei_no());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
        busRegistrationForm.setBusregistration(busDAO.getBusRegistrations_by_vechicle_reg(vechicle_reg_no));
		model.addAttribute("busRegistrationForm", busRegistrationForm);
		
		return "edit_bus";
	}
	
	
	// Update the Bus Information
	
	@RequestMapping(value="/update_bus", method=RequestMethod.POST)
	public String updateBus(HttpServletRequest request,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@ModelAttribute("busRegistration") @Valid BusRegistration busRegistration,
			BindingResult result,ModelMap model,Principal principal)
	{
		
		
		if(result.hasErrors())
		{
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.getDevice_imei_no());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			
			BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
	        busRegistrationForm.setBusregistration(busDAO.getBusRegistrations_by_vechicle_reg(vechicle_reg_no));
			model.addAttribute("busRegistrationForm", busRegistrationForm);
			
			return "edit_bus";
			
		}
		
		System.out.println("bus id"+busRegistration.getVechicle_reg_no());
		int status = busDAO.updatebus(busRegistration, busRegistration.getVechicle_reg_no(),principal.getName());
		System.out.println(status);
		
		if(status==1){
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		BusRegistrationForm busregistrationform1= new BusRegistrationForm();
		busregistrationform1.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform1",busregistrationform1);
		}
		
		return "view_bus_details";
		
	}
	
	// delete Vehicle Information
	
	@RequestMapping(value="/delete_bus", method=RequestMethod.GET)
	public String removeBus(@RequestParam("vechicle_reg_no") String vechicle_reg_no,ModelMap model, Principal principal) {
	
		int status=busDAO.deleteBus(vechicle_reg_no);
		
		if(status==1)
		{
        
        BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		BusRegistrationForm busregistrationform1= new BusRegistrationForm();
		busregistrationform1.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform1",busregistrationform1);
		}
		
		return "view_bus_details";
	}
	

	// Search Bus Information
	
	@RequestMapping(value="/findbus",method=RequestMethod.GET)
	public String findBus1(HttpSession session,HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@RequestParam("device_imei_number") String device_imei_number,ModelMap model)
	{
		
		
		session.setAttribute("org_name", org_name);
		session.setAttribute("branch",branch);
		session.setAttribute("vechicle_reg_no",vechicle_reg_no);
		session.setAttribute("device_imei_no", device_imei_number);
		
		if(org_name=="" && branch=="" && vechicle_reg_no=="" && device_imei_number=="")
		{
			BusRegistrationForm busregistrationform = new BusRegistrationForm();
	        busregistrationform.setBusregistration(busDAO.getBusregistration());
			model.addAttribute("busregistrationform", busregistrationform);
	       
			return "view_bus_details";
		}
		else
		{
			
		BusRegistrationForm busregistrationform = new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.findBus( org_name, branch, vechicle_reg_no, device_imei_number));
        model.addAttribute("busregistrationform", busregistrationform);        
        
        BusRegistrationForm busregistrationform1= new BusRegistrationForm();
		busregistrationform1.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform1",busregistrationform1);
        
		return "view_bus_details";
		}
		
	}
	@RequestMapping(value="/findbusInSearch",method=RequestMethod.GET)
	public String findbusInSearch(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@RequestParam("device_imei_number") String device_imei_number,ModelMap model)
	{
		if(org_name=="" && branch=="" && vechicle_reg_no=="" && device_imei_number=="")
		{
			BusRegistrationForm busregistrationform = new BusRegistrationForm();
	        busregistrationform.setBusregistration(busDAO.getBusregistration());
			model.addAttribute("busregistrationform", busregistrationform);
	       
			return "view_bus_details";
		}
		else
		{
			
		BusRegistrationForm busregistrationform = new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.findBus( org_name, branch, vechicle_reg_no, device_imei_number));
        model.addAttribute("busregistrationform", busregistrationform);
        
        BusRegistrationForm busregistrationform1= new BusRegistrationForm();
		busregistrationform1.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform1",busregistrationform1);
        
		return "view_bus_details";
		}
		
	}
	
	// Check vehicle_reg_no Exists

		@RequestMapping(value="/check_vehicle_reg_no", method=RequestMethod.POST)
		public @ResponseBody String vechicle_reg_no_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
			if(request.getParameter("vechicle_reg_no").equals(""))
				return "";
			
			if(busDAO.check_vechicle_reg_no(request.getParameter("vechicle_reg_no")))
				return "Vehicle Already Registered<br/>";
			else
				return "";
		}	
		
	
		// Check route_no Exists

				@RequestMapping(value="/check_route_no", method=RequestMethod.POST)
				public @ResponseBody String route_no_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
					if(request.getParameter("route_no").equals(""))
						return "";
					
					if(busDAO.check_route_no(request.getParameter("route_no")))
						
						return "Route Already Registered<br/>";
					else
						System.out.println("Outside If");
						return "";
				}	
					
		
		
}

