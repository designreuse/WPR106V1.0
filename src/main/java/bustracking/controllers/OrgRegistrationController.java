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
import bustracking.model.OrgBusinessRule;
import bustracking.forms.*;
import bustracking.dao.*;


@Controller
@SessionAttributes({"organisation","user"})
public class OrgRegistrationController{

	@Autowired
	OrgRegistrationDAO orgDAO;
	
	@Autowired
	AddUserDAO addUserDAO;
	
	@Autowired
	OrgBusinessRuleDAO orgBusinessRuleDAO;

	
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



@RequestMapping(value="/orgregistration", method=RequestMethod.POST)
public String orgregistration(HttpServletRequest request,HttpSession session,@ModelAttribute("OrgBusinessRule") OrgBusinessRule businessRule,@ModelAttribute("OrgRegistration") @Valid OrgRegistration org,BindingResult result, ModelMap model)
{
	session.setAttribute("organisation",org);
	int count=orgDAO.checkUniqueorganization(org.getOrg_name(),org.getBranch());
	if(count==0)
	{
		model.addAttribute("error",true);
		return "org_registration";
	}
	if(result.hasErrors())
	{
		return "org_registration";
	}
	/*else{
		if(orgDAO.checkUnique(request.getParameter("org_name"),request.getParameter("branch")))
	       orgDAO.insert_organisation(org);
		else
		{
			model.addAttribute("branchexists","organization & branch already exists!");
			return "org_registration";
		}
	}*/
	
	
	
	// Insert Organization
	orgDAO.insert_organisation(org);
	
	// Get Organization id For Business rule
		businessRule.setOrg_id(orgDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		   businessRule.setGoogle_map_traffic("off");
		   businessRule.setPickup_start_time("07:00");
		  businessRule.setPickup_end_time("09:00");
		   businessRule.setDrop_start_time("16:00");
		   businessRule.setDrop_end_time("18:00");
		   businessRule.setKg_start_time("07:00");
		   businessRule.setKg_end_time("13:00");
		   businessRule.setSpeed_limit("50");
		   businessRule.setSms_options("delay");
		   businessRule.setSaturday("off");
		   businessRule.setAlert_time_interval("10");
		  businessRule.setSms_sending("off");
		  businessRule.setAverage_speed("20");
	// Insert Default Setting of Organization
	orgBusinessRuleDAO.insert_organisation(businessRule);
	
	
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform", orgregistrationform);
	session.removeAttribute("organisation");
	
	OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
	orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform1", orgregistrationform1);
	
	return "view_org";
}


@RequestMapping(value="/vieworg",method=RequestMethod.GET)
public String vieworg(HttpSession session,ModelMap model,Principal prinicipal)
{
	session.removeAttribute("org_name");
	session.removeAttribute("branch");
	session.removeAttribute("city");
	session.removeAttribute("country");
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform", orgregistrationform);
	
	OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
	orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform1", orgregistrationform1);
	
	return "view_org";
	
}


@RequestMapping(value="/editorg",method=RequestMethod.GET)
public String editorg(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model,OrgRegistration orgregistration)
{
	OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_id(org_name, branch));
	model.addAttribute("orgregistrationform", orgregistrationform);
	return "edit_org";
	
}

@RequestMapping(value="/updateorg",method=RequestMethod.POST)
public String updateorg(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch, @ModelAttribute ("OrgRegistration") @Valid OrgRegistration orgRegistration,BindingResult result,ModelMap model,Principal prinicipal)
{
	int count=orgDAO.checkUniqueorganization(org_name,branch);
	if(count==0)
	{
		model.addAttribute("error",true);
		OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
		orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_id(org_name, branch));
		model.addAttribute("orgregistrationform", orgregistrationform);
		return "edit_org";
	}
	if(result.hasErrors())
	{
		OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
		orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_id(org_name, branch));
		model.addAttribute("orgregistrationform", orgregistrationform);
		return "edit_org";
	}
	
		int status = orgDAO.updateOrganization(orgRegistration);
		System.out.println(status);
		if(status==1)
		{
			
			OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
			orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
			model.addAttribute("orgregistrationform",orgregistrationform);
			
			OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
			orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
			model.addAttribute("orgregistrationform1", orgregistrationform1);
		}
		
		return "view_org";
		
}

// Delete organization

@RequestMapping(value="/deleteorg", method=RequestMethod.GET)
public String removeStudent(@RequestParam("org_name") String org_name,@RequestParam("branch") String branch, ModelMap model, Principal principal)
{

	int status=orgDAO.deleteorganization(org_name,branch);
	
	if(status==1)
	{
    
	
    OrgRegistrationForm orgregistrationform= new OrgRegistrationForm();
	orgregistrationform.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform",orgregistrationform);
	
	OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
	orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform1", orgregistrationform1);
	}
	
	return "view_org";

}

@RequestMapping(value="/findorg",method=RequestMethod.GET)
public String findorg(HttpSession session,HttpServletRequest request,@RequestParam("org_name")String org_name,@RequestParam("branch") String branch,@RequestParam("city") String city,@RequestParam("country") String country,ModelMap model)
{
	session.setAttribute("org_name", org_name);
	session.setAttribute("branch", branch);
	session.setAttribute("city", city);
	session.setAttribute("country", country);
	
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
	
	OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
	orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform1", orgregistrationform1);
	
	return "view_org";
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
	
	OrgRegistrationForm orgregistrationform1= new OrgRegistrationForm();
	orgregistrationform1.setOrgregistration(orgDAO.getOrgregistration());
	model.addAttribute("orgregistrationform1", orgregistrationform1);
	
	return "view_org";
	}
}
	
	
	
/*@RequestMapping(value="/orgdetails", method=RequestMethod.GET)
	public String searchdetails(HttpServletRequest request,@RequestParam("registration_no") String registration_no,ModelMap model,OrgRegistration orgRegistration)
	{
		
		
     OrgRegistrationForm orgregistrationform = new OrgRegistrationForm();
		orgregistrationform.setOrgregistration(orgDAO.getOrgregistration_no(registration_no));
		model.addAttribute("orgregistrationform", orgregistrationform);
		
		
		return "org_details";
	}*/

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


@RequestMapping(value="/check_unique", method=RequestMethod.POST)
public @ResponseBody String org_id_unique_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
	if(request.getParameter("org_name").equals("")&&request.getParameter("branch").equals(""))
		return "";
	
	if(orgDAO.checkUnique(request.getParameter("org_name"),request.getParameter("branch")))
		return "Already Registered<br/>";
	else
		return "";
}

}
