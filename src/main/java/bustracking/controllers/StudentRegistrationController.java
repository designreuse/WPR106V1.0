
package bustracking.controllers; 






import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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

import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.ClassSectionDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.dao.StudentRegistrationDAO;
import bustracking.forms.AddUserForm;
import bustracking.forms.BusDeviceRegistrationForm;
import bustracking.forms.BusRegistrationForm;
import bustracking.forms.ClassSectionForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.forms.RouteForm;
import bustracking.forms.StudentRegistrationForm;
import bustracking.model.ClassSection;
import bustracking.model.StudentRegistration;
import bustracking.dao.MainDAO;


@Controller
@SessionAttributes({"studentDetails"})
public class StudentRegistrationController {
	
	@Autowired  
	StudentRegistrationDAO studentDAO; 
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
    @Autowired
	
	BusRegistrationDAO busDAO;
	
	@Autowired
	ClassSectionDAO classSectionDAO;
	
	@Autowired
	MainDAO mainDAO;
	
	@RequestMapping(value="/studentregistration", method=RequestMethod.GET)
	public String printWelcome(HttpSession session,ModelMap model, Principal principal){
		
		session.removeAttribute("studentDetails");
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("pickup_route_no");
		session.removeAttribute("drop_route_no"); 
		session.removeAttribute("class_standard");
		session.removeAttribute("pickup_point_address");
		session.removeAttribute("drop_point_address");
		session.removeAttribute("section");
		
		
		
		/*RouteForm routeForm=new RouteForm();
		routeForm.setRoutes(studentDAO.getRouteids());
		model.addAttribute("routeForm",routeForm);
		
		BusDeviceRegistrationForme busDeviceRegistrationForm= new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(studentDAO.getbusRegistation());
		model.addAttribute("busDeviceRegistrationForm", busDeviceRegistrationForm);
		
		*/
		
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		
		ClassSectionForm classSectionForm=new ClassSectionForm();
		classSectionForm.setClassSections(classSectionDAO.get_classsection());
		model.addAttribute("classSectionForm",classSectionForm);
		
		model.addAttribute("registration_no",studentDAO.getMax_StudentReg());
		StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
		studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
		model.addAttribute("studentregistrationform",studentregistrationform);
		
		List <String> orgname_for_school=new ArrayList<String>();
		orgname_for_school=busDAO.getorgname_for_school();
		model.addAttribute("orgname_for_school",orgname_for_school);
		
		
	return "add_student_registration";
	}
	
