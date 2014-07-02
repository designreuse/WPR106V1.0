<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="resources/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
 
<!-- DropDown Scripts -->
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

<script id="script_bid">
    $(document).ready(function() {
        $("#route_id").select2();
    });
</script>


<!-- Date Picker -->

	<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.ui.timepicker.js" />"></script>
	<link href="<c:url value="/resources/css/timepicker_css.css" />"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	 $(document).ready(function() {
		 $('#timepicker').timepicker();
     });
	
	</script> 
	
 <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
  

  
  <script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   
      <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-lightness/jquery-ui.css">
    
  

    
      <script type='text/javascript' src="https://rawgithub.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
    
	
	
	<!-- Branch Dependent DropDown  -->
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
    <div id="GPS_View_table" style="height:auto;">
<form action="insert_route_stop" method="post">

	<table class="margin_table">
		<c:if test="${Success=='true'}">
		<tr>
			<td valign="top" align="left" style="padding: 5px 0 10px 0;">
				<div class="status success">
					<p class="closestatus">
						<a title="#" href="">x</a>
					</p>
					<p>
						<img alt="Success" src="images/icons/icon_success.png"><span>
						</span> .
					</p>
				</div></td>
		</tr>
		</c:if>
		<tr>
			<td valign="top" align="left">
				<div>
					<div class="headings altheading">
						<h2> Route Registration1</h2>
					</div>
					
<input type="hidden" id="rsession">
						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
						<tr class="row1"><td width="25%"></td>
								<td valign="middle" align="left" class="input_txt" width="30%"><span
									class="err">*</span> Organization Name :</td>
								<td valign="top" align="left" class="input_txt" width="70%">

								<select style="width:220px;margin-top:-4px;" name="org_name" id="orgid" onchange="doAjaxPost()" onblur="Validate('orgid')">
								<option value="">-- Select Organization--</option>
								<c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <c:if test="${orgname==org_name}"><c:out value="Selected"/></c:if> >${orgname}</option>
			                  </c:forEach>
								</select>
								<br/><font color="Red" size="+1"><span id="orgerror"><form:errors path="route.org_name"></form:errors></font></span>
								</td>
							</tr>
							<tr class="row2"><td width="20">
								<td valign="middle" align="left" class="input_txt" width="30%"><span
									class="err">*</span> Branch :</td>
								<td valign="top" align="left" class="input_txt" width="70%">
					  <span id="info" style="height:8px;" >
					  <c:choose>
					  <c:when test="${fn:length(route_array) gt 0 }">
					  <select name="branch" style="width:220px;margin-top:-4px;" id="bid" onchange="doAjaxPost1()" onblur="Validate1('bid')"> 
								<option value="">-- Select branch--</option>
								<c:forEach items="${branch_array}" var="branch_array">
								<option value="${branch_array}" <c:if test="${branch_array==branch}"><c:out value="selected"></c:out></c:if> >${branch_array}</option>
								</c:forEach>
								</select>
								
					  </c:when>
					  <c:otherwise>
					  <select name="branch" style="width:220px;margin-top:-4px;" id="bid" onchange="doAjaxPost1()" onblur="Validate1('bid')"> 
								<option value="">-- Select branch--</option>
								<c:forEach items="${branch_array}" var="branch_array">
								<option value="${branch_array}" >${branch_array}</option>
								</c:forEach>
								</select>
					  </c:otherwise>
					  </c:choose>
								</span>
								<br><font color="Red" size="+1"><span id="brancherror"> <form:errors path="route.branch"></form:errors></span></font>
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
							<tr class="row1"><td width="20%">
								<td valign="middle" align="left" class="input_txt" width="30%">
								<span class="err">*</span> Route No :</td>
								<td valign="middle" align="left" class="input_txt" width="70%" >
								<span id="info1" style="height:8px;">
								<c:choose>
								<c:when test="${fn:length(route_array) gt 0}">
								<select style="width:220px;margin-top:-4px;" name="route_no" id="route_id" onblur="Validate2('route_id')" >

							   <option value="">-- Select Route No--</option>

							   
							    <c:forEach items="${route_array}" var="route1">
							    <option value="${route1}" <c:if test="${route1==route_no}"><c:out value="selected"></c:out></c:if> >${route1}</option>
							    </c:forEach>
							    </select>
								</c:when>
								<c:otherwise>
								<select style="width:220px;margin-top:-4px;" name="route_no" id="route_id" onblur="Validate2('route_id')" >
							    <option  value="">-- Select Route No--</option>
							    
							    </select>
								</c:otherwise>
								</c:choose>
								
							     <%-- <c:forEach items="${busregistrationform.busregistration}" var="BusRegistration" varStatus="status">
        				        <option value="${BusRegistration.route_no}">${BusRegistration.route_no}</option>
			                  </c:forEach> --%>
			                  
			                  </span>
								<br/><font color="Red" size="+1"><span id="routeerror"><form:errors path="route.route_no"></form:errors></font></span>
								</td>
							</tr>							
							<tr class="row1" style="margin-top:20px;"><td width="20">
								<td valign="bottom" align="right" class="input_txt" ><span
									class="err">*</span>&nbsp;&nbsp;</td>
								<td>
								<div style="padding:20px;width:700px;height:100px;background-color:#F4F4F8;border:solid 1px 	#C6C6CF;">
								<input type="text"  size="500" class="input_txtbx_height" style="width:700px;" id="stop_address_info" name="stop_address" value="" placeholder="Stop Location" />
								<br/>
								<select name="stop_pick" id="stop_pick_info"><option value="0">Pick</option><option value="1">Drop</option><option value="2">Both</option></select>
								
								<input type="text" id="timepicker" readonly="readonly" onkeydown="onKeyDown(this);"/><br/>
								<input type="button" value="Add Stop" style="padding:5px;" onclick="doPopulateStops();"/>
								</div>
								</td>
							</tr>
							<tr class="roww" style="margin-top:20px;"><td width="20">
							<td valign="bottom" align="Right" class="input_txt"></td>
								<td valign="bottom" align="left" class="input_txt">
								<b>Added Stops:</b>
								</td>
							</tr>
							<tr class="roww" style="margin-top:20px;"><td width="20">
							
							<td valign="bottom" align="left" class="input_txt"></td>
								<td valign="bottom" align="left" class="input_txt">
								<span id="added_stops"></span>
								</td>
							</tr>
							
			
							<tr class="roww"><td width="20">
                  
                  <td valign="top" align="left"></td>
                 
                  <td valign="top" align="left">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Save" onclick="return checkvalidatation('this')"></td>
                  <td><input type="button" onclick="window.location.href='insert_route'" class="btn" value="Reset"></td>
                  <td> 
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel">
                  </td>
                  </tr>
                  </table><br/><br/><br/><br/>
                  </td>
                </tr>

						</table>
					</div>
				</td>
		</tr>
	</table>

