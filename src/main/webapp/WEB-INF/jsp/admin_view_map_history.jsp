<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<script id="script_orgid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>
<script id="script_device">
$(document).ready(function() { 
	$("#device").select2(); 
	});
	</script> 
<jsp:include page="Trackingheader.jsp"></jsp:include>
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
					var exceed_speed=new Array();
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
					exceed_speed[i] = '<c:out value="${info.exceed_speed}"></c:out>';
					i++;
					
					'</c:forEach>';

					function initialize() {
						/* geocoder = new google.maps.Geocoder();*/
						var image_red = {
								    url: 'resources/images/Map_Markers/map_icon_red.png',
								    // This marker is 20 pixels wide by 32 pixels tall.
								  
								  
								  };
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
							
							if(exceed_speed[i]==1)
							{
							var marker = new google.maps.Marker({
								map : map,
								draggable : false,
								animation : google.maps.Animation.DROP,
								position : latlong,
								text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH(Overspeed)",
								icon: image_red
							});
							}
							else
							{
								var marker = new google.maps.Marker({
									map : map,
									draggable : false,
									animation : google.maps.Animation.DROP,
									position : latlong,
									text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH",
								});
							}
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
				
			
<form name="grid" action="adminviewmaphistory" method="POST" id="form1">

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:20px;">
							  <tr style="border:solid 1px black;">
							  <td align="right" valign="middle" width="20%" style="color: white;">Organization:&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							     <select class="input_cmbbx" name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option selected value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <c:if test="${orgname==org_name}"><c:out value="Selected"/></c:if> >${orgname}</option>
			                  </c:forEach>
			                 </select>
			                 <td align="left" valign="middle" width="15%">&nbsp;&nbsp;<span id="org_error" style="color: red;"></span></td>
			                 </td>
			                 <td align="right" valign="middle" width="10%" style="color: white;">Branch:&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <!-- <span id="info"> 
				                 	<select class="input_cmbbx" style="width:220px;margin-top:-4px;" name="branch" id="bid" onchange="doAjaxPost_vechicle()" disabled="disabled">
							   <option value="">-- Select branch--</option>
							 </select>
        				       </span> -->
        				       <span id="info"> 
							   <c:choose>
							  	  <c:when test="${fn:length(branch_array) gt 0}">
				                 	<select name="branch" class="input_cmbbx" style="width:220px;margin-top:-4px;" id="bid" onchange="doAjaxPost_vechicle()">
				                 	<option value="null">--Select Branch--</option>
							  		<c:forEach items="${branch_array}" var="orgReg" >
							  		<option value="${orgReg}" <c:if test="${orgReg==branch}"><c:out value="Selected"/></c:if>>${orgReg}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select class="input_cmbbx" style="width:220px;margin-top:-4px;" name="branch" id="bid" onchange="doAjaxPost_vechicle()">
							  		<option value="">-- Select branch--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
        				       </span><td align="left" valign="middle" width="15%">&nbsp;&nbsp;<span id="biderror" style="color: red;"></span></td>
        				        </td></tr><tr>
							    <td align="right" valign="middle" width="20%" style="color: white;">Vehicle Reg no:&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							   <!-- <span id="info1">
							   <select class="input_cmbbx" name="device_id" id="device"  style='width:220px;'>
							   <option value="">-- Select Vechicle --</option>
						   		</select></span> -->
						   		<span id="info1">
							<c:choose>
							  <c:when test="${fn:length(vehicle_array.busDeviceRegistrations) gt 0}">
							    <select class="input_cmbbx" name="device_id" id="device"  onchange="doAction(this.value);" style='width:220px;'>
							     <option value="--Select device--">Select device</option>
							     <c:forEach items="${vehicle_array.busDeviceRegistrations}" var="vehicle" >
							  		<option value="${vehicle.device_imei_number}" <c:if test="${vehicle.device_imei_number==device_id}"><c:out value="Selected"/></c:if>>${vehicle.bus_reg_id}</option>
							  		</c:forEach>
							     
							     
							    </select>
							  </c:when>	
							  <c:otherwise>
							  		<select class="input_cmbbx" name="device_id" id="device"  onchange="doAction(this.value);"  style='width:220px;'>
							     <option value="">--Select Vechicle--</option>
							    </select>
							    </c:otherwise>
							    </c:choose>	
							</span><td align="left" valign="middle" width="15%">&nbsp;&nbsp;<span id="deviceerror" style="color: red;"></span></td>
							    </td>
							    <td align="right" valign="middle" width="10%" style="color: white;">Date :&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="8%"><input type="text" id="datepicker" name="date" class="input_txtbx1" value="${date}" readonly="readonly">
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;<span id="dateerror" style="color: red;"></span></td>
							    </td>
							    <td align="center" valign="middle" width="8%"><input type="submit" class="btn" value="Show" name="find" onclick="return check();"></td>
							 <td align="center" valign="middle" width="8%"><input type="reset"  onclick="window.location.href='admin_view_map_history'" class="btn" value="Reset"></td>
							  </tr>
							</table>

	<div id="right_content">
	
    	
					<div id="map-canvas" style="border:groove 5px white;"></div>
					
	
	</div>
</form>
<script>
function check(){
	
	document.getElementById("org_error").innerHTML="";
	document.getElementById("biderror").innerHTML="";
	document.getElementById("deviceerror").innerHTML="";
	document.getElementById("dateerror").innerHTML="";
	
	if(document.getElementById("orgid").value=='')
	{
		
	document.getElementById("org_error").innerHTML="Kindly Select Organization";

	return false;
	}
	if(document.getElementById("bid").value =='')
	{
	document.getElementById("biderror").innerHTML="Kindly Select Branch";
	return false;
	}
	if(document.getElementById("device").value =='')
	{
	document.getElementById("deviceerror").innerHTML="Kindly Select Device";
	return false;
	}
	if(document.getElementById("datepicker").value =='')
	{
	document.getElementById("dateerror").innerHTML="Kindly Select Date";
	return false;
	}
	
}
</script>

<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/vechicle_reg_ajax",  
		    data: "org_name=" + orgname,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		<script type="text/javascript">
function doAjaxPost_vechicle() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	var branch=$('#bid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/vechicle_reg_no",  
		    data: "org_name=" + orgname+"&branch="+branch ,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info1').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>


<jsp:include page="footer.jsp"></jsp:include>