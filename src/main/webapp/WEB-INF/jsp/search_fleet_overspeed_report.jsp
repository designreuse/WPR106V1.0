<html><head><%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
 <script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
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

</script></head>
<body>
<jsp:include page="fleet_header.jsp"></jsp:include>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table_fleet"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading" style="width:100%">
			          <h2>Over Speed Report </h2>
			        </div>
			        <div class="contentbox" style="width:100%">
			     <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
          						<td valign="top" align="right" width="100%">
          						 <div class="report_table" style="height:700px;">


<div id="content" style="height:800px;"> 

    
    
     <form method="GET" action="searchfleetoverspeedreport">
    
    <table width="100%" cellpadding="2" cellspacing="0" border="0"  class="margin_table_fleet" >
    <tr>
   <td valign="middle" width="15%"><span class="err">*</span>&nbsp;Vehicle Number :</td>
   <td  valign="middle" style="padding-top: 5px;"> <select id="e3" style="width:250px;" name="vechicle_reg_no">
							 	<option selected value=""> -- Select Vehicle No -- </option>     
							    <c:forEach items="${reportForm1.reports}" var="clientoverspeedreport1" varStatus="status">
							    <option value="${clientoverspeedreport1.vechicle_reg_no}"<c:if test="${clientoverspeedreport1.vechicle_reg_no==vechicle_reg_no}"><c:out value="selected"></c:out></c:if> >${clientoverspeedreport1.vechicle_reg_no}</option>
							    </c:forEach>
							    </select>
							    </td>
							    <td align="left" width="60%"><span id="vechicle_error" style="color: red;align:center;"></span></td>
							    </tr></table>
<table width="100%" cellpadding="2" cellspacing="0" border="0" >
    							    
  <tr>
    <td valign="middle" width="15%"><span class="err">*</span>&nbsp;Date From :</td>
    <td valign="middle" style="padding-top: 10px;" width="18%">
                                   <div class='input-group date' id='endDate' >
												<input type="text" id="fromdate"	name="from_date" value="${from_date}"  style="height:24px;width:150px;float:left;" readonly="readonly"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="25"/>
        										</span>
        										
					</div>
					</td>
					<td align="left" width="16%"><span id="fdateerror" style="color: red;"></span></td>
    <td align="center" width="13%"><span class="err">*</span>&nbsp;Time From :&nbsp;</td>
    						<td valign="middle" style="padding-top: 10px;"  width="18%">		<div class='input-group date' id='startDate' >
												<input type="text" id="fromtime" value="${from_time}"  name="from_time"  style="height:24px;width:150px;float:left;" readonly="readonly"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/clock.png" width="25" height="25"/>
        										</span>
		
					</div>
					<td width="16%"><span id="ftimeerror" style="color: red;"></span></td></td>
					<td width="12%"></td>
	</tr>
	
	</table>
	<table width="100%" cellpadding="2" cellspacing="0" border="0" class="margin_table_fleet">
	<tr><td valign="middle" width="15%"><span class="err">*</span>&nbsp;Date To :</td>
							<td valign="middle" style="padding-top: 10px;"  width="18%">			<div class='input-group date' id='endDate1' >
												<input type="text" id="todate"	name="to_date" value="${to_date}" style="height:24px; width:150px;float:left;" readonly="readonly"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="45"/>
        										</span>
					</div></td>
					<td align="left" width="15%"><span id="tdateerror" style="color: red;"></span></td>
	<td align="center" width="14%"><span class="err">*</span>&nbsp;Time To :&nbsp;&nbsp;&nbsp;</td>
	<td style="padding-top: 10px;"  width="18%">
									<div class='input-group date' id='startDate1' >
												<input type="text" id="totime"	name="to_time" value="${to_time}" style="height:24px;width:150px;float:left;" readonly="readonly" />
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/clock.png" width="25" height="25"/>
        										</span>
					</div>	</td>
					<td width="13%"><span id="ttimeerror" style="color: red;"></span></td>
					<td align="right"><input type="submit" class="btn" value="Search" onclick="return check('this')"></td>
					</tr>
					
    </table>
    </form>
    
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="margin_table_fleet">
    <tr><td align="left" width="30%">
    <div class="report_table_innertop" id="printMe">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
    <tr><td class="report_side_table" align="center" width="25%">Driver Name</td><td class="report_side_table" align="center" width="25%">Vehicle Number</td><td class="report_side_table" align="center" width="25%">Route No</td><td  align="center" class="report_side_table" width="25%">Over Speed Count</td></tr></table>
    <div class="report_table_inner">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
    <c:if test="${fn:length(reportForm.reports) gt 0}">
   <c:forEach items="${reportForm.reports}" var="clientoverspeedreport">
    <tr><td align="center" width="25%">${clientoverspeedreport.driver_name}</td><td align="center" width="25%">${clientoverspeedreport.vechicle_reg_no}</td><td align="center" width="25%">${clientoverspeedreport.route_no}</td><td align="center" width="25%">${clientoverspeedreport.over_speed_count}</td></tr>
    </c:forEach>
    </c:if>
    <c:if test="${fn:length(reportForm.reports) == 0}">	
	<tr class="row1">
	<td colspan="7" width="100%"><center><b>No Informations Found!!!</b></center></td>
	</tr>
  </c:if>
    </table></div></div>
    </td>
   
    </tr>
    <tr><td align="right"><br>
    <table width="40%"cellpadding="2" cellspacing="0" border="0" style="margin:0 0 0 61%;">
    <tr>
    
    <td align="right">
   	<span id="info">
   	<input type="hidden" value=""/>
   	<input type="hidden" value=""/>
   	<input type="hidden" value=""/>
   	<input type="hidden" value=""/>
   	<input type="hidden" value=""/>
   	</span>
    <input type="submit" class="btn" value="Export to Excel" onclick="window.location.href='export_overspeedreport?vechicle_reg_no=${vechicle_reg_no}&from_date=${from_date}&from_time=${from_time}&to_date=${to_date}&to_time=${to_time}'"></td>
    
    </tr>
    
    </table>
    </td></tr>
    
    </table>
   

