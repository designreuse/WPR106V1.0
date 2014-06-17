<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false" %>
<jsp:include page="Trackingheader.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script type="text/javascript" src="resources/js/jquery_ui.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery.mousewheel.js"></script>
      <!-- <script src="resources/js/prettify.min.js"></script> -->
      <link href="resources/css/select2.css" rel="stylesheet"/>
      <script src="resources/js/select2.js"></script>
      
<script id="script_orgid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bids">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>
<script id="script_device">
$(document).ready(function() { 
	$("#device").select2(); 
	});
	</script> 
      
      
      
      
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
					
					
					
					var lat_array=new Array();
					var long_array=new Array();
					var speed=new Array();
					var address=new Array();
					var date=new Array();
					var exceed_speed=new Array();
					
					
					
					

					function initialize(data) {
						/* geocoder = new google.maps.Geocoder();*/
					/* 	alert("map initialize!!");
						alert(lat_array[0]);
						alert(long_array[0]); */
						//alert(data.latLongs.length);
					/* 	var i=0;
						'<c:forEach items="${latLongForm.latLongs}" var="info">';
						lat_array[i] = '<c:out value="${info.latitude}"></c:out>';
						long_array[i] = '<c:out value="${info.longitude}"></c:out>';
						speed[i] = '<c:out value="${info.speed}"></c:out>';
						address[i] = '<c:out value="${info.address}"></c:out>';
						date[i] = '<c:out value="${info.date}"></c:out>';
						i++;						
						'</c:forEach>';
						 */
						var marker=null;
						
						for ( var i = 0; i < data.latLongs.length; i++)
							{
							lat_array[i] = data.latLongs[i].latitude;
							long_array[i] =data.latLongs[i].longitude;
							speed[i] =data.latLongs[i].speed;
							address[i] =data.latLongs[i].address;
							date[i] = data.latLongs[i].date;
							exceed_speed=data.latLongs[i].exceed_speed;
							}
						if(lat_array.length==0)
							alert("No Locations Found!!");
						
						
						var mapOptions = {
							center : new google.maps.LatLng(lat_array[data.latLongs.length-1],long_array[data.latLongs.length-1]),
							zoom : 17	,
							mapTypeId : google.maps.MapTypeId.ROADMAP
						};
						var map = new google.maps.Map(document
								.getElementById("map-canvas"), mapOptions);

						for ( var i = 0; i < lat_array.length; i++) {
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
						 var image_green = {
								  //  url: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2%7C1F7A1F',
								    // This marker is 20 pixels wide by 32 pixels tall.
								    url:'resources/images/Map_Markers/map_icon_green.png'
								  
								  
								  };
						 var image_red = {
								    url: 'resources/images/Map_Markers/map_icon_red.png'
								    // This marker is 20 pixels wide by 32 pixels tall.
								  
								  
								  };
						 var shape = {
							      coord: [1, 1, 1, 20, 18, 20, 18 , 1],
							      type: 'poly'
							  };
 

						for ( var i = 0; i < lat_array.length; i++) {

							var latlong = new google.maps.LatLng(lat_array[i],
									long_array[i]);
							
							if(i==lat_array.length-1)
								{
							var marker = new google.maps.Marker({
								map : map,
								draggable : false,
								position : latlong,
								text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH",
								icon:image_green
								
															});
							google.maps.event.addListener(marker, 'mouseover',
									function() {
										infowindow.setContent(this.text);
										infowindow.open(map,this);
									});
							
							google.maps.event.addListener(marker, 'mouseout', function() {
							infowindow.close();

							});
							}
							else if(exceed_speed[i]==1)
							{
								var marker = new google.maps.Marker({
									map : map,
									draggable : false,
									position : latlong,
									text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH (Running over speed)",
									icon:image_red
									
								});
								google.maps.event.addListener(marker, 'mouseover',
										function() {
											infowindow.setContent(this.text);
											infowindow.open(map,this);
										});
								google.maps.event.addListener(marker, 'mouseout', function() {
									infowindow.close();

									});
								}
							else
							{
							var marker = new google.maps.Marker({
								map : map,
								draggable : false,
								position : latlong,
								text:"Date   : "+date[i]+"<br/>Address: "+address[i]+"<br/>Speed  : "+speed[i]+" KPH",
								
							});
							google.maps.event.addListener(marker, 'mouseover',
									function() {
										infowindow.setContent(this.text);
										infowindow.open(map,this);
									});
							google.maps.event.addListener(marker, 'mouseout', function() {
								infowindow.close();

								});
							}
							
						}
					}

					google.maps.event
							.addDomListener(window, 'load', initialize(null));
				</script>
				<script>
				
				
				
				
				$(document).ready(function(){
					
					var device_id = $('#hidden_id').val();
		        	var click_time= $('#hidden_click_time').val();
		        	if(device_id=="")
		         		device_id = $('#device').val();
					$.ajax({  url: "json",
			              type:"POST",
			              data:"device_id="+device_id+"&click_time="+click_time,
			              success: function(data){
			            	  initialize(data);
			              }});
				
					
					   var j = jQuery.noConflict();
					    j(document).ready(function()
					    {
					        j(".refreshMe").everyTime(30000,function(i){
					        	
					        	var device_id = $('#hidden_id').val();
					        	var click_time= $('#hidden_click_time').val();
					        	if(device_id=="")
					         		device_id = $('#device').val();	
					        	
					        	
					        	j.ajax({
					              url: "json",
					              type:"POST",
					              data:"device_id="+device_id+"&click_time="+click_time,
					              success: function(data){
					            	  initialize(data);
					              }
					            })
					        })
					    });
					   j('.refreshMe').css({color:"Black"});
					});

				</script>
		<script language="javascript" src="resources/js/jquery.timers-1.0.0.js"></script>		
				
				
<form name="grid" action="viewmap" method="POST">

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:20px;">
							  <tr style="border:solid 1px black;">
							    <td align="left" valign="middle" width="10%">
							    	     Select Organization:&nbsp;&nbsp; <select class="input_cmbbx" name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <c:if test="${orgname==org_name}"><c:out value="Selected"/></c:if>>${orgname}</option>
			                  </c:forEach>
			                 </select>
							    
							    </td>
							    <td align="left" valign="middle" width="10%">
							    Select branch:&nbsp;&nbsp;
							    <span id="info"> 
							   <c:choose>
							  	  <c:when test="${fn:length(branch_array) gt 0}">
				                 	<select class="input_cmbbx" style="width:220px;margin-top:-4px;" id="bid" onchange="doAjaxPost_vechicle()">
				                 	<option value="null">--Select Branch--</option>
							  		<c:forEach items="${branch_array}" var="orgReg" >
							  		<option value="${orgReg}" <c:if test="${orgReg==branch}"><c:out value="Selected"/></c:if>>${orgReg}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select class="input_cmbbx" style="width:220px;margin-top:-4px;" name="branch" id="bid" onchange="doAjaxPost_vechicle()" disabled="disabled">
							  		<option value="">-- Select branch--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
        				       </span> 
							    </td>
							    <td align="right" valign="middle" width="8%">Select Vehicle:&nbsp;&nbsp; 
							    <span id="info1">
							<c:choose>
							  <c:when test="${fn:length(vehicle_array.busDeviceRegistrations) gt 0}">
							    <select class="input_cmbbx" name="device_id" id="device"  onchange="doAction(this.value);" style='width:220px;'>
							     <option value="--Select device--">Select device</option>
							     <c:forEach items="${vehicle_array.busDeviceRegistrations}" var="vehicle" >
							  		<option value="${vehicle.device_imei_number}" <c:if test="${vehicle.device_imei_number==vec_imei}"><c:out value="Selected"/></c:if>>${vehicle.bus_reg_id}</option>
							  		</c:forEach>
							     
							     
							    </select>
							  </c:when>	
							  <c:otherwise>
							  		<select class="input_cmbbx" name="device_id" id="device"  onchange="doAction(this.value);" disabled style='width:220px;'>
							     <option value="">--Select Vechicle--</option>
							    </select>
							    </c:otherwise>
							    </c:choose>	
							</span>
							    
							    
							    
							    </td>
							    <td align="left" valign="middle" width="10%">
							    <input type="hidden" id="hidden_id" value="${device_id}"/>
							    <input type="hidden" id="hidden_click_time" value="${click_time}"/>
							   <%--  <c:if test="${device_id==''}">
							   <select name="device_id" id="device"  onchange="doAction(this.value);" class="input_cmbbx">
							   
							   <c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="busDeviceRegistrations">
							   <option <c:if test="${id==busDeviceRegistrations.device_imei_number}"><c:out value="selected"/></c:if> value="${busDeviceRegistrations.device_imei_number}">${busDeviceRegistrations.bus_reg_id} </option>
							   
							   </c:forEach>
							    </select>
							    </c:if> --%>
							    </td>
							    <!-- <td align="right" valign="middle" width="8%">Date :&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" id="datepicker" name="date" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="30%"><input type="submit" class="submit_btn" value="Show" name="find"></td>
							 <td align="center" valign="middle" width="30%"><input type="button" class="submit_btn" value="Cancel"></td> -->
							  </tr>
							  
							</table>

	<div id="right_content">
	
    	
					<div id="map-canvas" style="border:groove 5px white;"><div class="refreshMe">Loading . . . .</div></div>
					
	
	</div>
</form>
<script type="text/javascript"><!--
    function doAction(val){
        //Forward browser to new url
        var org_name=document.getElementById("orgid").value;
        var branch=document.getElementById("bid").value;
       
        window.location="adminviewmap_with_id?org_name="+org_name+"&branch="+branch+"&id="+val;
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