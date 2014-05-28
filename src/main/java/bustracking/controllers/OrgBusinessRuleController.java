package bustracking.controllers;

import java.util.*; 
import java.io.IOException;
import java.security.Principal;


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

import bustracking.model.AddUser;
import bustracking.model.ClassSection;
import bustracking.model.OrgBusinessRule;
import bustracking.controllers.*;
import bustracking.forms.AddUserForm;
import bustracking.forms.ClassSectionForm;
import bustracking.forms.OrgBusinessRuleForm;
import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.MainDAO;
import bustracking.dao.OrgBusinessRuleDAO;
import bustracking.dao.OrgRegistrationDAO;

@Controller
public class OrgBusinessRuleController{
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired  
	BusRegistrationDAO busDAO; 	
	@Autowired
	OrgBusinessRuleDAO businessRuleDAO;
	@Autowired
	MainDAO mainDAO;
	
	//add business rules admin 
	@RequestMapping(value="/business_rule", method=RequestMethod.GET)
	public String getbusinessrule(ModelMap model, Principal principal){
		
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		model.addAttribute("orgname_for_school",orgname_for_school);
		return "admin_settings";
	}
	//ajax codes

	@RequestMapping(value="/add_brules_admin_ajax",method=RequestMethod.POST)
	public @ResponseBody String add_brules_admin_ajax(@ModelAttribute(value="org_id")OrgBusinessRule orgBusinessRule, BindingResult result,ModelMap model ) {
	
		String returnText="";
		System.out.println(""+orgBusinessRule.getOrg_name());
		
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(orgBusinessRule.getOrg_name());
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select id='bid' name='branch' style='width:220px'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
	
	//add business rules post method
	@RequestMapping(value="/business_rule",method=RequestMethod.POST)
	public String defaultsetting(HttpServletRequest request,@ModelAttribute("OrgBusinessRule") OrgBusinessRule businessRule,ModelMap model,OrgBusinessRule orgBusinessRules)
	{
		
		businessRule.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		int flag=businessRuleDAO.insert_organisation(businessRule);
		
		System.out.println(flag);
		OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
		model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
		
		return "view_business_rules";
		
	}

	//view business ruless
	
	
	@RequestMapping(value="/view_business_rule", method=RequestMethod.GET)
	public String view_business_rule(ModelMap model, Principal principal){
		
		OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
		model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
		return "view_business_rules";
	}
	
	//search admin business rules
	
	@RequestMapping(value="/findBusinessRules",method=RequestMethod.GET)
	public String findBus(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model)
	{
		if(org_name=="" && branch=="")
		{
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
	        
			return "view_business_rules";
		}
		else
		{
			System.out.println(org_name);
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.findRules(org_name, branch));
        model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
        
        
		return "search_business_rules";
		}
		
	}
	
	//second search in search result page
	
	@RequestMapping(value="/findBusinessRulesInSearch",method=RequestMethod.GET)
	public String findBusinessRulesInSearch(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,ModelMap model)
	{
		if(org_name=="" && branch=="")
		{
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
	        
			return "view_business_rules";
		}
		else
		{
			System.out.println(org_name);
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.findRules(org_name, branch));
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
	    
	    
		return "search_business_rules";
		}
		
	}
	
//edit business rules 
	
	@RequestMapping(value="/editbusinessrulesadmin",method=RequestMethod.GET)
	public String editbusinessrulesadmin(HttpServletRequest request,@RequestParam("org_name") String org_name,
			@RequestParam("branch")String branch,ModelMap model)
	{
			
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		model.addAttribute("orgname_for_school",orgname_for_school);
		
		OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.edit_orgbusinessrules(org_name,branch));
		model.addAttribute("orgBusinessRuleForm",orgBusinessRuleForm);
		
		return "edit_admin_brules";
	}

	//Update Businesss Rules Admin Side
	
	@RequestMapping(value="/updatebrulesadmin",method=RequestMethod.POST)
	public String updateclass(HttpServletRequest request,@ModelAttribute("OrgBusinessRule") OrgBusinessRule businessRule,BindingResult result,ModelMap model)
	{
		int status=businessRuleDAO.update_orgbusinessrules(businessRule);
		if(status==1)
		{
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
			
		}
		
		return "view_business_rules";
	}
	
//Delete Admin Business Rules
	
	@RequestMapping(value="/deleteadminbrules", method=RequestMethod.GET)
	public String deleteadminbrules(@RequestParam("org_name") String org_name,@RequestParam("branch") String branch, ModelMap model, Principal principal)
	{

		int status=businessRuleDAO.deletebusinessrulesadmin(org_name,branch);
		
		if(status==1)
		{
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
			
		
		
		}
		
		return "view_business_rules";

	}

	//view business rules in client side
	
	
		@RequestMapping(value="/client_view_businessrule", method=RequestMethod.GET)
		public String clientview_business_rule(ModelMap model, Principal principal){
			
			OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
			orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules_client(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
			return "client_business_rules";
		}
	
	
	// Change the Rules in Client Side
	
	@RequestMapping(value="/change_setting",method=RequestMethod.GET)
	public String clienteditbusinessrules(HttpServletRequest request,ModelMap model,Principal principal)
	{
			
		OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.client_changebusinessrules(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("orgBusinessRuleForm",orgBusinessRuleForm);
		
		return "client_edit_businessrules";
	}
	
	//Update Businesss Rules in Client Side
	
		@RequestMapping(value="/updatechangesettings",method=RequestMethod.POST)
		public String clienteditclass(HttpServletRequest request,@ModelAttribute("OrgBusinessRule") OrgBusinessRule businessRule,BindingResult result,ModelMap model,Principal principal)
		{
			int status=businessRuleDAO.client_updatebusinessrules(businessRule,mainDAO.getOrg_id(principal.getName()));
			if(status==1)
			{
				OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
				orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules_client(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
				
			}
			
			return "client_business_rules";
		}
		
	//
	
}


