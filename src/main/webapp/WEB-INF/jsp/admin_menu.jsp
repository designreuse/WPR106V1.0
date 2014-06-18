<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script> -->
<script type="text/javascript"	src="<c:url value="/resources/js/ddaccordion.js" />"></script>
<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />" rel="stylesheet" type="text/css" />
<!-- <script type='text/javascript' src='http://code.jquery.com/jquery-1.4.3.min.js'></script> -->
    <!--  <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
<!-- <link href="http://ivaynberg.github.io/select2/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="http://ivaynberg.github.io/select2/prettify/prettify.css" rel="stylesheet"/> -->
    <!--[if lt IE 9]>
      <script src="js/html5shim.js"></script>
    <![endif]-->
      <script src="resources/js/json2.js"></script>
      
      <!-- <script src="resources/js/jquery-ui-1.8.20.custom.min.js"></script>  --><!-- for sortable example -->
      <script src="resources/js/jquery.mousewheel.js"></script>
      <script src="resources/js/prettify.min.js"></script>
      <!-- <script src="resources/js/bootstrap.min.js"></script> -->
      <!-- <script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script> --></head>
      <link href="resources/css/select2.css" rel="stylesheet"/>
      <script src="resources/js/select2.js"></script>

     
<script id="script_e1">
    $(document).ready(function() {
        $("#e1").select2();
    });
</script>

<script id="script_e2">
    $(document).ready(function() {
        $("#e2").select2();
    });
</script>
<script id="script_e3">
    $(document).ready(function() {
        $("#e3").select2();
    });
</script>
<script id="script_e4">
    $(document).ready(function() {
        $("#e4").select2();
    });
</script>
<script id="script_e5">
    $(document).ready(function() {
        $("#e5").select2();
    });
</script>
<script id="script_e6">
    $(document).ready(function() {
        $("#e6").select2();
    });
</script>
<table width="100%" style="margin:0% 0 0 0;">
<tr>
<td>
			<div class="wrapperMenuSide">

<div class="glossymenu">

<a class="menuitem"  href="welcome" style="padding-left:35px;" >Home</a>
<!-- style="background: #3bb9ff;" -->
<!-- style="box-shadow:1px 1px 1px #fff;border:1.7px solid #fff;background: #003366; background-repeat: repeat-x; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#0066cc), to(#003366));background: -webkit-linear-gradient(top, #0066cc, #003366);background: -moz-linear-gradient(top, #0066cc, #003366);background: -ms-linear-gradient(top, #0066cc, #003366);background: -o-linear-gradient(top, #0066cc, #003366);" -->
<c:if test="${menu eq 'ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader"  href="#" >Organization</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration?submenuheader=0">Organization Registration</a></li>
	<li><a href="vieworg?submenuheader=0">Organization Information</a></li>
	<li><a href="adduser?submenuheader=0">Admin User Registration</a></li>
	<li><a href="viewuser?submenuheader=0">Admin User Information</a></li>
	
	</ul>
</div>
</c:if>
<c:if test="${menu eq 'ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#">Device Management</a>
<div class="submenu">
	<ul>
	<li><a href="changepassword?submenuheader=1">Device/Sim Setup</a></li>
	<!-- <li><a href="insert_device?submenuheader=1">Device/Sim Configuration</a></li> -->	
	<li><a href="view_devices?submenuheader=1">Device Information</a></li>	
	</ul>
</div>
</c:if>  
<c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#">Bus Management</a>
<div class="submenu">
	<ul>
	<li><a href="busregistration?submenuheader=2">Bus registration</a></li>
	<li><a href="viewbus?submenuheader=2">Bus Information</a></li>
	</ul>
</div>
</c:if>
<c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#">Route Management</a>
<div class="submenu">
	<ul>
	<li><a href="insert_route?submenuheader=3">Route Registration</a></li>
	<li><a href="viewroute?submenuheader=3">View Route</a></li>
		</ul>
</div>
</c:if>
<c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#" >Class &amp; Section Management</a>	
<div class="submenu">
	<ul>
	<li><a href="addclass?submenuheader=4">Class &amp; Section Registration</a></li>
	<li><a href="viewclass?submenuheader=4">View Class &amp; Section </a></li>
		</ul>

</div>	
</c:if>
<c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#" >Student Management</a>	
<div class="submenu">
	<ul>
	<li><a href="studentregistration?submenuheader=5">Student Registration</a></li>
	<li><a href="viewstudent?submenuheader=5">Student Information</a></li>
		</ul>

</div>	
 </c:if> 
 <c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#" >Business Rules</a>	
<div class="submenu">
	<ul>
	<!-- <li><a href="business_rule?submenuheader=6">Business Rules Registration</a></li> -->
	<li><a href="view_business_rule?submenuheader=6">Business Rules View</a></li>
		</ul>

</div>	
</c:if>
 <c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#">Holidays</a>
<div class="submenu">
<ul>
	<li><a href="holidayadmin?submenuheader=7">Holidays Entry</a></li>
	<li><a href="holidayviewadmin?submenuheader=7">Holidays Information</a></li>
	</ul>
	</div>
</c:if>
 <c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#">Reports</a>
