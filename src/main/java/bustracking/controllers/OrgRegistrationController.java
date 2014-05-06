package bustracking.controllers;

import java.awt.List;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

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

import bustracking.forms.BusRegistrationForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.StudentRegistrationForm;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.model.AddUser;
import bustracking.model.OrgRegistration;
import bustracking.model.StudentRegistration;
import bustracking.forms.*;
import bustracking.dao.*;


@Controller
@SessionAttributes({"organisation","user"})
public class OrgRegistrationController{

	@Autowired
	OrgRegistrationDAO orgDAO;
	
	@Autowired
	AddUserDAO addUserDAO;
	

	
@RequestMapping(value="/orgregistration", method=RequestMethod.GET)
public String PrintWelcome(HttpSession session,Model model, Principal prinicpal){
		
	session.removeAttribute("organisation");
	session.removeAttribute("user");
	//model.addAttribute("org_id",orgDAO.getOrg_id());
	OrgRegistrationForm orgform=new OrgRegistrationForm();
	orgform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgform", orgform);
	return "org_registration";
}

@RequestMapping(value="/check_unique", method=RequestMethod.POST)
public @ResponseBody String org_id_unique_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
	if(request.getParameter("org_unique_id").equals(""))
		return "";
	
	if(orgDAO.checkUnique(request.getParameter("org_unique_id")))
		return "Organisation Id Already Exists<br/>";
	else
		return "";
}

@RequestMapping(value="/orgregistration", method=RequestMethod.POST)
public String orgregistration(HttpSession session,@ModelAttribute("OrgRegistration") @Valid OrgRegistration org,BindingResult result, ModelMap model)
{
	session.setAttribute("organisation",org);
	if(result.hasErrors())
	{
		return "org_registration";
	}
	orgDAO.insert_organisation(org);
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform", orgregistrationform);
	session.removeAttribute("organisation");
	return "view_org";
}


@RequestMapping(value="/vieworg",method=RequestMethod.GET)
public String vieworg(ModelMap model,Principal prinicipal)
{
	
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform", orgregistrationform);
	
	return "view_org";
	
}


@RequestMapping(value="/editorg",method=RequestMethod.GET)
public String editorg(HttpServletRequest request,@RequestParam("registration_no") String registration_no,ModelMap model,OrgRegistration orgregistration)
{
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_no(registration_no));
	model.addAttribute("orgregistrationform", orgregistrationform);
	return "edit_org";
	
}

@RequestMapping(value="/updateorg",method=RequestMethod.POST)
public String updateorg(HttpServletRequest request,@ModelAttribute ("OrgRegistration") OrgRegistration orgRegistration,ModelMap model,Principal prinicipal)
{
	
		/*int status = orgDAO.updateOrganization(orgRegistration,orgRegistration.getRegistration_no());
		System.out.println(status);
		if(status==1)
		{
			
			OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
			orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
			model.addAttribute("orgregistrationform",orgregistrationform);
			
		}*/
		
		return "view_org";
		
}


@RequestMapping(value="/deleteorg", method=RequestMethod.GET)
public String removeStudent(@RequestParam("registration_no") String registration_no, ModelMap model, Principal principal)
{

	int status=orgDAO.deleteorganization(registration_no);
	
	if(status==1)
	{
    
	
    OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform",orgregistrationform);
	}
	
	return "view_org";

}

@RequestMapping(value="/findorg",method=RequestMethod.GET)
public String findorg(HttpServletRequest request,@RequestParam("org_name")String org_name,@RequestParam("branch") String branch,@RequestParam("city") String city,@RequestParam("country") String country,ModelMap model)
{
	if(org_name=="" && branch== "" && city== "" && country=="")
	{
		OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
        orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
		model.addAttribute("orgregistrationform",orgregistrationform);
        
		return "view_org";
	}
	else
	{
	
	OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.findOrganization(org_name, branch, city,country));
	model.addAttribute("orgregistrationform",orgregistrationform);
	return "search_org";
	}
}

@RequestMapping(value="/findorgInSearch",method=RequestMethod.GET)
public String findorgInSearch(HttpServletRequest request,@RequestParam("org_name")String org_name,@RequestParam("branch") String branch,@RequestParam("city") String city,@RequestParam("country") String country,ModelMap model)
{
	if(org_name=="" && branch== "" && city== "" && country=="")
	{
		OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
        orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
		model.addAttribute("orgregistrationform",orgregistrationform);
        
		return "view_org";
	}
	else
	{
	
	OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.findOrganization(org_name, branch, city,country));
	model.addAttribute("orgregistrationform",orgregistrationform);
	return "search_org";
	}
}
	
	
	
@RequestMapping(value="/orgdetails", method=RequestMethod.GET)
	public String searchdetails(HttpServletRequest request,@RequestParam("registration_no") String registration_no,ModelMap model,OrgRegistration orgRegistration)
	{
		
		
     OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
		orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_no(registration_no));
		model.addAttribute("orgregistrationform", orgregistrationform);
		
		
		return "org_details";
	}

// Post method for organization and branch

@RequestMapping(value = { "/ajax_getorgname" }, method = RequestMethod.POST)
public @ResponseBody
String ajax_process_owner(HttpSession session,
		HttpServletRequest request, ModelMap model, Principal principal) {
	String resultHTML="";

	OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
	orgRegistrationForm.setOrgregistration(orgDAO.getBranch(request.getParameter("org_name")));
	

	resultHTML="<select id='org_name'>";
	for (OrgRegistration org : orgDAO.getBranch(request.getParameter("org_name")) ) {
		resultHTML+="<option value='"+org.getBranch()+"'>"+org.getBranch()+"</option>";
	}
	resultHTML+="</select>";

	
	
	return resultHTML;
}




}
