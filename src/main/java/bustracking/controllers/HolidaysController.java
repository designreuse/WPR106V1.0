package bustracking.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.lang.*;
import javax.servlet.http.*;
import javax.validation.Valid;



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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import bustracking.dao.HolidaysDAO;
import bustracking.dao.MainDAO;
import bustracking.dao.OrgRegistrationDAO;
import bustracking.forms.HolidaysForm;
import bustracking.forms.OrgBusinessRuleForm;
import bustracking.forms.OrgRegistrationForm;
import bustracking.model.Holidays;
import bustracking.dao.BusRegistrationDAO;

@Controller
@SessionAttributes({"holi","branch"})
public class HolidaysController{
	
	@Autowired
	 HolidaysDAO holidaysDAO;
	
	@Autowired
	OrgRegistrationDAO orgRegistrationDAO;
	
	@Autowired
	BusRegistrationDAO busDAO;
	
	@Autowired
	MainDAO mainDAO;
	
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
	
	// Insert Holidays admin side
	
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
				
		HolidaysForm holidaysForm=new HolidaysForm();
		holidaysForm.setHolidaysForms(holidaysDAO.getHolidays());
		model.addAttribute("holidaysForm",holidaysForm);
		
		
		return "view_holidays";
	}
	
	
	// Number of Days Between Dates
	
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
	
	   // View Holidays Information
	   
	   @RequestMapping(value="/holidayviewadmin", method=RequestMethod.GET)
		public String view_holidays(ModelMap model, Principal principal){
			
			HolidaysForm holidaysForm=new HolidaysForm();
			holidaysForm.setHolidaysForms(holidaysDAO.getHolidays());
			model.addAttribute("holidaysForm",holidaysForm);
			
			HolidaysForm holidaysForm1=new HolidaysForm();
			holidaysForm1.setHolidaysForms(holidaysDAO.getHolidays());
			model.addAttribute("holidaysForm1",holidaysForm1);
			   
			return "view_holidays";
		}
	   
	   
	   // Find Holidays
	   
	   @RequestMapping(value="/findholidays",method=RequestMethod.GET)
	   public String find_holidays(@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("holiday_date") String holiday_date,ModelMap model,Principal principal){
		   
		   
		   if(org_name=="" && branch=="" && holiday_date=="")
		   {
			   HolidaysForm holidaysForm=new HolidaysForm();
				holidaysForm.setHolidaysForms(holidaysDAO.getHolidays());
				model.addAttribute("holidaysForm",holidaysForm);
				
				return "view_holidays";
		   }
		   else{
			
		   HolidaysForm holidaysForm1=new HolidaysForm();
		   holidaysForm1.setHolidaysForms(holidaysDAO.getHolidays());
		   model.addAttribute("holidaysForm1",holidaysForm1);
			   
		   HolidaysForm holidaysForm=new HolidaysForm();
		   holidaysForm.setHolidaysForms(holidaysDAO.findHolidays(org_name, branch, holiday_date));
		   model.addAttribute("holidaysForm",holidaysForm);		
		   
		   return "view_holidays";
	   
		   }
	   }
	   
	   //Delete Holidays
	   
	   @RequestMapping(value="/deleteholidays",method=RequestMethod.GET)
	   public String Delete_holidays(@RequestParam("org_name") String org_name,@RequestParam("branch") String branch,@RequestParam("holiday_date") String holiday_date,ModelMap model,Principal principal){
		   
		    int status=holidaysDAO.deleteHolidays(org_name, branch, holiday_date);
		    
		    if(status==1){
		    	HolidaysForm holidaysForm=new HolidaysForm();
				holidaysForm.setHolidaysForms(holidaysDAO.getHolidays());
				model.addAttribute("holidaysForm",holidaysForm);
		    }
		   return "view_holidays";
	   }

	// Insert Holidays client side
		
		@RequestMapping(value="/client_insert_holiday",method=RequestMethod.POST)
		public String client_insert_holidays(HttpSession session,HttpServletRequest request,@RequestParam("org_name") String org_name,@RequestParam("branch") String bid,@ModelAttribute("holidays") @Valid Holidays holidays,BindingResult result,ModelMap model,Principal principal){
			
			session.setAttribute("holi", holidays);
			session.setAttribute("org_name",org_name);
			session.setAttribute("branch",bid);
			if(result.hasErrors())
			{
				OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
				orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
				model.addAttribute("orgRegistrationForm",orgRegistrationForm);
				
				
				List <String> orgname_for_school=new ArrayList<String>();
				orgname_for_school=busDAO.getorgname_for_school();
				model.addAttribute("orgname_for_school",orgname_for_school);
				model.addAttribute("branch_array",busDAO.getBus_id(org_name));
				
				return "client_holiday";
			}
			
			OrgRegistrationForm orgRegistrationForm=new OrgRegistrationForm();
			orgRegistrationForm.setOrgregistration(orgRegistrationDAO.getOrgregistration());
			model.addAttribute("orgRegistrationForm",orgRegistrationForm);
			
			List <String> orgname_for_school=new ArrayList<String>();
			orgname_for_school=busDAO.getorgname_for_school();
			model.addAttribute("orgname_for_school",orgname_for_school);
			model.addAttribute("branch_array",busDAO.getBus_id(org_name));
			
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
					
				
			
			
			return "client_viewholidays";
		}
		
	   
	   // View Holidays in Client Side 
	   
	   @RequestMapping(value="/clientviewholiday", method=RequestMethod.GET)
		public String client_view_holidays(HttpSession session,ModelMap model, Principal principal){
			
		   session.removeAttribute("holiday_date");
			HolidaysForm holidaysForm=new HolidaysForm();
			holidaysForm.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("holidaysForm",holidaysForm);
			
			HolidaysForm holidaysForm1=new HolidaysForm();
			holidaysForm1.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("holidaysForm1",holidaysForm1);
			
			return "client_viewholidays";
		}
	   
	   // Delete Holidays in client side
	   
	   @RequestMapping(value="/clientdeleteholidays",method=RequestMethod.GET)
	   public String client_delete_holidays(@RequestParam("holiday_date") String holiday_date,ModelMap model,Principal principal){
		   
		    int status=holidaysDAO.clientdeleteHolidays(holiday_date,mainDAO.getOrg_id(principal.getName()));
		    
		    if(status==1){
		    	HolidaysForm holidaysForm=new HolidaysForm();
				holidaysForm.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("holidaysForm",holidaysForm);
		    }
		   return "client_viewholidays";
	   }

	   // Find Holidays in client side
	   
	   @RequestMapping(value="/clientfindholidays",method=RequestMethod.GET)
	   public String Client_find_holidays(HttpSession session,@RequestParam("holiday_date") String holiday_date,ModelMap model,Principal principal){
		   
		   session.setAttribute("holiday_date", holiday_date);
		   if(holiday_date=="")
		   {
			   HolidaysForm holidaysForm=new HolidaysForm();
				holidaysForm.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("holidaysForm",holidaysForm);
				
				HolidaysForm holidaysForm1=new HolidaysForm();
				holidaysForm1.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
				model.addAttribute("holidaysForm1",holidaysForm1);
				
				return "client_viewholidays";
		   }
		   else{
			
		   HolidaysForm holidaysForm=new HolidaysForm();
		   holidaysForm.setHolidaysForms(holidaysDAO.getHolidays_client_search(holiday_date,mainDAO.getOrg_id(principal.getName())));
		   model.addAttribute("holidaysForm",holidaysForm);
			   
		   HolidaysForm holidaysForm1=new HolidaysForm();
			holidaysForm1.setHolidaysForms(holidaysDAO.getHolidays_client(mainDAO.getOrg_id(principal.getName())));
			model.addAttribute("holidaysForm1",holidaysForm1);
		   
		   return "client_viewholidays";
	   
		   }
	   }
}