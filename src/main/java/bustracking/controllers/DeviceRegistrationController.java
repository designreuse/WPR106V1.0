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
import org.springframework.web.bind.annotation.ResponseBody;

import bustracking.dao.DeviceRegistrationDAO;
import bustracking.forms.DeviceRegistrationForm;
import bustracking.model.BusRegistration;
import bustracking.model.DeviceRegistration;

import java.net.*;

@Controller
public class DeviceRegistrationController
{
	@Autowired
	DeviceRegistrationDAO deviceRegistrationDAO;
	
	@RequestMapping(value="/insert_device", method = RequestMethod.GET)
	public String device_insert_form(HttpSession session,ModelMap model, Principal principal ) {
	
		List <String> carriername=new ArrayList<String>();
		carriername=deviceRegistrationDAO.getcarriername();
		model.addAttribute("carriername",carriername);
			return "add_device_registration";
	
	}
	
	@RequestMapping(value="/apn_ajax",method=RequestMethod.POST)
	public @ResponseBody String carrier_apn(@ModelAttribute(value="carrier_id")DeviceRegistration devicereg, BindingResult result,ModelMap model ) {
	
		String returnText="";
		System.out.println(""+devicereg.getCarrier());
		
		List <String> branch=new ArrayList<String>();
		branch=deviceRegistrationDAO.getapn(devicereg.getCarrier());
		
		returnText=returnText+"<select id='apn_id'  class='org_input_cmbbx'>";
		returnText+="<option value='' selected>--Select APN--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
		
		
		
		
	return returnText;
	}
	
	@RequestMapping(value="/view_devices", method = RequestMethod.GET)
	public String view_inserted_device(HttpSession session,ModelMap model, Principal principal ) {
	
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		//System.out.println("deviceregistrationno"+deviceRegistrationForm.getDeviceRegistrations().get(0).getDevice_imei_number());
		
			return "view_bus_device";
		
 
	}
	
	
	@RequestMapping(value="/deviceregistration", method = RequestMethod.POST)
	public String insert_device(HttpServletRequest req,HttpSession session,@ModelAttribute("DeviceRegistration") @Valid DeviceRegistration deviceRegistration,BindingResult result,ModelMap model, Principal principal ) {
	
		
		
		if(result.hasErrors())
		{
			return "add_device_registration";
		}
		else
		{	
			deviceRegistrationDAO.insert_device(deviceRegistration,principal.getName());
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			
			return "view_bus_device";
		}
		
 
	}
}