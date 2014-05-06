
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
	public String printWelcome( ModelMap model, Principal principal) {
		
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
	public String addbus(HttpServletRequest request,@ModelAttribute("BusRegistration")  @Valid BusRegistration bus,BindingResult result,ModelMap model)
	{
		System.out.println(request.getParameter("org_name"));
		System.out.println(request.getParameter("branch"));
		bus.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		busDAO.setbusregistration(bus);
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
		returnText=returnText+"<select id='bid' name='branch' class='org_input_cmbbx'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
		
		
		
		
	return returnText;
	}
	
	@RequestMapping(value="/viewbus", method=RequestMethod.GET)
	public String viewbus(ModelMap model, Principal principal) {
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
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
	
	/*@RequestMapping(value="/edit_bus", method=RequestMethod.GET)
	public String editBus(HttpServletRequest request,@RequestParam("vechicle_reg_no") String bus_id,ModelMap model,BusRegistration busRegistration)
	{
		
		
		BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
        busRegistrationForm.setBusregistration(busDAO.getBus_id(bus_id));
		model.addAttribute("busRegistrationForm", busRegistrationForm);
		
		return "edit_bus";
	}
	@RequestMapping(value="/update_bus", method=RequestMethod.POST)
	public String updateBus(HttpServletRequest request,@ModelAttribute("busregistration") @Valid BusRegistration busregistration,
			BindingResult result,ModelMap model,Principal principal)
	{
		if (result.hasErrors())
		{
			
			BusRegistrationForm busRegistrationForm = new BusRegistrationForm();
	      //physicalexamForm.setPhysicalexam(physicalDAO.getPhysical(physicalexam.getPhysical_id()));
			
			String str =  busregistration.getVechicle_reg_no();
		
				busRegistrationForm.setBusregistration(busDAO.getBus_id(str));
	        model.addAttribute("busRegistrationForm", busRegistrationForm);
			    
		        return "edit_bus";
		}
		System.out.println("bus id"+busregistration.getVechicle_reg_no());
		int status = busDAO.updatebus(busregistration, busregistration.getVechicle_reg_no(),principal.getName());
		System.out.println(status);
		BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		return "view_bus_details";
		
	}*/
	
	/*@RequestMapping(value="/delete_bus", method=RequestMethod.GET)
	public String removeBus(@RequestParam("bus_id") String bus_id,ModelMap model, Principal principal) {
	
		int status=busDAO.deleteBus(bus_id);
		
		if(status==1)
		{
        

		
        BusRegistrationForm busregistrationform= new BusRegistrationForm();
		busregistrationform.setBusregistration(busDAO.getBusregistration());
		model.addAttribute("busregistrationform",busregistrationform);
		
		}
		
		return "view_bus_details";
	}*/
	

	@RequestMapping(value="/findbus",method=RequestMethod.GET)
	public String findBus1(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("vechicle_reg_no") String vechicle_reg_no,@RequestParam("device_imei_number") String device_imei_number,ModelMap model)
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
		return "search_bus";
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
        
        
		return "search_bus";
		}
		
	}
	
}