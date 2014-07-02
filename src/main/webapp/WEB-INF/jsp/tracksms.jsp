<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<script type='text/javascript' src='resources/js/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="resources/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
   <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});

	jQuery("#startDate").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate1").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#endDate").on("dp.change",function (e) {
    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate1").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	
});
});//]]>  

</script>

<style type="text/css">
        body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #report { border-collapse:collapse;}
        #report h4 { margin:0px; padding:0px;}
        #report img { float:right;}
        #report ul { margin:10px 0 10px 40px; padding:0px;}
        #report th { background:#3bb9ff url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:0px 2px; text-align:left;}
        #report td { background:#eee none repeat-x scroll center left; color:#fff; padding:0px 2px; }
        #report tr.odd td { background:#fff ;color:#666; cursor:pointer; }
        #report div.arrow { background:transparent url(resources/images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;}
        #report div.up { background-position:0px 0px;}
        
    </style>
    
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").dblclick(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script> 
    
    <script id="script_orgid">
    $(document).ready(function() {
        $("#student_roll_no_id").select2();
    });
</script>
    
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings1 altheading">
			          <h2>TRACK SMS
			        </h2>	<div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a> &nbsp;&nbsp;<a  href='tracksms' class="btn" >Back to View</a></div></div>
                        
<div style="display:none" id="div">
<div class="searchpanel">
<form action="clientsmstrack" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  
        				    <tr>
							  <td align="right" valign="middle" width="10%">Student Roll No:</td>
							   <td align="left">
							  
							   <select id="student_roll_no_id" name="student_roll_no" style="width:220px;margin-top:-4px;">
							   <option selected > -- Select Student Roll No -- </option>
							    <c:forEach items="${reportForm1.reports}" var="smsreport" varStatus="status">
							   <option value="${smsreport.student_roll_no}" <c:if test="${smsreport.student_roll_no==student_roll_no}"><c:out value="selected"></c:out></c:if> >${smsreport.student_roll_no}</option>
							    </c:forEach>
							   </select><br/><span id="rollno_error" style="color: red;"></span>
							  
							   </td>
							   <td align="right" valign="middle" width="8%">From Date:&nbsp;&nbsp;</td>
							   <td align="right">
							   <span class='input-group date' id='endDate1' >
							   <input type="text" id="fromdate" name="fromdate"   value="${from_date}" style="width:190px;" readonly/>
							   <span class="add-on" style="margin:0 0 0 0px;">
							   <img src="resources/images/date.png" width="25" height="45"/>
        					   </span></span><br/><span id="ferror" style="color: red;"></span></td>
							   <td align="right" valign="middle" width="10%">To Date:&nbsp;&nbsp;</td>
							   <td align="right">
							   <span class='input-group date' id='endDate' >
							    <input type="text" id="todate" name="todate"   value="${to_date}" style="width:190px;"readonly/>
							    <span class="add-on" style="margin:0 0 0 0px;">
							   <img src="resources/images/date.png" width="25" height="45"/>
        							</span></span><br/><span id="terror" style="color: red;"></span></td>
							    
							  <td align="center" valign="middle" width="2%">
							  <input type="submit" class="btn" value="Search" onclick="return check('this')" ></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					</div>
						
						<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img class="btn" width="25" height="27" title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>                        
                        
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="10%">Student Roll No</td>		
									<td valign="top" align="left" width="10%">Mobile Number</td>
									<td valign="top" align="left" width="10%">Date/Time</td>					
					         		<td valign="top" align="left" width="10%">Status</td>
          								
        					</tr>
        					<c:if test="${fn:length(reportForm.reports) gt 0}">
        					<c:forEach items="${reportForm.reports}" var="smsreport" varStatus="status">
        				  
        					<tr class="row1">
        					   	<td valign="top" align="left" width="10%">${smsreport.student_roll_no}</td>					
					         	<td valign="top" align="left" width="10%">${smsreport.mobile_number}</td>
          						<td valign="top" align="left" width="10%">${smsreport.sms_trigger_time }</td>
          						<td valign="top" align="left" width="10%">${smsreport.status }</td>
          							
        					</tr>
        					</c:forEach>
        					</c:if>
        					<c:if test="${fn:length(reportForm.reports) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Informations Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        					<tr>
        					<td valign="top" align="right" style="padding:20px;" colspan="6">
        					<form action="export_clientsmstrack" method="post">
        					<input type="submit" class="btn" value="Export to excel"/>
        				</form>
        					</td></tr>
        					
        					  </table>
        					
        					
        					
        					
        					</td>
        					</tr>
        					</table>
        					</div>
        					</div>
        					
      <script>
      function check(){
    	  
    	  document.getElementById("rollno_error").innerHTML="";
    	  document.getElementById("ferror").innerHTML="";
    	  document.getElementById("terror").innerHTML="";
    	  
    	  if(document.getElementById("student_roll_no_id").value==''){
    		  document.getElementById("rollno_error").innerHTML="Choose Student Roll No";
    		  return false;
    	  }
    	  if(document.getElementById("fromdate").value==''){
    		  document.getElementById("ferror").innerHTML="Choose From Date";
    		  return false;
    	  }
    	  if(document.getElementById("todate").value==''){
    		  document.getElementById("terror").innerHTML="Choose To Date";
    		  return false;
    	  }
      }
      </script>                  
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
			    

