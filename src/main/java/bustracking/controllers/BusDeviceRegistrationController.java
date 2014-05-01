package bustracking.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import bustracking.dao.BusDeviceRegistrationDAO;
import bustracking.forms.AddUserForm;
import bustracking.forms.BusDeviceRegistrationForm;

import bustracking.forms.OrgRegistrationForm;
import bustracking.model.*;
import bustracking.controllers.*;
import bustracking.forms.*;
import bustracking.dao.*;

import bustracking.model.MessageSender;
@Controller

@SessionAttributes({"BusDevice"})
public class BusDeviceRegistrationController {

	
	@Autowired
	BusDeviceRegistrationDAO busDeviceRegistrationDAO;
	
	

	@RequestMapping(value="/gpsregistration", method = RequestMethod.GET)
	public String printWelcome(HttpSession session,ModelMap model, Principal principal)
	{
	    session.removeAttribute("BusDevice");
		
		
		
		
		return "add_gps_registration";
 
	}
	
	@RequestMapping(value="/view_device", method = RequestMethod.GET)
	public String view_buses_devices(@Valid BusDeviceRegistration busDeviceRegistration,BindingResult result, ModelMap model, Principal principal)
	{
		
		 BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
		  
		return "view_bus_device";
		
	}
	
	@RequestMapping(value="/insert_busdeviceregistration", method=RequestMethod.POST)
	public String addgps(HttpSession session,@ModelAttribute("BusDeviceRegistration") @Valid BusDeviceRegistration busDeviceRegistration,BindingResult result,ModelMap model)
	{
		session.setAttribute("BusDevice",busDeviceRegistration);
		
		
		if(result.hasErrors())
		{
			
			return "add_gps_registration";
		}
		
		busDeviceRegistration.setOrg_id("2");
	    busDeviceRegistrationDAO.insertBusDeviceRegistration(busDeviceRegistration);
	   
	    BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
	    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
	    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
	  
	    
	    
		return "view_bus_device";
	}
	
	@RequestMapping(value="/edit_bus_device",method=RequestMethod.GET)
	public String editbusdevice(HttpServletRequest request,@RequestParam("device_id") String device_id,ModelMap model)
	{
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
	    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration_byid(device_id));
	    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
	    
	    return "edit_bus_device";
	}
	
	@RequestMapping(value="/delete_bus_device", method=RequestMethod.GET)
	public String removeStudent(@RequestParam("device_id") String device_id, ModelMap model, Principal principal)
	{

		int status=busDeviceRegistrationDAO.deleteBusDevice(device_id);
		
		if(status==1)
		{


		
	    BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
	    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
	    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
		}
		
		return "view_bus_device";

	}
	
	@RequestMapping(value="/update_bus_device",method=RequestMethod.POST)
	public String updateorg(HttpSession session,HttpServletRequest request,String device_id,@ModelAttribute ("BusDeviceRegistration") BusDeviceRegistration busDeviceRegistration,BindingResult result,ModelMap model)
	{
		
			int status = busDeviceRegistrationDAO.updateBusDevice(device_id, busDeviceRegistration);
			System.out.println(status);
			
			if(status==1)
			{
				


				BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
			    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
			    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
				
			}
			
			return "view_bus_device";
			
	}
	
	@RequestMapping(value="/bus_device_details", method=RequestMethod.GET)
	public String searchdetails(HttpServletRequest request,@RequestParam("device_id") String device_id,ModelMap model,OrgRegistration orgRegistration)
	{
		
		BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
	    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration_byid(device_id));
	    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
     
		return "bus_device_details";
	}
	
	@RequestMapping(value="/find_bus_device",method=RequestMethod.GET)
	public String findbusdevice(HttpServletRequest request,@RequestParam("bus_id") String bus_id, @RequestParam("driver_id")String driver_id,@RequestParam("device_id") String device_id,ModelMap model)
	{
		if( bus_id== " " && driver_id== " " && device_id==" ")
		{
			
			BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
			return "search_bus_device";
		}
		else
		{
		
			BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.findbusdevice(bus_id, driver_id, device_id));
		    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
			return "search_bus_device";

		
		}
	}
	
	
	@RequestMapping(value="/configure_gps", method=RequestMethod.GET)
	public String configure_gps(ModelMap model,Principal principal)
	{
      // MessageSender.sendMessage(recipient, Message);	
		 BusDeviceRegistrationForm busDeviceRegistrationForm=new BusDeviceRegistrationForm();
		    busDeviceRegistrationForm.setBusDeviceRegistrations(busDeviceRegistrationDAO.getBusdeviceregistration());
		    model.addAttribute("busDeviceRegistrationForm",busDeviceRegistrationForm);
		    
		return "configure_gps";
	}
	
	@RequestMapping(value="/getdevice_sim", method=RequestMethod.POST)
	public @ResponseBody String getdevice_number(@RequestParam("id") String id,ModelMap model,Principal principal)
	{
		System.out.println("ajax working!!!!");
      // MessageSender.sendMessage(recipient, Message);	
		List<BusDeviceRegistration> busDeviceRegistrations=new ArrayList<BusDeviceRegistration>();
		busDeviceRegistrations=busDeviceRegistrationDAO.getBusdeviceregistration_byid(id);
		String returntext="<label>"+busDeviceRegistrations.get(0).getDevice_sim_number()+"</label>";
		
		   return returntext;
		
	}
	
	@RequestMapping(value="/send_configure_message", method=RequestMethod.POST)
	public String send_config_message(HttpServletRequest request,ModelMap model,Principal principal)
	{
		System.out.println("request capture");
		String recipient=request.getParameter("recipient");
		String Message=request.getParameter("configure_message");
		System.out.println(recipient);
		System.out.println(Message);
       MessageSender.sendMessage(recipient, Message);
		return "configure_gps";
	}
	
}
