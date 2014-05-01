<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>


<script type="text/javascript" src="js/ajaxpaging.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Home</title>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr><td width="20%">        				
        				        				<table width="112%" style="margin:-8% 0 0 0;">
<tr>
<td>
			<div class="wrapperMenuSide_test">
<a href="#" onClick="ddaccordion.expandall('submenuheader'); return false">Expand All</a>
<a href="#" onClick="ddaccordion.collapseall('submenuheader'); return false">collapse all </a>

<div class="glossymenu">
<a class="menuitem"  href="welcome" style="padding-left:35px;box-shadow:1px 1px 1px #fff;border:1.7px solid #fff;background: #003366; background-repeat: repeat-x; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#0066cc), to(#003366));background: -webkit-linear-gradient(top, #0066cc, #003366);background: -moz-linear-gradient(top, #0066cc, #003366);background: -ms-linear-gradient(top, #0066cc, #003366);background: -o-linear-gradient(top, #0066cc, #003366);">Home</a>
        
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
<a class="menuitem submenuheader" href="#" >Reports</a>
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
</table></td>
<td><table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table_123"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Client Home</h2>
			        </div>
			        <div class="contentbox">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewdriver">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
    <tr>
    <td>
						<div style="border:#ccc 2px solid; border-radius:5px;padding:15px; margin-bottom:0px;">
						<form action="finddriver" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							   <!-- <td align="left" valign="middle" width="8%">&nbsp;Route No:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_driver"></td>
							   <select name="" class="org_input_cmbbx" >
							   <option value="Route no" >Route1</option>
							   <option value="Route no">Route2</option>
							   <option value="Route no">Route3</option>
							   <option value="Route no">Route4</option>
							   </select></td> -->
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bus Number:</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="" class="org_input_cmbbx" >
							   <option value="Route no" >Bus 1</option>
							   <option value="Route no">Bus 2</option>
							   <option value="Bus no">Bus 3</option>
							   <option value="Route no">Bus 4</option>
							   </select>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					
						</td>
						</tr>
					</table>
						<form name="grid"  action="viewdriver" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
										
					         	
          						<td valign="top" align="left" width="15%">Vehicle No</td>
          						<td valign="top" align="left" width="20%">Current Location</td>
          						<td valign="top" align="left" width="10%">Current_Speed(km/h)</td>
          						<td valign="top" align="left" width="10%">Last_Updated</td>
          						<td valign="top" align="left" width="35%">Live Track</td>
        					</tr>  
        					<c:if test="${fn:length(driverregistrationform.driverregistration) gt 0 }">
        					<c:forEach items="${driverregistrationform.driverregistration}" var="DriverRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td align="center" width="15%"><input type="checkbox" value="${DriverRegistration.driver_id}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="10%"><a href="driver_details?driver_id=${DriverRegistration.driver_id}">${DriverRegistration.driver_id}</a></td>
											<td valign="top" align="left" width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.contact_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.license_type}</td>
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_driver?driver_id=${DriverRegistration.driver_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_driver?driver_id=${DriverRegistration.driver_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(driverregistrationform.driverregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Drivers Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</form>
        				</div>
        				</td>
        				</tr>
        				</table>
</td></tr>

</table>
	<!-- <!-- <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Driver Information</h2>
			        </div>
			        <div class="contentbox">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewdriver">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
    <tr>
    <td>
						<div style="border:#ccc 2px solid; border-radius:5px;padding:15px; margin-bottom:15px;">
						<form action="finddriver" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							   <td align="left" valign="middle" width="8%">&nbsp;Driver Id :</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_driver"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Driver Name :</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_name" class="search_txtbx_driver" ></td>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="submit_btn" value="Search" name="find"></td>
							 <td align="center" valign="middle" width="30%">
							 <input type="button" class="submit_btn" value="Cancel"></td>
							  </tr>
							</table>
							</form>
						</div>
					
						</td>
						</tr>
					</table>
						<form name="grid"  action="viewdriver" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td  align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>					
					         	<td valign="top" align="left" width="15%">Driver Id</td>
          						<td valign="top" align="left" width="15%">Name</td>
          						<td valign="top" align="left" width="20%">Contact Number</td>
          						<td valign="top" align="left" width="15%">License Type</td>
          						<td valign="top" align="left" width="25%">Action</td>
          						
        					</tr>  
        					<c:if test="${fn:length(driverregistrationform.driverregistration) gt 0 }">
        					<c:forEach items="${driverregistrationform.driverregistration}" var="DriverRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td align="center" width="15%"><input type="checkbox" value="${DriverRegistration.driver_id}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="10%"><a href="driver_details?driver_id=${DriverRegistration.driver_id}">${DriverRegistration.driver_id}</a></td>
											<td valign="top" align="left" width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.contact_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.license_type}</td>
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_driver?driver_id=${DriverRegistration.driver_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_driver?driver_id=${DriverRegistration.driver_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(driverregistrationform.driverregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Drivers Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</form>
        				</div>
        				</td>
        				</tr>
        				</table>
        				
        				        				<table width="100%" style="margin:-38.7% 0 0 0;">
<tr>
<td>
			<div class="wrapperMenuSide">
<a href="#" onClick="ddaccordion.expandall('submenuheader'); return false">Expand All</a>
<a href="#" onClick="ddaccordion.collapseall('submenuheader'); return false">collapse all </a>

<div class="glossymenu">
<a class="menuitem"  href="welcome" style="padding-left:35px;back">Home</a>
        
<a class="menuitem submenuheader"  href="#" >Organization</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Organization Registration</a></li>
	<li><a href="vieworg">Organization Information</a></li>
	<li><a href="adduser">Admin User Registration</a></li>
	<li><a href="viewuser">Admin User Information</a></li>
	
	</ul>
</div>
<a class="menuitem submenuheader" href="#" style="box-shadow:1px 1px 1px #fff;border:1.7px solid #fff;background: #003366; background-repeat: repeat-x; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#0066cc), to(#003366));background: -webkit-linear-gradient(top, #0066cc, #003366);background: -moz-linear-gradient(top, #0066cc, #003366);background: -ms-linear-gradient(top, #0066cc, #003366);background: -o-linear-gradient(top, #0066cc, #003366);">Device Management</a>
<div class="submenu">
	<ul>
	<li><a href="changepassword">Device/Sim Setup</a></li>
	<li><a href="insert_device">Device/Sim Configuration</a></li>
	<li><a href="view_devices" style="background: #3bb9ff;">Device Information</a></li>	
	</ul>
</div>
   

<a class="menuitem submenuheader" href="#">Bus Management</a>
<div class="submenu">
	<ul>
	<li><a href="busregistration">Bus registration</a></li>
	<li><a href="viewbus">Bus Information</a></li>
	</ul>
</div>
<a class="menuitem submenuheader" href="#">Route Management</a>
<div class="submenu">
	<ul>
	<li><a href="insert_route">Route Registration</a></li>
	<li><a href="viewroute">View Route</a></li>
		</ul>

</div>
<a class="menuitem submenuheader" href="#" >Class &amp; Section Management</a>	
<div class="submenu">
	<ul>
	<li><a href="addclass">Class &amp; Section Registration</a></li>
	<li><a href="viewclass">Class &amp; Section view</a></li>
		</ul>

</div>	
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Student Management</a>	
<div class="submenu">
	<ul>
	<li><a href="studentregistration">Student Registration</a></li>
	<li><a href="viewstudent">Student Information</a></li>
		</ul>

</div>	
  
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Business Rules</a>	
<div class="submenu">
	<ul>
	<li><a href="businessrulesregistration">Business Rules Registration</a></li>
	<li><a href="viewbusinessrules">Business Rules View</a></li>
		</ul>

</div>	
<a class="menuitem" href="holidays" style="padding-left:35px;">Holidays</a>
<a class="menuitem" href="reports" style="padding-left:35px;">Reports</a>
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Tracking</a>
<div class="submenu">
	<ul>
	<li><a href="viewmap">Live Track </a></li>
	<li><a href="viewmap">Tracking History </a></li>
	
		</ul>

</div>
</div>

 	</div></td>
</tr>
</table>
        		 --%>		
 -->

<jsp:include page="footer.jsp"></jsp:include>
        					
</body>
</html>