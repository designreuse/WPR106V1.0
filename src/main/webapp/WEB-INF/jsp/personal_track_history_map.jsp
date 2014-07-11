<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<jsp:include page="personal_tracking_header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="resources/js/jquery_ui.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
 
<style>
 #map-canvas {
        height: 100%;
        width:90%;
        margin:0px auto;
        padding: 40px;
	    align=center;
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
      </style>     
       <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
     
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"> </script>
 <script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
$( "#datepicker" ).datepicker({dateFormat:'yy-mm-dd'});
});
</script>
    <script type="text/javascript">
   
  					var geocoder;
 					var map;
					var bang = new google.maps.LatLng(12.98686, 77.59826);
					var chennai = new google.maps.LatLng(12.98686, 80.59826);
					var infowindow = new google.maps.InfoWindow({
						  content: 'Hello world'
						});
					var marker;
					
					
					var lat_array=new Array();
					var long_array=new Array();
					var speed=new Array();
					var address=new Array();
					var date=new Array();
					var length=0;
					var i=0;
					length='<c:out value="${fn:length(latLongForm.latLongs)}"></c:out>';
					first='<c:out value="${first}"></c:out>';
					if(length==0&&first==2)
						alert("No Locations found for this vehicle");
					
					'<c:forEach items="${latLongForm.latLongs}" var="info">';
					
					lat_array[i] = '<c:out value="${info.latitude}"></c:out>';
					long_array[i] = '<c:out value="${info.longitude}"></c:out>';
					speed[i] = '<c:out value="${info.speed}"></c:out>';
					address[i] = '<c:out value="${info.address}"></c:out>';
					date[i] = '<c:out value="${info.date}"></c:out>';
					i++;
					
					'</c:forEach>';

					function initialize() {
						/* geocoder = new google.maps.Geocoder();*/
						if(length==0)
							{
							var mapOptions = {
									center : new google.maps.LatLng(21.0000, 78.0000),
									zoom : 6,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								};
							
							}
						else
							{
						
							var mapOptions = {
									center : new google.maps.LatLng(lat_array[length-1],long_array[length-1]),
									zoom : 15,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								};
							}
						var map = new google.maps.Map(document
								.getElementById("map-canvas"), mapOptions);

						for ( var i = 0; i <= lat_array.length; i++) {
							var line = new google.maps.Polyline({
								path : [
										new google.maps.LatLng(lat_array[i],
												long_array[i]),
										new google.maps.LatLng(
												lat_array[i + 1],
												long_array[i + 1]) ],
								strokeColor : "#000000",
								strokeOpacity : 1.0,
								strokeWeight : 1,
								map : map
							});
						}
						var infowindow = new google.maps.InfoWindow();
						for ( var i = 0; i < lat_array.length; i++) {

							var latlong = new google.maps.LatLng(lat_array[i],
									long_array[i]);
							
							var marker = new google.maps.Marker({
								map : map,
								draggable : false,
								animation : google.maps.Animation.DROP,
								position : latlong,
								text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH"
							});
							
							google.maps.event.addListener(marker, 'mouseover',
									function() {
										infowindow.setContent(this.text);
										infowindow.open(map,this);
									});
							google.maps.event.addListener(marker, 'mouseout',
									function() {
										
										infowindow.close();
									});
						}
					}

					google.maps.event
							.addDomListener(window, 'load', initialize);
				</script>
				
			
<form name="grid" action="personal_tracking_history" method="POST" id="form1">

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:20px;">
							  <tr style="border:solid 1px black;">
							    <td align="left" valign="middle" width="10%"></td>
							    <td align="left" valign="middle" width="10%"></td>
							    <td align="right" valign="middle" width="5%"></td>
							    <td align="left" valign="middle" width="10%">
							   <input type="hidden"  name="device_id" class="input_txtbx1" value="${device_imei_number}">
							   
							    </td>
							    <td align="right" valign="middle" width="8%" style="color:white;">Date :&nbsp;&nbsp; </td>
							    <td align="left" valign="middle" width="10%"><input type="text" id="datepicker" name="date" class="input_txtbx1" value="${date }" readonly="readonly">
							    </td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;<span id="dateerror" style="color: red;"></span></td>
							    <td align="center" valign="middle" width="30%"><input type="submit" class="btn" value="Show" name="find" onclick="return check()"></td>
							 <td align="center" valign="middle" width="30%"><input type="reset" class="btn" onclick="window.location.href='personal_track_history'" value="Reset"></td>
							  </tr>
							</table>

	<div id="right_content">
	
    	
					<div id="map-canvas" style="border:groove 5px white;"></div>
					
	
	</div>
</form>


<jsp:include page="footer.jsp"></jsp:include>
<script>
function check(){
	
	
	document.getElementById("dateerror").innerHTML="";
	
	
	if(document.getElementById("datepicker").value =='')
	{
	document.getElementById("dateerror").innerHTML="Kindly Select Date";
	return false;
	}
	
}
</script>
