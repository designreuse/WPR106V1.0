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
import org.springframework.web.bind.annotation.SessionAttributes;

import bustracking.dao.ClassSectionDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.ClassSectionForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.model.AddUser;
import bustracking.model.ClassSection;
import bustracking.model.BusRegistration;
import bustracking.forms.BusRegistrationForm;
import bustracking.dao.BusRegistrationDAO;

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
		
		returnText=returnText+"<select id='bid' name='branch' class='org_input_cmbbx'>";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";		 
	return returnText;
	}
	
}