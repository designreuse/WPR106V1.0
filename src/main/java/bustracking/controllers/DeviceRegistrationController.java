package bustracking.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import bustracking.dao.DeviceRegistrationDAO;
import bustracking.forms.BusDeviceRegistrationForm;
import bustracking.forms.BusRegistrationForm;
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
	
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		List <String> carriername=new ArrayList<String>();
		carriername=deviceRegistrationDAO.getcarriername();
		model.addAttribute("carriername",carriername);
			return "add_device_registration";
	
	}
	
	@RequestMapping(value="/changepassword", method=RequestMethod.GET)
	public String changepassword(HttpSession session,ModelMap model, Principal principal){
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		List <String> carriername=new ArrayList<String>();
		carriername=deviceRegistrationDAO.getcarriername();
		model.addAttribute("carriername",carriername);
			
	return "add_device_setup";
	}
	
	
	
	
	
	@RequestMapping(value="/insert_device_dlr", method = RequestMethod.GET)
	public String device_insert_form1(HttpServletRequest req,@RequestParam("myid") String myid,@RequestParam("status") String status,@RequestParam("updated_on") String updated_on,@RequestParam("res") String reString,HttpSession session,ModelMap model, Principal principal ) {
	
		System.out.println("Message ID:"+myid);
		System.out.println("Status:"+status);
		System.out.println("Updated on:"+updated_on);
		System.out.println("Res:"+reString);
		req.getQueryString();
		System.out.println("queries"+req.getQueryString());
			return "add_device_registration";
	
	}
	
	// Edit Device Information
	
	@RequestMapping(value="/edit_device", method = RequestMethod.GET)
	public String edit_device(@RequestParam("device_imei_number")String device_imei_number,@ModelAttribute("DeviceRegistration") DeviceRegistration deviceRegistration,BindingResult result,ModelMap model, Principal principal ) {
	
		List <String> carriername=new ArrayList<String>();
		carriername=deviceRegistrationDAO.getcarriername();
		model.addAttribute("carriername",carriername);
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.getDevice(device_imei_number));
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			return "edit_device";
	}
	
	// Update Device Information
	
	@RequestMapping(value="/update_device", method=RequestMethod.POST)
	public String updateBus(HttpServletRequest request,@ModelAttribute("DeviceRegistration")DeviceRegistration deviceregistration,
			BindingResult result,ModelMap model,Principal principal)
	{
		
		
		int status = deviceRegistrationDAO.updateDevice(deviceregistration);
		System.out.println(status);
		
		DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		return "view_bus_device";
		
	}
	
	// Delete Device information
	
	@RequestMapping(value="/delete_device", method=RequestMethod.GET)
	public String removeDevice(@RequestParam("device_imei_number") String device_imei_number,ModelMap model, Principal principal) {
	
		int status=deviceRegistrationDAO.deleteDevice(device_imei_number);
		
		if(status==1)
		{
        
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		
		}
		
		return "view_bus_device";
	}
	
	@RequestMapping(value="/imei_ajax",method=RequestMethod.POST)
	public @ResponseBody String device_edit(@RequestParam("device_imei_number") String device_imei_number,ModelMap model) {
	
		String returnText="";
		List <String> invoice=new ArrayList<String>();
		invoice=deviceRegistrationDAO.get_imei(device_imei_number);
		
		
		for(String bname:invoice)
		{
			returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='sim_invoice_id' name='sim_invoice_number' value='"+bname+"'/>";
			
		}			
		 	
		 returnText=returnText+"<split>";
		 
		 List <String> simdate=new ArrayList<String>();
		 simdate=deviceRegistrationDAO.get_simdate(device_imei_number);
		 
		 for(String sdate:simdate)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='datepicker1' name='sim_procured_date' value='"+sdate+"'/>";
				
			}	
		 
         returnText=returnText+"<split>";
		 
		 List <String> simcardno=new ArrayList<String>();
		 simcardno=deviceRegistrationDAO.get_simcardno(device_imei_number);
		 
		 for(String scardno:simcardno)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='simno_id' name='sim_card_number' value='"+scardno+"'/>";
				
			}	
		 
          returnText=returnText+"<split>";
		 
		 List <String> modelno=new ArrayList<String>();
		 modelno=deviceRegistrationDAO.get_modelno(device_imei_number);
		 
		 for(String mno:modelno)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='modelid' name='model_no' value='"+mno+"'/>";
				
			}	
		 
		 returnText=returnText+"<split>";
		 
		 List <String> ddate=new ArrayList<String>();
		 ddate=deviceRegistrationDAO.get_devicedate(device_imei_number);
		 
		 for(String devdate:ddate)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='datepicker' name='device_procured_date' value='"+devdate+"'/>";
				
			}	
		 
		 returnText=returnText+"<split>";
		 
		 List <String> dinvoice=new ArrayList<String>();
		 dinvoice=deviceRegistrationDAO.get_deviceinvoice(device_imei_number);
		 
		 for(String devinvoice:dinvoice)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='invoiceid' name='device_invoice_number' value='"+devinvoice+"'/>";
				
			}
		 
		 returnText=returnText+"<split>";
		 
		 List <String> pass=new ArrayList<String>();
		 pass=deviceRegistrationDAO.get_pass(device_imei_number);
		 
		 for(String pwd:pass)
			{
				returnText=returnText+"<input type='text' class='org_input_txtbx_height1' id='passid' name='password' value='"+pwd+"'/>";
				
			}
		 
		 returnText=returnText+"<split>";
		 
		 List <String> comments=new ArrayList<String>();
		 comments=deviceRegistrationDAO.get_comments(device_imei_number);
		 
		 returnText=returnText+"<textarea class='org_input_txtarea_height1' id='comments_id' name='comments'>";
		 for(String cmt:comments)
			{
			 returnText=returnText+"'"+cmt+"'";
				
			}
		 
		 returnText=returnText+"</textarea>";
		 
		 returnText=returnText+"<split>";
		 List <String> manufacturer=new ArrayList<String>();
		 manufacturer=deviceRegistrationDAO.get_manu(device_imei_number);
		   returnText=returnText+"<select name='manufacturer' class='org_input_cmbbx' id='manuid' onblur='Validate('manuidid')'>";
	 	
			
			for(String manufact:manufacturer)
			{
				returnText+="<option value='"+manufact+"'>"+manufact+"</option>";
				}			
			  
		   returnText=returnText+"</select>";
		   
		   returnText=returnText+"<split>";
			 List <String> carrier=new ArrayList<String>();
			carrier=deviceRegistrationDAO.get_carrier(device_imei_number);
			   returnText=returnText+"<select name='carrier' class='org_input_cmbbx' id='carrierid' onblur='Validate('carrierid')' onchange=doAjaxPost()>";
		 	
				
				for(String carr:carrier)
				{
					returnText+="<option value='"+carr+"'>"+carr+"</option>";
					}			
				  
			   returnText=returnText+"</select>";
			   
			   returnText=returnText+"<split>";
				 List <String> devicetested=new ArrayList<String>();
				devicetested=deviceRegistrationDAO.get_dtested(device_imei_number);
				   
			 	
					
					for(String dtest:devicetested)
					{
						System.out.println("test"+dtest);
						if(dtest=="1"){
							System.out.println("test"+dtest);
						returnText=returnText+"<input type='radio' id='id_yes_dtested' name='device_tested' value='1' checked='checked'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
				                  	"<input type='radio' id='id_no_dtested' name='device_tested' value='0'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						else
						{
							System.out.println("test"+dtest);
							returnText=returnText+"<input type='radio' id='id_yes_dtested' name='device_tested' value='1'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
				                  	"<input type='radio' id='id_no_dtested' name='device_tested' value='0' checked='checked'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
						System.out.println("val"+returnText);
						}
						}
		 
					 returnText=returnText+"<split>";
					 List <String> simtested=new ArrayList<String>();
					simtested=deviceRegistrationDAO.get_stested(device_imei_number);
					   
				 	
						
						for(String stest:simtested)
						{
							System.out.println("test"+stest);
							if(stest=="1"){
								System.out.println("test"+stest);
							returnText=returnText+"<input type='radio' id='id_yes_stested' name='sim_card_tested' value='1' checked='checked'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
					                  	"<input type='radio' id='id_no_stested' name='sim_card_tested' value='0'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
							}
							else
							{
								System.out.println("test"+stest);
								returnText=returnText+"<input type='radio' id='id_yes_stested' name='sim_card_tested' value='1'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
					                  	"<input type='radio' id='id_no_stested' name='sim_card_tested' value='0' checked='checked'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
							System.out.println("val"+returnText);
							}
							}
			 
						 returnText=returnText+"<split>";
						 List <String> paired=new ArrayList<String>();
						paired=deviceRegistrationDAO.get_dspaired(device_imei_number);
						   
					 	
							
							for(String pair:paired)
							{
								System.out.println("test"+pair);
								if(pair=="1"){
									System.out.println("test"+pair);
								returnText=returnText+"<input type='radio' id='id_yes_paired' name='device_sim_paired' value='1' checked='checked'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
						                  	"<input type='radio' id='id_no_paired' name='device_sim_paired' value='0'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
								}
								else
								{
									System.out.println("test"+pair);
									returnText=returnText+"<input type='radio' id='id_yes_paired' name='device_sim_paired' value='1'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
						                  	"<input type='radio' id='id_no_paired' name='device_sim_paired' value='0' checked='checked'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
								System.out.println("val"+returnText);
								}
								}
				 
							 returnText=returnText+"<split>";
							 List <String> status=new ArrayList<String>();
							status=deviceRegistrationDAO.get_status(device_imei_number);
							   
						 	
								
								for(String stat:status)
								{
									System.out.println("test"+stat);
									if(stat=="1"){
										System.out.println("test"+stat);
									returnText=returnText+"<input type='radio' id='id_yes_status' name='device_status' value='1' checked='checked'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
							                  	"<input type='radio' id='id_no_status' name='device_status' value='0'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
									}
									else
									{
										System.out.println("test"+stat);
										returnText=returnText+"<input type='radio' id='id_yes_status' name='device_status' value='1'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
							                  	"<input type='radio' id='id_no_status' name='device_status' value='0' checked='checked'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
									System.out.println("val"+returnText);
									}
									}
								 returnText=returnText+"<split>";
								 
								 
								 List <String> assigned=new ArrayList<String>();
								assigned=deviceRegistrationDAO.get_assigned(device_imei_number);
								   
							 	
									
									for(String assign:assigned)
									{
										System.out.println("test"+assign);
										if(assign.trim().equals("1")){
											System.out.println("test"+assign);
										returnText=returnText+"<input type='radio' id='id_yes_assigned' name='is_assigned' value='1' checked='checked'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
								                  	"<input type='radio' id='id_no_assigned' name='is_assigned' value='0'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
										}
										else
										{
											System.out.println("test"+assign);
											returnText=returnText+"<input type='radio' id='id_yes_assigned' name='is_assigned' value='1'>&nbsp;yes&nbsp;&nbsp;&nbsp;&nbsp;"+
								                  	"<input type='radio' id='id_no_assigned' name='is_assigned' value='0' checked='checked'/>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;";
										System.out.println("val"+returnText);
										}
										}
						 
	return returnText;
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
	//find devices

	@RequestMapping(value="/find_devicesadmin",method=RequestMethod.GET)
	public String find_devicesadmin(HttpServletRequest request,@RequestParam("device_imei_number") String device_imei_number,@RequestParam("device_sim_number") String device_sim_number,@RequestParam("adminip") String adminip,@RequestParam("create_user_id") String create_user_id,ModelMap model)
	
	{		
		if( device_imei_number=="" && device_sim_number==""  && adminip=="" && create_user_id=="")
		{	
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			//System.out.println("deviceregistrationno"+deviceRegistrationForm.getDeviceRegistrations().get(0).getDevice_imei_number());
			
				return "view_bus_device";
		}
		else
		{
		
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.find_devices(device_imei_number, device_sim_number, adminip,create_user_id));
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
		    
			return "search_bus_device";

		
		}
	}
	

	

	
	
	@RequestMapping(value="/deviceregistration", method = RequestMethod.POST)

	public String insert_device(HttpServletRequest req,HttpSession session,@ModelAttribute("DeviceRegistration") @Valid DeviceRegistration deviceRegistration,BindingResult result,ModelMap model, Principal principal ) {
	
	
		List <String> carriername=new ArrayList<String>();
		carriername=deviceRegistrationDAO.getcarriername();
		model.addAttribute("carriername",carriername);
		
		
		if(result.hasErrors())
		{
			return "add_device_setup";
		}
		else
		{	
			/*if(deviceRegistrationDAO.check_simcard_no(deviceRegistration))
				deviceRegistrationDAO.insert_device(deviceRegistration,principal.getName());
			else
			{
				model.addAttribute("simnoexists","SimCard Number already exists!");
				return "add_device_registration";
				
			}
			
			if(deviceRegistrationDAO.check_device_invoice(deviceRegistration))
				deviceRegistrationDAO.insert_device(deviceRegistration,principal.getName());
			else
			{
				model.addAttribute("dinvoicenoexists","Device Invoice Number already exists!");
				return "add_device_registration";
				
			}
			
			if(deviceRegistrationDAO.check_sim_invoice(deviceRegistration))
				deviceRegistrationDAO.insert_device(deviceRegistration,principal.getName());
			else
			{
				model.addAttribute("sinvoicenoexists","Sim Invoice Number already exists!");
				return "add_device_registration";
				
			}
			
			if(deviceRegistrationDAO.check_imei_no(deviceRegistration))
				deviceRegistrationDAO.insert_device(deviceRegistration,principal.getName());
			else
			{
				model.addAttribute("imeinoexists","Device Imei Number already exists!");
				return "add_device_registration";
				
			}*/
			
			deviceRegistrationDAO.insert_device(deviceRegistration);
			DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
			deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
			model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);
			
			
			return "view_bus_device";
		}
		
 
	}
	
	@RequestMapping(value="/deviceconfiguration", method = RequestMethod.POST)
	public String configure_device(HttpServletRequest req,HttpServletResponse response,HttpSession session,@ModelAttribute("DeviceRegistration") @Valid DeviceRegistration device,BindingResult result,ModelMap model, Principal principal ) {
	 
		String stat=req.getParameter("status");
		String update=req.getParameter("updated_on");
		String ress=req.getParameter("res");
		
		System.out.println(stat);
		req.getQueryString();
		System.out.println("queries"+req.getQueryString());
		
		
		deviceRegistrationDAO.sms(device);
	    DeviceRegistrationForm deviceRegistrationForm=new DeviceRegistrationForm();
		deviceRegistrationForm.setDeviceRegistrations(deviceRegistrationDAO.get_devices());
		model.addAttribute("deviceRegistrationForm",deviceRegistrationForm);	
		String postID=req.getParameter("myid");
		String status=req.getParameter("status");
		String updates_on=req.getParameter("updated_on");
		String res=req.getParameter("res");
		
		System.out.println("Myid:"+postID+"/Status:"+status+"/updates_on:"+updates_on+"/Res:"+res);
		
		return "add_device_registration";
	}
	
}