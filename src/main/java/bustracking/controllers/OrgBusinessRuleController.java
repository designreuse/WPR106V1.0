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
import bustracking.model.OrgBusinessRule;
import bustracking.controllers.*;
import bustracking.forms.OrgBusinessRuleForm;
import bustracking.dao.BusRegistrationDAO;
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
	
	
	@RequestMapping(value="/business_rule", method=RequestMethod.GET)
	public String getbusinessrule(ModelMap model, Principal principal){
		
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		
		/*OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getDefaultSettings("2"));
		model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);*/
		model.addAttribute("orgname_for_school",orgname_for_school);
		return "admin_settings";
	}
	

	@RequestMapping(value="/add_brules_admin_ajax",method=RequestMethod.POST)
	public @ResponseBody String add_brules_admin_ajax(@ModelAttribute(value="org_id")OrgBusinessRule orgBusinessRule, BindingResult result,ModelMap model ) {
	
		String returnText="";
		System.out.println(""+orgBusinessRule.getOrg_name());
		
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(orgBusinessRule.getOrg_name());
		
		returnText=returnText+"<select id='bid' name='branch' class='org_input_cmbbx'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
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

	
	@RequestMapping(value="/view_business_rule", method=RequestMethod.GET)
	public String view_business_rule(ModelMap model, Principal principal){
		
		/*List <String> orgname=new ArrayList<String>();
		orgname=busDAO.getorgname();*/
		
		OrgBusinessRuleForm orgBusinessRuleForm=new OrgBusinessRuleForm();
		orgBusinessRuleForm.setOrgBusinessRules(businessRuleDAO.getOrgBusinessRules());
		model.addAttribute("orgBusinessRuleForm", orgBusinessRuleForm);
		
		/*model.addAttribute("orgname",orgname);*/
		return "view_business_rules";
	}
	
}
