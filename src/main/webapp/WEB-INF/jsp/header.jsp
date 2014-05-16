<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: StudentBusTrackingSystem::</title>
<link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />

  
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script> -->
<script type="text/javascript"	src="<c:url value="/resources/js/WelcomeScreenNew/menu_jquery.js" />"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/ddaccordion.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/ddlevelsmenu.js" />"></script>

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
   
   
</head>
<body onload="javascript:startTime();">



	<!-- <div id="main"> -->
		<div id="header">
			<div class="logo" style="height:40px;width:auto">
				<!-- <img src="resources/images/logo123.png" width="250px" height="70px"/> -->
				<span class="Three-DeePjtHeader">Bus Tracking App</span>
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
		
		</body></html>