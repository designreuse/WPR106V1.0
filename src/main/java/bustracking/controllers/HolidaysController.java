package bustracking.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.lang.*;
import javax.servlet.http.*;



import org.apache.commons.lang.time.DateUtils;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
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

		if(!request.getParameter("fromdate").equals("")){
			
			/*DateTimeZone kolkataTimeZone = DateTimeZone.forID( "Asia/Kolkata" );
			DateTimeFormatter df=DateTimeFormat.forPattern("dd/mm/yyyy");
			DateTime Fromdate=df.parseDateTime(request.getParameter("fromdate"));
			
			DateTime Todate=df.parseDateTime(request.getParameter("todate"));
			
			int no_of_days=Days.daysBetween(new LocalDate(Fromdate),new LocalDate(Todate)).getDays();*/
			
			int no_of_days=this.numberOfDays(request.getParameter("fromdate"),request.getParameter("todate"));
			System.out.println(no_of_days); 
		for(int i=0;i<=no_of_days;i++)
		{
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			Date date=new Date();
			try {
				date = DateUtils.addDays(formatter.parse(request.getParameter("fromdate")),i);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			holidays.setHoliday_date(formatter.format(date));
			holidays.setHoliday_reason(request.getParameter("holiday_reason"));
			holidaysDAO.insert_holiday(holidays);
			
		}
		}	
		else{	
			/*DateTimeFormatter df=DateTimeFormat.forPattern("mm-dd-yyyy");
			DateTime date=df.parseDateTime(request.getParameter("holiday_date"));*/
			
			holidays.setHoliday_date(request.getParameter("holiday_date"));
			holidays.setHoliday_reason(request.getParameter("holiday_reason"));	
			holidaysDAO.insert_holiday(holidays);
		}
				
			
		
		
		return "holidayAdmin";
	}
	
	public int numberOfDays(String fromDate,String toDate)
	   {    
	       java.util.Calendar cal1 = new java.util.GregorianCalendar();
	       java.util.Calendar cal2 = new java.util.GregorianCalendar();

	       //split year, month and days from the date using StringBuffer.
	       StringBuffer sBuffer = new StringBuffer(fromDate);
	       String yearFrom = sBuffer.substring(6,10);
	       String monFrom = sBuffer.substring(0,2);
	       String ddFrom = sBuffer.substring(3,5);
	       int intYearFrom = Integer.parseInt(yearFrom);
	       int intMonFrom = Integer.parseInt(monFrom);
	       int intDdFrom = Integer.parseInt(ddFrom);

	       // set the fromDate in java.util.Calendar
	       cal1.set(intYearFrom, intMonFrom, intDdFrom);

	       //split year, month and days from the date using StringBuffer.
	       StringBuffer sBuffer1 = new StringBuffer(toDate);
	       String yearTo = sBuffer1.substring(6,10);
	       String monTo = sBuffer1.substring(0,2);
	       String ddTo = sBuffer1.substring(3,5);
	       int intYearTo = Integer.parseInt(yearTo);
	       int intMonTo = Integer.parseInt(monTo);
	       int intDdTo = Integer.parseInt(ddTo);

	       // set the toDate in java.util.Calendar
	       cal2.set(intYearTo, intMonTo, intDdTo);

	       //call method daysBetween to get the number of days between two dates
	       int days = daysBetween(cal1.getTime(),cal2.getTime());
	       return days;
	   }

	   //This method is called by the above method numberOfDays
	   public int daysBetween(Date d1, Date d2)
	   {
	      return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
	   }
	
}