</form>
	</div></div>				
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript">

function initialize() {
	
	//This example adds a search box to a map, using the Google Place Autocomplete
	//feature. People can enter geographical searches. The search box will return a
	//pick list containing a mix of places and predicted search terms.

	var autocomplete_stop = new google.maps.places.Autocomplete(document.getElementById("stop_address_info"));
	
	
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
							

<script>
function checkvalidatation()
{
	var error="";
	document.getElementById("orgerror").innerHTML="";
	document.getElementById("brancherror").innerHTML="";
	document.getElementById("routeerror").innerHTML="";
	
	var oid=document.getElementById("orgid").value.trim();
	var bid=document.getElementById("bid").value.trim();
	
	
if(oid=="")
	{	
	
	document.getElementById("orgerror").innerHTML="Required field should not be empty";
	error="true";
	}
if(document.getElementById("bid").value=="")
{	
document.getElementById("brancherror").innerHTML="Required field should not be empty";
error="true";
}
if(document.getElementById("route_id").value=="")
	{
	
document.getElementById("routeerror").innerHTML="Required field should not be empty";
error="true";
	}
if(document.getElementById("rsession").value=='')
{
alert("Kindly add stops");
error="true";
}

	if(error=='true')
		{
		return false;
		}
	
}

function Validate(orgid)
{
var e = document.getElementById("orgid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a Organization");
}
}

function Validate1(bid)
{
var e = document.getElementById("bid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a branch");
}
}

function check(){
if(document.getElementById("stop_address").value==''){
	alert("Address is required");
	return false;
}
}

function routecheck()
{
	if(document.getElementById("route_id").value==''){
		alert("Route no is required");
		return false;

	}	
}

function validateorg()
{
	if(document.getElementById("route_id").value==''){
		alert("Route no is required");
		return false;

	}	
}

</script>

<script type="text/javascript">
 function doAjaxPost1() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	var branch=$('#bid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/route_ajax",  
		    data: "org_name="+orgname+"&branch="+branch,
		    
		    success: function(response){  
		
$('#info1').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
<script type="text/javascript">
 function doPopulateStops() {  
	 document.getElementById("rsession").value="";
	var stop_address = $('#stop_address_info').val();

	var stop_pick=$('#stop_pick_info').val();
	var stop_time=$('#timepicker').val();
	if(stop_address=='' || stop_pick=='' || stop_time=='' || stop_address=='Stop Location')
		{
		alert("Check all the fields");
		return false;
		}
	else{
	document.getElementById("stop_address_info").value="";
     document.getElementById("timepicker").value="";
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/populate_stops",  
		    data: "stop_address_info="+stop_address+"&stop_pick_info="+stop_pick+"&stop_time_info="+stop_time,
		    
		    success: function(response){  
		
            $('#added_stops').html(response);
            document.getElementById("rsession").value=response;
           
   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
	}	
	}  
 
 function doRemovestop(value) {  
		
		
		/* alert(orgname); */
		 $.ajax({  
			    type: "POST",  
			    url: "/BusTrackingApp/remove_populate_stops",  
			    data: "id="+value,
			    
			    success: function(response){  
			
	            $('#added_stops').html(response);

	   },  
			    error: function(e){  
			      alert('Error: ' + e);  
			    }  
			  });  
			}  
		</script>	
		
		
<jsp:include page="footer.jsp"></jsp:include>