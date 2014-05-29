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

import bustracking.model.*;
import bustracking.dao.AddUserDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.AddUserForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.StudentRegistrationForm;
import bustracking.dao.BusRegistrationDAO;
import bustracking.forms.BusRegistrationForm;



@Controller
@SessionAttributes({"adminuser"})
public class AddUserController{
	
	@Autowired
	AddUserDAO userDAO;
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired  
	BusRegistrationDAO busDAO; 
	
	
	@RequestMapping(value="/businessrulesregistration", method=RequestMethod.GET)
	public String businessrulesregistration(HttpSession session,ModelMap model, Principal principal){
		
		
	return "add_businessRules_registration";
	}
	

	
	@RequestMapping(value="/adduser", method=RequestMethod.GET)
	public String printWelcome(HttpSession session,ModelMap model, Principal principal){
		session.removeAttribute("adminuser");
		
		
		List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		model.addAttribute("orgname",orgname);
		
	return "add_adminuser";
	}
	
	@RequestMapping(value="/add_user_ajax",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@RequestParam("org_name") String org_name,ModelMap model ) {
	
		String returnText="";
			List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(org_name);
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select id='bid' name='branch' style='width:220px;'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
	
	// Add User Information Admin Side
	
	@RequestMapping(value="/adduser", method=RequestMethod.POST)
	public String adduser(HttpServletRequest request,HttpSession session,@ModelAttribute("AddUser") @Valid AddUser user, BindingResult result,ModelMap model){
    session.setAttribute("adminuser", user);
    
    OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
	orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
	model.addAttribute("orgRegistrationForm",orgRegistrationForm);
	
	user.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
	List <String> orgname=new ArrayList<String>();
	orgname=busDAO.getorgname();
	model.addAttribute("orgname",orgname);
	if(result.hasErrors()){
		AddUserForm adduserform=new AddUserForm();
		model.addAttribute("adduserform",adduserform);
		return "add_adminuser";
	}
	else{
		/*if(userDAO.check_email(user))
			userDAO.insert_user(user);
		else
		{
			model.addAttribute("emailexists","Email already exists!");
			return "add_adminuser";
			
		}
		
		if(userDAO.check_user_name(user))		
			userDAO.insert_user(user);
		else
		{
			model.addAttribute("userexists","Username already exists!");
			return "add_adminuser";
			
		}*/
		
		userDAO.insert_user(user);
		
		AddUserForm adduserform=new AddUserForm();
		adduserform.setAdduser(userDAO.getAdduser());
		model.addAttribute("adduserform",adduserform);
    return "view_adminuser";
	}
}

// View User Information Admin Side

@RequestMapping(value="/viewuser", method=RequestMethod.GET)
public String viewuser(ModelMap model, Principal principal){
	
	AddUserForm adduserform=new AddUserForm();
	adduserform.setAdduser(userDAO.getAdduser());
	model.addAttribute("adduserform",adduserform);
	
	AddUserForm adduserform1=new AddUserForm();
	adduserform1.setAdduser(userDAO.getAdduser());
	model.addAttribute("adduserform1",adduserform1);
	
	return "view_adminuser";
}

// Edit User Information Admin Side 

@RequestMapping(value="/edituser",method=RequestMethod.GET)
public String edituser(HttpServletRequest request,@RequestParam("username")String username,ModelMap model,OrgRegistration orgregistration)
{
	
	AddUserForm adduserform=new AddUserForm();
	adduserform.setAdduser(userDAO.getUsers(username));
	model.addAttribute("adduserform",adduserform);
	return "edit_user";
	
}

//Update User Information Admin Side

@RequestMapping(value="/updateuser",method=RequestMethod.POST)

public String updateuser(HttpServletRequest request,@ModelAttribute ("AddUser") AddUser user,ModelMap model)


{
	OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
	orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
	model.addAttribute("orgRegistrationForm",orgRegistrationForm);
	
		int status = userDAO.updateUser(user);
		System.out.println(status);
		if(status==1)
		{
			
			AddUserForm adduserform=new AddUserForm();
			adduserform.setAdduser(userDAO.getAdduser());
			model.addAttribute("adduserform",adduserform);
		}
	
		return "view_adminuser";
		
}


// Delete the User information Admin Side

@RequestMapping(value="/deleteuser", method=RequestMethod.GET)
public String removeStudent(@RequestParam("username") String username, ModelMap model, Principal principal)
{

	int status=userDAO.deleteUser(username);
	
	if(status==1)
	{
	
	
	AddUserForm adduserform=new AddUserForm();
	adduserform.setAdduser(userDAO.getAdduser());
	model.addAttribute("adduserform",adduserform);
	}
	
	return "view_adminuser";

}

// Find User Admin Side

@RequestMapping(value="/finduser",method=RequestMethod.GET)
public String findorg(HttpServletRequest request,
		@RequestParam("org_name") String org_name,
		@RequestParam("branch")String branch,
		@RequestParam("firstname") String firstname,
		@RequestParam("lastname") String lastname,
		@RequestParam("email") String email,ModelMap model)
{
	if( org_name== " " && branch== " " && firstname==" " && lastname==" " && email==" ")
	{
		AddUserForm adduserform=new AddUserForm();
		adduserform.setAdduser(userDAO.getAdduser());
		model.addAttribute("adduserform",adduserform);
        
		
		return "view_adminuser";
	}
	else
	{
	
		AddUserForm adduserform=new AddUserForm();
		adduserform.setAdduser(userDAO.finduser(org_name,branch,firstname,lastname,email));
		model.addAttribute("adduserform",adduserform);

		AddUserForm adduserform1=new AddUserForm();
		adduserform1.setAdduser(userDAO.getAdduser());
		model.addAttribute("adduserform1",adduserform1);
		
	 return "view_adminuser";
	}
}

// Find User Admin Side Search

@RequestMapping(value="/finduserInSearch",method=RequestMethod.GET)
public String finduserInSearch(HttpServletRequest request,@RequestParam("org_name") String org_name, @RequestParam("branch")String branch,@RequestParam("firstname") String firstname,@RequestParam("lastname") String lastname,@RequestParam("email") String email,ModelMap model)
{
	if( org_name== " " && branch== " " && firstname==" " && lastname==" " && email==" ")
	{
		AddUserForm adduserform=new AddUserForm();
		adduserform.setAdduser(userDAO.getAdduser());
		model.addAttribute("adduserform",adduserform);
        
		return "view_adminuser";
	}
	else
	{
	
		AddUserForm adduserform=new AddUserForm();
		adduserform.setAdduser(userDAO.finduser(org_name,branch,firstname,lastname,email));
		model.addAttribute("adduserform",adduserform);

	 return "search_user";
	}
}

// Check Username Exists

@RequestMapping(value="/check_username", method=RequestMethod.POST)
public @ResponseBody String uname_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
	if(request.getParameter("username").equals(""))
		return "";
	
	if(userDAO.check_user_name(request.getParameter("username")))
		return "Username Already Registered<br/>";
	else
		return "";
}	
	
	
// Check Email Exists

@RequestMapping(value="/check_email", method=RequestMethod.POST)
public @ResponseBody String email_check_ajax(HttpServletRequest request,HttpSession session,Model model, Principal prinicpal){
	if(request.getParameter("email").equals(""))
		return "";
	
	if(userDAO.check_email(request.getParameter("email")))
		return "Email Already Registered<br/>";
	else
		return "";
}	

/*@RequestMapping(value="/userdetails", method=RequestMethod.GET)
	public String userdetails(HttpServletRequest request,@RequestParam("admin_reg_no") String admin_reg_no,ModelMap model,AddUser adduser)
	{
		
		
	AddUserForm adduserform=new AddUserForm();
	adduserform.setAdduser(userDAO.getUsers(admin_reg_no));
	model.addAttribute("adduserform",adduserform);
		
		
		return "user_details";
	}*/

/*@RequestMapping(value="/smsreport", method=RequestMethod.GET)
public String smsreport(ModelMap model, Principal principal){
	
	return "sms_report";
}*/
}