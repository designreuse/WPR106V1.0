<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
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
<style type="text/css">
</style>

<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr><td width="20%"> 
	
        				        				<table width="112%" style="margin:-8% 0 0 0;">
<tr>
<td>
			<div class="wrapperMenuSide_test">
<a href="#" onClick="ddaccordion.expandall('submenuheader'); return false">Expand All</a>
<a href="#" onClick="ddaccordion.collapseall('submenuheader'); return false">collapse all </a>

<div class="glossymenu">
<a class="menuitem"  href="welcome" >Home</a>
        
<a class="menuitem submenuheader"  href="#" >Vehicle / Route Information</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Vehicle Information</a></li>
	<li><a href="vieworg">Route Information</a></li>
	<li><a href="adduser">Driver List</a></li>
	
	
	</ul>
</div>
<a class="menuitem submenuheader" href="#" >Student Information</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Student List</a></li>
	<li><a href="vieworg">Student Data</a></li>
	<li><a href="adduser">Student Route Map</a></li>
	
	
	</ul>
</div>
   
<a class="menuitem submenuheader" href="#" >SMS</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">SMS To Parent</a></li>
	<li><a href="vieworg">Track SMS</a></li>
	
	
	
	</ul>
</div>
<a class="menuitem " href="#" style="padding-left:35px;">Business Rules</a>

<a class="menuitem " href="#" style="padding-left:35px;">Holidays</a>
<a class="menuitem submenuheader" href="#" style="box-shadow:1px 1px 1px #fff;border:1.7px solid #fff;background: #003366; background-repeat: repeat-x; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#0066cc), to(#003366));background: -webkit-linear-gradient(top, #0066cc, #003366);background: -moz-linear-gradient(top, #0066cc, #003366);background: -ms-linear-gradient(top, #0066cc, #003366);background: -o-linear-gradient(top, #0066cc, #003366);" >Reports</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Driver List</a></li>
	<li><a href="vieworg"></a>Pick Up Report </li>
	<li><a href="vieworg"></a>Drop Report</li>
	<li><a href="vieworg"></a>Over Speeding Report </li>
	
	</ul>
</div>
<a class="menuitem submenuheader" href="#" >Live Devices</a>
<div class="submenu">
		<ul>
	<li><a href="orgregistration">Device view</a></li>
	
	
	
	
	</ul>
</div>
</div>

 	</div></td>
</tr>
</table></td><td><div class="report_table">
<ul id="tabs">
    <li><a href="#" name="tab1">Vehicle List</a></li>
    <li><a href="#" name="tab2">Report</a></li>
    <li><a href="#" name="tab3">Settings</a></li>
    <!-- <li><a href="#" name="tab4">Four</a></li>   -->  
</ul>

<div id="content"> 
    <div id="tab1">...</div>
    <div id="tab2">
    <table width="100%"cellpadding="0" cellspacing="0" border="0" class="">
    <tr><td align="center">
    <table  width="80%"cellpadding="0" cellspacing="0" border="0" class="">
    <tr><tr><td >From Date</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td>
    <td >From Time</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td></tr>
    
    <tr><td >To Date</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td>
    <td >To Time</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td></tr>
     <!-- <tr><td ><input type="button" class="submit_btn" value="Show"/></td><td ></td><td ></td></tr> -->
    </table></td></tr>
    <tr><td align="center"><br/>
    <table width="50%"cellpadding="2" cellspacing="0" border="0" class="">
    <tr><td><input type="button" class="submit_btn" value="Show"/></td><td><input type="button" class="submit_btn" value="Download"/></td>
    <td><input type="button" class="submit_btn" value="Print"/></td><td><input type="button" class="submit_btn" value="Email"/></td></tr>
    
    </table>
    </td></tr>
    <tr><td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="">
    <tr ><td align="left" width="30%"><div class="report_table_inner">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
    <tr><th class="report_side_table">Vehicle No</th><th class="report_side_table">Over Speed Count</th></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123689</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123689</td></tr>
    
    </table></div>
    </td>
    <td align="right" width="70%">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="report_table_inner_1">
    <tr><th class="report_side_table">Over Speeding Report</th></tr>
    <tr><td width="100%"> <img src="resources/images/Chart.jpg" width="100%" height="84%"/></td></tr>
    
    </table>
    </td></tr>
    
    </table>
    </td></tr>
    
    </table>
    
    </div>
    <div id="tab3">...</div>
    <!-- <div id="tab4">...</div> -->
</div></div>

</td></tr></table>


<jsp:include page="footer.jsp"></jsp:include>
				                
	          