	@RequestMapping(value="/stud_ajax",method=RequestMethod.POST)
	public @ResponseBody String bus_reg(@RequestParam("org_name") String org_name,ModelMap model) {
	
		String returnText="";
		List <String> branch=new ArrayList<String>();
		branch=busDAO.getBus_id(org_name);
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#bid').select2(); });</script><select name='branch' id='bid' onchange='doAjaxPost1()' style='width:220px' >";
		returnText+="<option value='' selected>--Select Branch--</option>";
		for(String bname:branch)
		{
			returnText+="<option value='"+bname+"'>"+bname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
	return returnText;
	}
	
	@RequestMapping(value="/stud_route_ajax",method=RequestMethod.POST)
	public @ResponseBody String sr_reg(@RequestParam("org_name") String org_name, @RequestParam("branch") String branch ,ModelMap model) {
		
		String returnText="";
		List<String> studroute=new ArrayList<String>();
		List<String> studclass=new ArrayList<String>();
		
		studroute=studentDAO.getStud_route(org_name,branch);
		
		returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#pickup_route_id').select2(); });</script><select name='pickup_route_no' id='pickup_route_id'  onchange='doAjaxPost_pickup_route_no()' style='width:220px'>";
		returnText+="<option value='' selected>--Select Pickup Route No--</option>";
		
		for(String sr:studroute)
		{
			returnText+="<option value='"+sr+"'>"+sr+"</option>";
			}			
		  
	   returnText=returnText+"</select>";
	   

	   returnText=returnText+"<split>";
	   
	   returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#drop_route_id').select2(); });</script><select name='drop_route_no' id='drop_route_id'  onchange='doAjaxPost_drop_route_no()' style='width:220px'>";
 		returnText+="<option value='' selected>--Select Drop Route No--</option>";
		
		for(String sr:studroute)
		{
			returnText+="<option value='"+sr+"'>"+sr+"</option>";
			}			
		  
	   returnText=returnText+"</select>";
	   
	   
	   
	   returnText=returnText+"<split>";
	   
	   studclass=studentDAO.getStud_class(org_name, branch);
	 
	   returnText=returnText+"<script id='script_bid'>$(document).ready(function() { $('#class_standard_id').select2(); });</script><select name='class_standard' id='class_standard_id' onchange='doAjaxPost_section()' style='width:220px'>";
		returnText+="<option value='' selected>--Select Class--</option>";
		
		for(String srclass:studclass)
		{
			returnText+="<option value='"+srclass+"'>"+srclass+"</option>";
			}			
		  
	   returnText=returnText+"</select>";
	    
	   System.out.println(returnText);
	   
	 return returnText;
	
	}
	
	//Get Student Section corresponding to class
	
	@RequestMapping(value="/stud_section_ajax",method=RequestMethod.POST)
	public @ResponseBody String section(@RequestParam("org_name") String org_name, @RequestParam("branch") String branch, @RequestParam("class_standard") String class_standard, ModelMap model) {
	
		System.out.println("comnming");
		System.out.println(class_standard);
		String returnText="";
		List<String> studsection=new ArrayList<String>();
		studsection=studentDAO.getStud_section(org_name, branch, class_standard);
		
		returnText=returnText+"<script id='script_section_id'>$(document).ready(function() { $('#section_id').select2(); });</script><select name='section' id='section_id' style='width:220px'>";
		returnText+="<option value='' selected>--Select Section--</option>";
		for(String section:studsection)
		{
			returnText+="<option value='"+section+"'>"+section+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
	return returnText;
	}
	
	// get pickup location of student
	
	@RequestMapping(value="/pickup_route_no_ajax",method=RequestMethod.POST)
	public @ResponseBody String pickup_location(@RequestParam("pickup_route_no") String pickup_route_no,ModelMap model) {
	
		String returnText="";
		List <String> pickup_location=new ArrayList<String>();
		pickup_location=busDAO.getPickupStop_location(pickup_route_no);
		
		returnText=returnText+"<script id='script_section_id'>$(document).ready(function() { $('#pickup_location_id').select2(); });</script><select name='pickup_point_address' id='pickup_location_id' style='width:220px'>";
		returnText+="<option value='' selected>--Select PickUp Location--</option>";
		for(String pickup_locationname:pickup_location)
		{
			returnText+="<option value='"+pickup_locationname+"'>"+pickup_locationname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
	return returnText;
	}
	
	// get drop location of student
	
	@RequestMapping(value="/drop_route_no_ajax",method=RequestMethod.POST)
	public @ResponseBody String drop_location(@RequestParam("drop_route_no") String drop_route_no,ModelMap model) {
	
		String returnText="";
		List <String> drop_location=new ArrayList<String>();
		drop_location=busDAO.getDropStop_location(drop_route_no);
		
		returnText=returnText+"<script id='script_section_id'>$(document).ready(function() { $('#drop_location_id').select2(); });</script><select name='drop_point_address' id='drop_location_id' style='width:220px'>";
		returnText+="<option value='' selected>--Select Drop Location--</option>";
		for(String drop_locationname:drop_location)
		{
			returnText+="<option value='"+drop_locationname+"'>"+drop_locationname+"</option>";
			}			
		  
	   returnText=returnText+"</select>";	
	   System.out.println(returnText);
	return returnText;
	}
	
	
	@RequestMapping(value="/studentregistration", method=RequestMethod.POST)
	public String addstudent(HttpServletRequest request,HttpSession session,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("pickup_route_no") String pickup_route_no,@RequestParam("drop_route_no") String drop_route_no,@RequestParam("class_standard") String class_standard,@RequestParam("pickup_point_address") String pickup_point_address,@RequestParam("drop_point_address") String drop_point_address,@RequestParam("section") String section,@ModelAttribute("student") @Valid StudentRegistration student,BindingResult result,ModelMap model,Principal principal)
	{
		session.setAttribute("studentDetails",student);
		session.setAttribute("org_name", org_name);
		session.setAttribute("branch", branch);
		session.setAttribute("pickup_route_no", pickup_route_no);
		session.setAttribute("drop_route_no", drop_route_no);
		session.setAttribute("class_standard", class_standard);
		session.setAttribute("pickup_point_address", pickup_point_address);
		session.setAttribute("drop_point_address", drop_point_address);
		session.setAttribute("section", section);
		
		
		/*RouteForm routeForm=new RouteForm();
		routeForm.setRoutes(studentDAO.getRouteids());
		model.addAttribute("routeForm",routeForm);
		
		BusDeviceRegistrationForm busDeviceRegistrationForm= new BusDeviceRegistrationForm();
		busDeviceRegistrationForm.setBusDeviceRegistrations(studentDAO.getbusRegistation());
		model.addAttribute("busDeviceRegistrationForm", busDeviceRegistrationForm);*/
		
		
		student.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"),request.getParameter("branch")));
		/*OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);*/
		
		if(result.hasErrors())
		{
			
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);
			
			
			ClassSectionForm classSectionForm=new ClassSectionForm();
			classSectionForm.setClassSections(classSectionDAO.get_classsection());
			model.addAttribute("classSectionForm",classSectionForm);
			
			model.addAttribute("registration_no",studentDAO.getMax_StudentReg());
			StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
			studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform",studentregistrationform);
			
			List <String> orgname_for_school=new ArrayList<String>();
			orgname_for_school=busDAO.getorgname_for_school();
			model.addAttribute("orgname_for_school",orgname_for_school);
			model.addAttribute("branch_array",busDAO.getBus_id(org_name));
			model.addAttribute("pickup_array",studentDAO.getStud_route(org_name, branch));
			model.addAttribute("drop_array",studentDAO.getStud_route(org_name, branch));
			model.addAttribute("class_array",studentDAO.getStud_class(org_name, branch));
			model.addAttribute("pickup_address_array",busDAO.getPickupStop_location(pickup_route_no));
			model.addAttribute("drop_address_array",busDAO.getDropStop_location(drop_route_no));
			model.addAttribute("section_array",studentDAO.getStud_section(org_name, branch, class_standard));
			
			model.addAttribute("registration_no",studentDAO.getMax_StudentReg());
			
			return "add_student_registration";
		}
		else
		{
			
			studentDAO.setstudentregistration(student,principal);
			
			StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
			studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform",studentregistrationform);
			
			
			StudentRegistrationForm studentregistrationform1 = new StudentRegistrationForm();
	        studentregistrationform1.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform1", studentregistrationform1);
			
		    System.out.println("name"+request.getParameter("org_name"));
		    System.out.println("branch"+request.getParameter("branch"));
			return "view_student_details";
		}
	}
	
	@RequestMapping(value="/viewstudent", method=RequestMethod.GET)
	public String viewstudent(HttpSession session,ModelMap model, Principal principal) {
	
		session.removeAttribute("org_name");
		session.removeAttribute("branch");
		session.removeAttribute("student_roll_no");
		session.removeAttribute("first_name");
		session.removeAttribute("last_name");
		
		
		StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
		studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
		model.addAttribute("studentregistrationform",studentregistrationform);
		
		StudentRegistrationForm studentregistrationform1 = new StudentRegistrationForm();
        studentregistrationform1.setStudentregistration(studentDAO.getstudentregistration());
		model.addAttribute("studentregistrationform1", studentregistrationform1);
		
		return "view_student_details";
	}
	
	// Edit Controller for Admin Side 
	
	@RequestMapping(value="/edit_student", method=RequestMethod.GET)
	public String editStudent(HttpServletRequest request,@RequestParam("student_roll_no")String student_roll_no,@RequestParam("org_name")String org_name,@RequestParam("branch")String branch,ModelMap model,StudentRegistration studentRegistration)
	{
		OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
		orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
		model.addAttribute("orgRegistrationForm",orgRegistrationForm);
		
		StudentRegistrationForm studentRegistrationForm=new StudentRegistrationForm();
		studentRegistrationForm.setStudentregistration(studentDAO.getStudent_for_edit(student_roll_no));
		model.addAttribute("studentRegistrationForm",studentRegistrationForm);
		
		List <String> class_std=new ArrayList<String>();
		class_std=classSectionDAO.getclass_for_edit(org_name, branch);
		model.addAttribute("class_std",class_std);
		
		List <String> route_no=new ArrayList<String>();
		route_no=busDAO.getBusRegistrations_route_no(org_name, branch);
		model.addAttribute("route_no",route_no);
		
		return "edit_student";
	}
	
	//Update operation for Student Admin side
	
	@RequestMapping(value="/update_student", method=RequestMethod.POST)
	public String updatestudent(HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("student_roll_no") String student_roll_no,@ModelAttribute("studentRegistration") @Valid StudentRegistration studentRegistration,
			BindingResult result,ModelMap model,Principal principal)
	{
	
		
		if(result.hasErrors()){
			
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);
			
			StudentRegistrationForm studentRegistrationForm=new StudentRegistrationForm();
			studentRegistrationForm.setStudentregistration(studentDAO.getStudent_for_edit(student_roll_no));
			model.addAttribute("studentRegistrationForm",studentRegistrationForm);
			
			List <String> class_std=new ArrayList<String>();
			class_std=classSectionDAO.getclass_for_edit(org_name, branch);
			model.addAttribute("class_std",class_std);
			
			List <String> route_no=new ArrayList<String>();
			route_no=busDAO.getBusRegistrations_route_no(org_name, branch);
			model.addAttribute("route_no",route_no);
			
			return "edit_student";
		
		}
		
		//System.out.println("student_reg_no"+studentRegistration.getStudent_reg_no());
		int status =studentDAO.adminupdateStudent(studentRegistration);
		System.out.println(status);
		if(status==1){
			StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
			studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform",studentregistrationform);
			
			StudentRegistrationForm studentregistrationform1 = new StudentRegistrationForm();
	        studentregistrationform1.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform1", studentregistrationform1);
		}
		
		return "view_student_details";
		
	}
	
	// Delete Student Admin Side
	
	@RequestMapping(value="/delete_student", method=RequestMethod.GET)
	public String removeStudent(@RequestParam("student_roll_no") String student_roll_no,ModelMap model, Principal principal) {
	
		int status=studentDAO.deleteStudent(student_roll_no);
		
		if(status==1)
		{
       
		
        StudentRegistrationForm studentregistrationform= new StudentRegistrationForm();
		studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
		model.addAttribute("studentregistrationform",studentregistrationform);
		}
		
		return "view_student_details";
	}
	
	// Search student in Admin side.
	@RequestMapping(value="/findstudents",method=RequestMethod.GET)
	public String findstudents(HttpSession session,HttpServletRequest request,
			@RequestParam("org_name") String org_name,
			@RequestParam("branch") String branch,
			@RequestParam("student_roll_no") String student_roll_no,
			@RequestParam("first_name") String first_name,
			@RequestParam("last_name") String last_name,ModelMap model)
	{
		session.setAttribute("org_name", org_name);
		session.setAttribute("branch", branch);
		session.setAttribute("student_roll_no", student_roll_no);
		session.setAttribute("first_name", first_name);
		session.setAttribute("last_name", last_name);
		
		if(org_name=="" && branch=="" && student_roll_no=="" && first_name=="" && last_name=="")
		{
			StudentRegistrationForm studentregistrationform = new StudentRegistrationForm();
	        studentregistrationform.setStudentregistration(studentDAO.getstudentregistration());
			model.addAttribute("studentregistrationform", studentregistrationform);
			
			return "view_student_details";
		}
		else
		{
			
		StudentRegistrationForm studentregistrationform = new StudentRegistrationForm();
        studentregistrationform.setStudentregistration(studentDAO.findStudent(org_name,branch,student_roll_no,first_name,last_name));
		model.addAttribute("studentregistrationform", studentregistrationform);
       
		StudentRegistrationForm studentregistrationform1 = new StudentRegistrationForm();
        studentregistrationform1.setStudentregistration(studentDAO.getstudentregistration());
		model.addAttribute("studentregistrationform1", studentregistrationform1);
        
		return "view_student_details";
		}
		
	}

		
	
	@RequestMapping(value="/search_student_details", method=RequestMethod.GET)
	public String searchdetails(HttpServletRequest request,@RequestParam("student_roll_no") String student_roll_no,ModelMap model,StudentRegistration studentRegistration,Principal principal)
	{
		
		
        StudentRegistrationForm studentregistrationform = new StudentRegistrationForm();
	
		//busRegistrationForm.setBusregistration(busDAO.getBus_id(bus_id));
		studentregistrationform.setStudentregistration(studentDAO.getStudent_roll_no(student_roll_no,mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("studentregistrationform", studentregistrationform);
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		
		return "search_student_details";
	}
	
//client Side find student
	
	@RequestMapping(value="/findstudentsclient",method=RequestMethod.GET)
	public String findstudentsclient(HttpSession session,HttpServletRequest request,
			@RequestParam("student_roll_no") String student_roll_no,
			@RequestParam("first_name") String first_name,
			@RequestParam("last_name") String last_name,
			@RequestParam("parent_mobile1") String parent_mobile1,
			ModelMap model, Principal principal)
	{
		
		session.setAttribute("student_roll_no", student_roll_no);
		session.setAttribute("first_name", first_name);
		session.setAttribute("last_name", last_name);
		session.setAttribute("parent_mobile1", parent_mobile1);
		
		if(student_roll_no=="" && first_name=="" && last_name=="" && parent_mobile1=="")
		{
			StudentRegistrationForm studentRegistrationForm1=new StudentRegistrationForm();
			studentRegistrationForm1.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("studentRegistrationForm1",studentRegistrationForm1);
			
			return "client_view_student";
		}
		else
		{
			
		StudentRegistrationForm studentRegistrationForm = new StudentRegistrationForm();
		studentRegistrationForm.setStudentregistration(studentDAO.findStudent_by_org_id_client(mainDAO.getOrg_id(principal.getName()),student_roll_no,first_name,last_name,parent_mobile1));
		model.addAttribute("studentRegistrationForm", studentRegistrationForm);
       
		StudentRegistrationForm studentRegistrationForm1=new StudentRegistrationForm();
		studentRegistrationForm1.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("studentRegistrationForm1",studentRegistrationForm1);
        
		return "client_view_student";
		}
		
	}
	
	@RequestMapping(value="/load_class", method=RequestMethod.POST)
	public  @ResponseBody String load_class(HttpServletRequest request,@RequestParam("org_id") int org_id,ModelMap model,StudentRegistration studentRegistration)
	{
		List<ClassSection> classSections=new ArrayList<ClassSection>();
		
		classSections=classSectionDAO.get_classsection();
		String return_html="";
		return_html="<select name='class_std'>";
		for (ClassSection classSection : classSections)
		{
			return_html=return_html+"<option value='"+classSection.getClass_std()+"'>'"+classSection.getClass_std()+"'</options>";
		}
		return_html=return_html+"</select>";
		return return_html;
      
	}
	
	//Get Student information for Client Side 
	
	@RequestMapping(value="/clientviewstudent", method = RequestMethod.GET)
	public String clientviewstudent(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		session.removeAttribute("student_roll_no");
		session.removeAttribute("first_name");
		session.removeAttribute("last_name");
		session.removeAttribute("parent_mobile1");
		
		StudentRegistrationForm studentRegistrationForm=new StudentRegistrationForm();
		studentRegistrationForm.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("studentRegistrationForm",studentRegistrationForm);
		
		StudentRegistrationForm studentRegistrationForm1=new StudentRegistrationForm();
		studentRegistrationForm1.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
		model.addAttribute("studentRegistrationForm1",studentRegistrationForm1);
		
		return "client_view_student";
	}

	// Edit Student Information In Client Side 
	@RequestMapping(value="/client_edit_student", method=RequestMethod.GET)
	public String clienteditStudent(HttpServletRequest request,@RequestParam("student_roll_no") String student_roll_no,@RequestParam("pickup_route_no") String pickup_route_no,@RequestParam("drop_route_no") String drop_route_no,ModelMap model,Principal principal)
	{
		
		
		
		StudentRegistrationForm studentregistrationform = new StudentRegistrationForm();
		studentregistrationform.setStudentregistration(studentDAO.getStudent_roll_no(student_roll_no,mainDAO.getOrg_id(principal.getName())));
 		model.addAttribute("studentregistrationform", studentregistrationform);
 		
 		List <String> route_no=new ArrayList<String>();
		route_no=busDAO.getStudent_route_no(mainDAO.getOrg_id(principal.getName()));
		model.addAttribute("route_no",route_no);
		
		model.addAttribute("pickup_route_location",busDAO.getPickupStop_location(pickup_route_no));
		model.addAttribute("drop_route_location",busDAO.getDropStop_location(drop_route_no));
		
		return "client_edit_student";
	
		
		}
	
	//Client Side Update
	
	@RequestMapping(value="/client_update_student", method=RequestMethod.POST)
	public String clientupdatestudent(HttpServletRequest request,@RequestParam("student_roll_no") String student_roll_no,@ModelAttribute("studentRegistration") @Valid StudentRegistration studentRegistration,
			BindingResult result,ModelMap model,Principal principal)
	{
		if(result.hasErrors())
		{
			
			StudentRegistrationForm studentregistrationform = new StudentRegistrationForm();
			studentregistrationform.setStudentregistration(studentDAO.getStudent_roll_no(student_roll_no,mainDAO.getOrg_id(principal.getName())));
	 		model.addAttribute("studentregistrationform", studentregistrationform);
	 		
	 		List <String> route_no=new ArrayList<String>();
			route_no=busDAO.getStudent_route_no(mainDAO.getOrg_id(principal.getName()));
			model.addAttribute("route_no",route_no);
			
			return "client_edit_student";
			
		}
		else{
	
		int status =studentDAO.clientupdateStudent(studentRegistration,mainDAO.getOrg_id(principal.getName()));
		System.out.println(status);
		if(status==1){
			StudentRegistrationForm studentRegistrationForm=new StudentRegistrationForm();
			studentRegistrationForm.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("studentRegistrationForm",studentRegistrationForm);
		
			StudentRegistrationForm studentRegistrationForm1=new StudentRegistrationForm();
			studentRegistrationForm1.setStudentregistration(studentDAO.getStudentRegistration_by_org_id(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("studentRegistrationForm1",studentRegistrationForm1);
		}
		
		
		return "client_view_student";
	}
	}
	
}
