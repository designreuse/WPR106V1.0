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

import bustracking.dao.ClassSectionDAO;
import bustracking.dao.MainDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.ClassSectionForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.RouteViewForm;
import bustracking.model.AddUser;
import bustracking.model.ClassSection;
import bustracking.model.BusRegistration;
import bustracking.model.StudentRegistration;
import bustracking.forms.BusRegistrationForm;
import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.MainDAO;

@Controller
@SessionAttributes({"class_section"})
public class ClassSectionController
{
	@Autowired
	ClassSectionDAO classSectionDAO;
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired
	BusRegistrationDAO busDAO;
	
	@Autowired
	MainDAO mainDAO;
	
	@RequestMapping(value="/addclass", method = RequestMethod.GET)
	public String get_insert_form(HttpSession session,ModelMap model, Principal principal ) {
	
		
		model.addAttribute("Classexits","false");
		session.removeAttribute("class_section");
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		model.addAttribute("orgname_for_school",orgname_for_school);
		
		return "class_section";
		
 
	}

	@RequestMapping(value="/viewclass", method = RequestMethod.GET)
	public String viewClass(HttpSession session,ModelMap model, Principal principal ) {
	
		ClassSectionForm classSectionForm=new ClassSectionForm();
		classSectionForm.setClassSections(classSectionDAO.get_classsection());
		model.addAttribute("classSectionForm",classSectionForm);
		
		ClassSectionForm classSectionForm1=new ClassSectionForm();
		classSectionForm1.setClassSections(classSectionDAO.get_classsection());
		model.addAttribute("classSectionForm1",classSectionForm1);
		
		return "view_ClassAndSection";
		
 
	}
	
	
	@RequestMapping(value="/insert_class_section", method = RequestMethod.POST)
	public String insert_class_values(HttpServletRequest request,HttpSession session,@ModelAttribute("ClassSection") @Valid ClassSection classSection,BindingResult result,ModelMap model, Principal principal ) {
	
		session.setAttribute("class_section",classSection);
		classSection.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		if(result.hasErrors())
		{
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);
			return "class_section";
		}
		int sqlresult=classSectionDAO.insert_classsection(classSection);
		
		if(sqlresult==1)
			model.addAttribute("Classexits","true");
		else
		{
			
			session.removeAttribute("class_section");
		}
			
		
		ClassSectionForm classSectionForm=new ClassSectionForm();
		classSectionForm.setClassSections(classSectionDAO.get_classsection());
		model.addAttribute("classSectionForm",classSectionForm);
		
		
		return "view_ClassAndSection";
		
 
	}
	
	// Ajax for Organization and Branch
	
	@RequestMapping(value="/add_class_ajax",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@ModelAttribute(value="org_id")ClassSection section, BindingResult result,ModelMap model ) {
	
		String returnText="";
		System.out.println(""+section.getOrg_name());
		
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(section.getOrg_name());
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select id='bid' name='branch' style='width:220px;''>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
	
	//find class and section 06/05/2014
	@RequestMapping(value="/findclass",method=RequestMethod.GET)
	public String findroute(HttpServletRequest request,
			@RequestParam("org_name") String org_name,
			@RequestParam("branch")String branch,
			@RequestParam("class_std") String class_std,
			@RequestParam("section") String section,
			ModelMap model)
	{
		if( org_name== " " && branch== " " && class_std=="" && section=="")
		{
			ClassSectionForm classSectionForm=new ClassSectionForm();
			classSectionForm.setClassSections(classSectionDAO.get_classsection());
			model.addAttribute("classSectionForm",classSectionForm);
			
			return "view_ClassAndSection";
			
		}
		else
		{
			
			ClassSectionForm classSectionForm=new ClassSectionForm();
			classSectionForm.setClassSections(classSectionDAO.view_classsection(org_name,branch,class_std,section));
			model.addAttribute("classSectionForm",classSectionForm);
			
			ClassSectionForm classSectionForm1=new ClassSectionForm();
			classSectionForm1.setClassSections(classSectionDAO.get_classsection());
			model.addAttribute("classSectionForm1",classSectionForm1);
			
			return "view_ClassAndSection";
			
		}
	}

	// Edit Class and Section
	
	@RequestMapping(value="/editclass",method=RequestMethod.GET)
	public String editclass(HttpServletRequest request,@RequestParam("org_name") String org_name,
			@RequestParam("branch")String branch,ModelMap model)
	{
			
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		model.addAttribute("orgname_for_school",orgname_for_school);
		
		ClassSectionForm classSectionForm=new ClassSectionForm();
		classSectionForm.setClassSections(classSectionDAO.edit_classsection(org_name,branch));
		model.addAttribute("classSectionForm",classSectionForm);
		
		return "edit_class";
	}
	
	// Update Class And Section
	
	@RequestMapping(value="/updateclass",method=RequestMethod.POST)
	public String updateclass(HttpServletRequest request,@Valid ClassSection class_standard,BindingResult result,ModelMap model)
	{
		int status=classSectionDAO.update_classsection(class_standard);
		if(status==1)
		{
			ClassSectionForm classSectionForm=new ClassSectionForm();
			classSectionForm.setClassSections(classSectionDAO.get_classsection());
			model.addAttribute("classSectionForm",classSectionForm);
		}
		
		return "view_ClassAndSection";
	}
	
	// Delete Class and Section
	
	@RequestMapping(value="/delete_class", method=RequestMethod.GET)
	public String removeBus(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("class_std") String class_std,@RequestParam("section") String section,ModelMap model, Principal principal) {
	
		int status=classSectionDAO.deleteclass(org_name, branch, class_std, section);
		
		if(status==1)
		{
        
			ClassSectionForm classSectionForm=new ClassSectionForm();
			classSectionForm.setClassSections(classSectionDAO.get_classsection());
			model.addAttribute("classSectionForm",classSectionForm);
		
		}
		
		return "view_ClassAndSection";
	}
	

}