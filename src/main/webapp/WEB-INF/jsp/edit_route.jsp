<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">


<script>
$(function() {
$( "#datepicker" ).datepicker({dateFormat:'yy-mm-dd'});
});

$('.datetimeinput').timepicker();
</script>

<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.ui.timepicker.js" />"></script>
	<link href="<c:url value="/resources/css/jquery.ui.timepicker.css" />"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	 $(document).ready(function() {
		 $('#timepicker').timepicker({
			    showPeriod: true,
			    showLeadingZero: true
			});
     });
	
	</script> 
	
	
	<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/route_reg_ajax",  
		    data: "org_name=" + orgname,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info').html(response);
/* var select = document.getElementById("bid");
var option = document.createElement('option');
option.text = option.value = response;
select.add(option, 0); */
/* alert("shgjasgdjs"); */
   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
<style>
#map-canvas {
	height: 100%;
	width: 90%;
	margin: 0px auto;
	padding: 40px;
	align:center;
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

* {
	font-family: Arial;
}

h2 {
	padding: 0 0 5px 5px;
}

h2 a {
	color: #224f99;
}

a {
	color: #999;
	text-decoration: none;
}

a:hover {
	color: #802727;
}

p {
	padding: 0 0 5px 0;
}

</style>

<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <form action="updateclass" method="POST">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 >Edit Route Information</h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${routeForm.route_views[0]}" var="route"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                 <tr class="row1">
								<td valign="middle" align="right" class="input_txt" width="30%"><span
									class="err">*</span> Organization Name :</td>
								<td valign="top" align="left" class="input_txt" width="70%">

								<input type="hidden" name="org_name" class="org_input_cmbbx" value="${route.org_name}"/>${route.org_name}
								</td>
							</tr>
							<tr class="row1">
								<td valign="middle" align="right" class="input_txt" width="30%"><span
									class="err">*</span> Branch :</td>
								<td valign="top" align="left" class="input_txt" width="70%">
					  			<input type="hidden" name="branch" class="org_input_cmbbx" value="${route.branch}"/>${route.branch}
								<br />
								</td>
							</tr>
							<!-- <tr class="row1">
								<td valign="middle" align="right" class="input_txt" width="30%"><span
									class="err">*</span> Stop ID :</td>
								<td valign="top" align="left" class="input_txt" width="70%"><input
									type="text" name="stop_id" id="stop_id"
									class="input_txtbx_height" id="inp_id3" value=""
									placeholder="Stop ID" /><br />
								</td>
							</tr> -->
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%"><span
									class="err">*</span> Route No :</td>
								<td valign="top" align="left" class="input_txt" width="70%" >
								<input type="hidden" name="route_no" class="org_input_cmbbx" value="${route.route_no}"/>${route.route_no}
								
								
								</td>
							</tr>
							
							
							
							<tr class="row2">
							<td valign="middle" align="right" class="input_txt" width="30%"><span
									class="err">*</span><!-- <a href="#" id="addScnt" style="padding:3px;border:2px inset #9fb7cd;border-radius:5px;text-decoration:none;">Stops :</a> --> Stops :<input type="hidden" id="number_of_stops" name="number_of_stops" onload=""></td>
								<c:forEach items="${routeForm.route_views}" var="route">
								<td valign="middle" align="left" class="input_txt" id="p_scents" >
								
								
								
								</td> </c:forEach> 
								</tr>
								
								
							
							<tr class="row1">
                <td valign="top" align="right"></td>
				             
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" ></td>
               
                  <td valign="top" align="left"><input type="button" class="submit_btn1" onclick="window.location.href='viewroute'"value="Cancel"></td></tr></table>
                  </td>
                 </table></div>
                 </td>
                 
                 </tr>
							
				                  </table></form>
				          </div>
				          </div>
				         	
				          
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript">	
<script type="text/javascript">
function initialize() {

	var autocomplete_stop_address = new  google.maps.places.Autocomplete(document.getElementById('stop_info'));
	
}
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<!-- <script type="text/javascript">
//This example adds a search box to a map, using the Google Place Autocomplete
//feature. People can enter geographical searches. The search box will return a
//pick list containing a mix of places and predicted search terms.
$(function() {
	
        var scntDiv = $('#p_scents');
        var i = $('#p_scents p').size();
        
        var j=0;
        $('#addScnt').live('click', function() {
        	alert(i);
        	var n='${fn:length(routeForm.route_views)}';
        	
        	alert(n);
        	
        	//for(i;i<n-1;i++)
        		
        	$('<c:forEach items="${routeForm.route_views}" var="route"> <p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><c:choose><c:when test="${route.trip==0}"><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:when test="${route.trip==1}"><input type="radio"  name="stop_drop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_drop['+i+']" value="1" id="stop_drop_'+i+' checked">Drop<input type="radio"  name="stop_drop['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:otherwise><input type="radio"  name="stop_kgdrop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_kgdrop['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_kgdrop['+i+']" value="2" id="stop_both_'+i+'" checked>KG Drop</c:otherwise></c:choose><br><br><input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" value="${route.bus_arrival_time}" style="width=100px;/><br><br>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p></c:forEach>').appendTo(scntDiv);
			//$('<c:forEach items="${routeForm.route_views}" var="route"> <p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop<input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" style="width=100px;value="${route.bus_arrival_time}"/><br/><br/>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p></c:forEach>').appendTo(scntDiv);
        	//$('<c:set value="${routeForm.route_views[0]}" var="route"/><p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><c:choose><c:when test="${route.trip==0}"><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:when test="${route.trip==1}"><input type="radio"  name="stop_drop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_drop['+i+']" value="1" id="stop_drop_'+i+' checked">Drop<input type="radio"  name="stop_drop['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:otherwise><input type="radio"  name="stop_kgdrop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_kgdrop['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_kgdrop['+i+']" value="2" id="stop_both_'+i+'" checked>KG Drop</c:otherwise></c:choose><br><br><input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" value="${route.bus_arrival_time}" style="width=100px;/><br/><br/>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);

			document.getElementById("number_of_stops").value=i;
        	var autocomplete_stop = new google.maps.places.Autocomplete(document.getElementById("stop_info_"+i));
            //i++;
            return false;
    });
    
    $('#remScnt').live('click', function() { 
               $(this).parents('p').remove();
                    i--;
           
		});
}); -->

 <script type="text/javascript">
$(document).ready(function() {
	var scntDiv = $('#p_scents');
	var i = $('#p_scents p').size();
	alert(i);
	var n='${fn:length(routeForm.route_views)}';
	
	alert(n);
	
	//for(i;i<n-1;i++)
	'<c:forEach items="${routeForm.route_views}" var="route">';	
	
	$('<p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop<br><br><input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" value="${route.bus_arrival_time}" style="width=100px;/><br><br>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);
	i=i+1;
	'</c:forEach>';
	
	
	
	//$('<c:forEach items="${routeForm.route_views}" var="route"> <p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop<input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" style="width=100px;value="${route.bus_arrival_time}"/><br/><br/>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p></c:forEach>').appendTo(scntDiv);
	//$('<c:set value="${routeForm.route_views[0]}" var="route"/><p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="${route.bus_stop_address}" /></label><br/><br/><c:choose><c:when test="${route.trip==0}"><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:when test="${route.trip==1}"><input type="radio"  name="stop_drop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_drop['+i+']" value="1" id="stop_drop_'+i+' checked">Drop<input type="radio"  name="stop_drop['+i+']" value="2" id="stop_both_'+i+'">KG Drop</c:when><c:otherwise><input type="radio"  name="stop_kgdrop['+i+']" id="stop_pick_'+i+'" value="0" >Pick up<input type="radio"  name="stop_kgdrop['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_kgdrop['+i+']" value="2" id="stop_both_'+i+'" checked>KG Drop</c:otherwise></c:choose><br><br><input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" class="input_txtbx_height" value="${route.bus_arrival_time}" style="width=100px;/><br/><br/>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);

	document.getElementById("number_of_stops").value=i;
	var autocomplete_stop = new google.maps.places.Autocomplete(document.getElementById("stop_info_"+i));
    //i++;
    return false;
});

$('#remScnt').live('click', function() { 
       $(this).parents('p').remove();
            i--;
   
});

function initialize() {

	var autocomplete_stop_address = new  google.maps.places.Autocomplete(document.getElementById('stop_address'));
	var autocomplete_route_stop = new google.maps.places.Autocomplete(document.getElementById('route_stop'));
	
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<jsp:include page="footer.jsp"></jsp:include>