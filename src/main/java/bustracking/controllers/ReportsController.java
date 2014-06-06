package bustracking.controllers;


import java.util.*;
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

import bustracking.dao.BusRegistrationDAO;
import bustracking.dao.MainDAO;
import bustracking.dao.ReportsDAO;

import bustracking.forms.ReportForm;
import bustracking.model.Report;



@Controller

public class ReportsController{
	
	
	@Autowired
	BusRegistrationDAO busDAO;
	
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	ReportsDAO reportsDAO;

	
	// Admin Side Reports For SMS
	
		@RequestMapping(value="/admin_reports", method=RequestMethod.GET)
		public String adminreports(ModelMap model) {
			
			List <String> orgname_for_school=new ArrayList<String>();
			orgname_for_school=busDAO.getorgname_for_school();
			model.addAttribute("orgname_for_school",orgname_for_school);
			
			return "admin_reports";
		}
	
		@RequestMapping(value="/tracksms", method = RequestMethod.GET)
		public String clienttracksms(HttpServletRequest request,ModelMap model, Principal principal ) {
			
			ReportForm reportForm=new ReportForm();
			reportForm.setReports(reportsDAO.getTracksmsreport(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("reportForm",reportForm);
			return "tracksms";
		}
		


		@RequestMapping(value="/clientdriverlistreport",method=RequestMethod.GET)
		public String Driverreport(ModelMap model,Principal principal){
		
		
		
			return "client_driverlist_report";
		}
	
	
		@RequestMapping(value="/clientpickupreport", method = RequestMethod.GET)
		public String client_pickup_report(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
			return "client_pickup_report";
		}
	



		@RequestMapping(value="/clientdropreport", method = RequestMethod.GET)
		public String clientdropreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
			return "client_drop_report";
		}
	
	
		@RequestMapping(value="/clientoverspeedingreport", method = RequestMethod.GET)
		public String clientoverspeedingreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
			return "client_overspeeding_report";
		}
	
}