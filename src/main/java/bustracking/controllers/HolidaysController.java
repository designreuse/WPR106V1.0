package bustracking.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.lang.*;
import javax.servlet.http.*;



import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import bustracking.dao.HolidaysDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.OrgRegistrationForm;
import bustracking.model.Holidays;
import bustracking.dao.BusRegistrationDAO;

@Controller
public class HolidaysController{
	
	@Autowired
	 HolidaysDAO holidaysDAO;
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired
	BusRegistrationDAO busDAO;
	
	@RequestMapping(value="/holidayadmin",method=RequestMethod.GET)
	
	public String holidayadmin(HttpServletRequest request,ModelMap model, Principal principal ) {
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);
			
			List <String> orgname_for_school=new ArrayList<String>();
			orgname_for_school=busDAO.getorgname_for_school();
			model.addAttribute("orgname_for_school",orgname_for_school);
			
			return "holidayAdmin";
	}
	
	@RequestMapping(value="/insert_holidays",method=RequestMethod.POST)
	public String insert_holidays(HttpServletRequest request,Holidays holidays,ModelMap model,Principal principal){
		
		holidays.setOrg_id(orgRegistrationDAO.getOrg_id(request.getParameter("org_name"), request.getParameter("branch")));
		
		DateTimeFormatter df=DateTimeFormat.forPattern("mm dd yyyy");
		
		DateTime Fromdate=df.parseDateTime(request.getParameter(""));
		DateTime Todate=df.parseDateTime(request.getParameter(""));
		
		int no_of_days=Days.daysBetween(new LocalDate(Fromdate),new LocalDate(Todate)).getDays();
		System.out.println(no_of_days); 
		
		for(int i=0;i<=no_of_days;i++)
		{
			holidays.setHoliday_date(request.getParameter("holiday_date"));
			holidays.setHoliday_reason(request.getParameter("holiday_reason"));
		}
		
		return "holidayAdmin";
	}
	
}