<div class="submenu">
	<ul>
	<li><a href="admin_reports?submenuheader=8">SMS Report</a></li>
		</ul>
</div>

</c:if>
<c:if test="${menu=='ROLE_SUPERADMIN'}">
<a class="menuitem submenuheader" href="#" >Tracking</a>
<div class="submenu">
	<ul>
	<li><a href="admin_viewmap?submenuheader=9">Live Track</a></li>
	<li><a href="admin_view_map_history?submenuheader=9">Tracking History</a></li>
	
		</ul>

</div>
</c:if>


  <c:if test="${menu=='ROLE_ADMIN'}">       
<a class="menuitem submenuheader"  href="#" >Vehicle / Route Information</a>
<div class="submenu">
	<ul>
	<li><a href="clientvechicledetails">Vehicle Information</a></li>
	<li><a href="clientviewroutedetails">Route Information</a></li>
	<li><a href="driverlist">Driver List</a></li>
	
	
	</ul>
</div>
</c:if>
 <c:if test="${menu=='ROLE_ADMIN'}">
<a class="menuitem submenuheader" href="#" >Student Information</a>
<div class="submenu">
	<ul>
	<!-- <li><a href="clientviewstudent">Student List</a></li>
	<li><a href="clientstudentdata">Student Data</a></li>
	<li><a href="clientstudentroutemap">Student Route Map</a></li> -->
	<li><a href="clientviewstudent">Student List</a></li>
	<!-- <li><a href="#">Student Data</a></li> -->
	<!-- <li><a href="#">Student Route Map</a></li> -->
	
	</ul>
</div>
 </c:if>
  <c:if test="${menu=='ROLE_ADMIN'}">  
<a class="menuitem submenuheader" href="#" >SMS</a>
<div class="submenu">
	<ul>
	<li><a href="clientsmsparent">SMS To Parent</a></li>
	<li><a href="tracksms">Track SMS</a></li>
	<!-- <li><a href="clientsmsparent">SMS To Parent</a></li>
	<li><a href="clienttracksms">Track SMS</a></li> -->
	
	
	
	</ul>
</div>
</c:if>
 <c:if test="${menu=='ROLE_ADMIN'}">

<!-- <a class="menuitem " href="clientbusinessrules" style="padding-left:35px;">Business Rules</a> -->
<a class="menuitem " href="client_view_businessrule" style="padding-left:35px;">Business Rules</a>

</c:if>
 <c:if test="${menu=='ROLE_ADMIN'}">
<!-- <a class="menuitem " href="clientholiday" style="padding-left:35px;">Holidays</a> -->
<a class="menuitem submenuheader">Holidays</a>
<div class="submenu">
<ul>
	<li><a href="clientholiday">Holidays Entry</a></li>
	<li><a href="clientviewholiday">Holidays Information</a></li>
	</ul>
	</div>
</c:if>
 <c:if test="${menu=='ROLE_ADMIN'}">
<a class="menuitem submenuheader" href="#" >Reports</a>
<div class="submenu">
	<ul>
	
	 
	 <!-- <li><a href="clientdriverlistreport">Driver List</a></li>
	<li><a href="clientpickupreport">Pick Up Report</a> </li>
	<li><a href="clientdropreport">Drop Report</a></li> -->
	
	<li><a href="clientoverspeedingreport">Over Speeding Report </a></li>
	
	</ul>
</div>
</c:if>
 <c:if test="${menu=='ROLE_ADMIN'}">
<a class="menuitem submenuheader" href="#" >Tracking</a>
<div class="submenu">
		<ul>
	<!-- <li><a href="clientdeviceview">Device view</a></li> -->
	<li><a href="client_view_map_history">Tracking History</a></li>
	</ul>
</div>
</c:if><!-- <span style="line-height:0px;"> <br/><font color="#fff">.</font></span> -->
<div class="buttonswitchpanel_search">
			          <!-- <div class='buttonsheader'> -->
						<!-- <a  href='javascript:history.back();' class="otherspressable back_button" >Back</a>
						 --><!-- <a href="#" onclick="toggle(this,'div');return false"><img title="Open Search"src="resources/images/search-blue-icon.png" style="height:25px;width:35px;"/></a> -->
						<!-- <a href="#" onclick="toggle1(this,'divfilter');return false"><img title="Open filter"src="resources/images/filter.png" style="height:25px;width:35px;"/></a>
						popups
						<a href="#join_form" id="join_pop" ><img title="Show"src="resources/images/fulltbl.png" style="height:25px;width:35px;"/></a>
						
						<a  href='#' > <img title="Download"src="resources/images/download.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Print"src="resources/images/print.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Email"src="resources/images/icon_email.png" style="height:35px;width:35px;"/></a>
						 -->
						<center> <a href="#" class="btn"  onClick="ddaccordion.expandall('submenuheader'); return false">Expand All</a>&nbsp;
						 <a href="#" class="btn"  onClick="ddaccordion.collapseall('submenuheader'); return false">Collapse All</a></center>
						 <!-- </div> --></div>
						 <br/>
						 

</div>



</div>

 	</div></td>
</tr>
</table> 
 
