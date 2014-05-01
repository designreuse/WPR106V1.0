<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: StudentBusTrackingSystem::</title>
<link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />

  
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script> -->
<script type="text/javascript"	src="<c:url value="/resources/js/WelcomeScreenNew/menu_jquery.js" />"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/ddaccordion.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/ddlevelsmenu.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/clock.js" />"></script>
<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />" rel="stylesheet" type="text/css" />

<script type="text/javascript">
      var bang = new google.maps.LatLng(12.98686,77.59826);
function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(21.0000,78.0000),
          zoom: 4
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
marker = new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: bang
  });
  google.maps.event.addListener(marker, 'click', toggleBounce);
     
 }
function toggleBounce() {

  if (marker.getAnimation() != null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
   
    
<style type="text/css">
.ddsubmenustyle,.ddsubmenustyle ul {
	margin: 0;
	padding: 0;
	position: absolute;
	left: 0;
	top: 0;
	list-style-type: none;
	border: 1px solid #444;
	border-bottom: 0;
	visibility: hidden;
	z-index: 100;
	font-size: 13px;
}

.ddsubmenustyle li {
	line-height: 28px;
	font-size: 13px;
}

.ddsubmenustyle li a {
	display: block;
	width: 160px;
	color: #fff;
	text-decoration: none;
	padding: 0 10px;
	background: #0a86af;
	border-bottom: 1px solid #fff;
	font-size: 13px;
}

* html .ddsubmenustyle li { /*IE6 CSS hack*/
	display: inline-block;
	width: 140px; /*width of menu (include side paddings of LI A*/
}

.ddsubmenustyle li a:hover {
	background-color: #eee;
	border-bottom: 1px solid #ccc;
	color: #333333;
}

.downarrowpointer {
	/*CSS for "down" arrow image added to top menu items*/
	padding: 0;
	border: 0;
}

.rightarrowpointer {
	/*CSS for "right" arrow image added to drop down menu items*/
	position: absolute;
	padding-top: 3px;
	left: 100px;
	border: 0;
}

.ddiframeshim {
	position: absolute;
	z-index: 500;
	background: transparent;
	border-width: 0;
	width: 0;
	height: 0;
	display: block;
}
#active1{
background:#666;
}

</style>

</head>
<body onload="javascript:startTime();">



	<div id="main">
		<div id="header">
			<div class="logo" style="height:70px;width:80%">
				<a href="#">
				</a>
			</div>
			<div class="top_link">
				<table border="0" cellspacing="0" cellpadding="0"
					style="padding: 0;">
					<tr>
						<td rowspan="2" align="right" valign="middle">&nbsp;</td>
						<td align="right" valign="middle"><div class="date">
								<span id="time" class="time"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right" valign="middle"><span class="cart_txt">Welcome
								<sec:authentication property="principal.username" />&nbsp;&nbsp;|&nbsp;&nbsp;<a
								href="<c:url value="/j_spring_security_logout" />">Logout</a> </span>
						</td>
					</tr>
				</table>
			
			</div>
			</div>

<!-- 			<div class="wrapperMenuSide">
<a href="#" onClick="ddaccordion.expandall('submenuheader'); return false">Expand Next</a>
<a href="#" onClick="ddaccordion.collapseall('submenuheader'); return false">collapse all </a>

<div class="glossymenu">
<a class="menuitem"  href="welcome" style="padding-left:35px;back">Home</a>
        
<a class="menuitem submenuheader"  href="#" >Organization</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Organisation Registration</a></li>
	<li><a href="vieworg">Organisation Information</a></li>
	<li><a href="adduser">Admin User Registration</a></li>
	<li><a href="viewuser">Admin User Information</a></li>
	
	</ul>
</div>
<a class="menuitem submenuheader" href="#">Device Management</a>
<div class="submenu">
	<ul>
	<li><a href="changepassword">Device Setup</a></li>
	<li><a href="insert_device">Device Registration</a></li>
	<li><a href="view_devices">Device Information</a></li>	
	</ul>
</div>
   

<a class="menuitem submenuheader" href="#">Bus Management</a>
<div class="submenu">
	<ul>
	<li><a href="changepassword">Bus registration</a></li>
	<li><a href="insert_device">Bus Information</a></li>
	</ul>
</div>
<a class="menuitem submenuheader" href="#">Route Management</a>
<div class="submenu">
	<ul>
	<li><a href="#">Route Registration</a></li>
	<li><a href="#">View Route</a></li>
		</ul>

</div>
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Class &amp; Section Management</a>	
<div class="submenu">
	<ul>
	<li><a href="#">Class &amp; Section Registration</a></li>
	<li><a href="#">Class &amp; Section view</a></li>
		</ul>

</div>	
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Student Management</a>	
<div class="submenu">
	<ul>
	<li><a href="#">Student Registration</a></li>
	<li><a href="#">Student Information</a></li>
		</ul>

</div>	
  
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Business Rules</a>	
<div class="submenu">
	<ul>
	<li><a href="#">Business Rules Registration</a></li>
	<li><a href="#">Business Rules View</a></li>
		</ul>

</div>	
<a class="menuitem" href="#" style="padding-left:35px;">Holidays</a>
<a class="menuitem" href="#" style="padding-left:35px;">Reports</a>
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Live Devices</a>
<div class="submenu">
	<ul>
	<li><a href="#">Device View</a></li>
	
		</ul>

</div>
</div>

 	</div>
 -->			
		</body></html>