</div></div></td>
        					</tr> </table></div>
        				</td>
        				</tr>
        				</table>

<script>
$(document).ready(function() {
    $("#content").find("[id^='tab']").hide(); // Hide all content
    $("#tabs li:first").attr("id","current"); // Activate the first tab
    $("#content #tab1").fadeIn(); // Show first tab's content
    
    $('#tabs a').click(function(e) {
        e.preventDefault();
        if ($(this).closest("li").attr("id") == "current"){ //detection for current tab
         return;       
        }
        else{             
          $("#content").find("[id^='tab']").hide(); // Hide all content
          $("#tabs li").attr("id",""); //Reset id's
          $(this).parent().attr("id","current"); // Activate this
          $('#' + $(this).attr('name')).fadeIn(); // Show content for the current tab
        }
    });
});
</script>

<script>
function check(){
	document.getElementById("vechicle_error").innerHTML="";
	document.getElementById("fdateerror").innerHTML="";
	document.getElementById("ftimeerror").innerHTML="";
	document.getElementById("tdateerror").innerHTML="";
	document.getElementById("ttimeerror").innerHTML="";
	
	if(document.getElementById("e3").value=='')
	{
	document.getElementById("vechicle_error").innerHTML="Kindly Select Vechicle No";
	return false;
	}
	if(document.getElementById("fromdate").value =='')
	{
	document.getElementById("fdateerror").innerHTML="Kindly Select From Date";
	return false;
	}
	if(document.getElementById("fromtime").value =='')
	{
	document.getElementById("ftimeerror").innerHTML="Kindly Select From Time";
	return false;
	}
	if(document.getElementById("todate").value =='')
	{
	document.getElementById("tdateerror").innerHTML="Kindly Select To Date";
	return false;
	}
	if(document.getElementById("totime").value =='')
	{
	document.getElementById("ttimeerror").innerHTML="Kindly Select To Time";
	return false;
	}
}




</script>
<jsp:include page="footer.jsp"></jsp:include>

<script language="javascript">
    var gAutoPrint = true;

    function processPrint(){

    if (document.getElementById != null){
    var html = '<HTML>\n<HEAD>\n';
    if (document.getElementsByTagName != null){
    var headTags = document.getElementsByTagName("head");
    if (headTags.length > 0) html += headTags[0].innerHTML;
    }

    html += '\n</HE' + 'AD>\n<BODY>\n';
    var printReadyElem = document.getElementById("printMe");

    if (printReadyElem != null) html += printReadyElem.innerHTML;
    else{
    alert("Error, no contents.");
    return;
    }

    html += '\n</BO' + 'DY>\n</HT' + 'ML>';
    var printWin = window.open("","processPrint");
    printWin.document.open();
    printWin.document.write(html);
    printWin.document.close();

    if (gAutoPrint) printWin.print();
    } else alert("Browser not supported.");

    }
</script>




</body></html>