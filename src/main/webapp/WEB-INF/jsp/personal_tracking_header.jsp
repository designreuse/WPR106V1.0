<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/newstyles/style.css' />" rel="stylesheet" type="text/css" />



<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>:: Personal Track ::</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/ddlevelsmenu.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/clock.js" />"></script>

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
</style>
</head>
<body onload="javascript:startTime();">



	<div id="main">
	<div id="header">
			<div class="school_div"><img style="width: 240px;height:100px;" src="resources/images/truck.png"/></div>
			<div class="logo" style="background-color:none;height:50px;width:auto;border:solid 1px black;margin-right:250px;margin-top:10px;border-radius:5px;box-shadow:inset 0px 0px 7px #eee;padding:10px; ">
				<!-- <img src="resources/images/logo123.png" width="250px" height="70px"/> -->
				<span class="Three-DeePjtHeader">Personal Tracking</span>
			</div>
			
			<div class="top_link">
				<table border="0" cellspacing="0" cellpadding="0">
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
		
			<div class="clear"></div>
			<div id="ddtopmenubar">
				<div class="menu_container"align="left">
					<div class="menu_l"></div>
					<ul class="menu" >
					<!-- 	participant menus -->
						
						 <li  style="float:left;">
				            	<a href="welcome" class="select" rel="ddsubmenu6">
				            		<span><img src="<c:url value="/resources/images/icon_01.png" />" alt="" style="padding:5px 5px 0 0;" />Home</span>
				            	</a>
				            </li>
				                <li style="float:left;">
				            	<a href="personal_track_history" class="select" rel="ddsubmenu7">
				            		<span><img src="<c:url value="/resources/images/icon_06.png" />" alt="" style="padding:5px 5px 0 0;" />Tracking</span>
				            	</a>
				            </li>
				            <%-- <li style="float:left;">
				            	<a href="fleetreports" class="select" rel="ddsubmenu7">
				            		<span><img src="<c:url value="/resources/images/icon_06.png" />" alt="" style="padding:5px 5px 0 0;" />Reports</span>
				            	</a>
				            </li> --%>
				            </ul>
					<div class="menu_r"></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div></body></html>