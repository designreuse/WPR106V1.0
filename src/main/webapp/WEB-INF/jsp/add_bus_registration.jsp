<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_orgid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#info").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#imei").select2();
    });
</script>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

<form action="busregistration" method="POST">

<table class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2>Bus Registration Form</h2>
	            </div>
	            <div class="contentbox">
             <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        		<tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span>Organization Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	 <select class="org_input_cmbbx" name="org_name" id="orgid" onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="Selected">-- Select Organization--</option>
							    <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <%-- <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if> --%>>${orgname}</option>
			                  </c:forEach>
							    </select>
				                  	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
<!-- <input type="text" id="branch"> -->
								 <tr class="row1">
						         	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Branch :</td>
						            <td valign="top" align="left" class="input_txt">
						            	<div id="info" style="height:8px; " ><select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="Selected">-- Select branch--</option>
							   <%--  <c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				        <option value="${OrgRegistration.org_id}" <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if>>${OrgRegistration.branch}</option>
			                  </c:forEach>  --%>
							    </select></div>
						            	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row2">
				                	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Bus Registration No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" onblur="busreg('bus_no')" id="bus_no" name="vechicle_reg_no" /><br/><font color="Red" size="+1"></font></td>
				                </tr> 
								<tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device IMEI No : </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<select class="org_input_cmbbx" name="device_imei_number" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select IMEI No--</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}">${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver Name :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="driver_id" name="driver_name" onblur="driver('driver_id')"/></br><font color="Red" size="+1"></font></td>
				                </tr>
				                <tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="licence_id" name="driver_licence_no" onblur="licence('licence_id')"/></br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License Expiry Date :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="datepicker" name="driver_licence_exp_date" onblur="expiry('datepicker')"/></br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Route No : </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="imei" name="route_no" onblur="licence('licence_id')"/>
				                  <%-- 	<select class="org_input_cmbbx" name="route_no" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select Route No--</option>
							     <c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        				        <option value="${route.route_no}">${route.route_no}</option>
			                  </c:forEach>
			                  </select> --%>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				                
				                 <tr class="row1">
                  <td valign="top" align="right"></td>
                 
                  <td valign="top" align="left">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="submit_btn"  value="Register" onclick="return check('this')"></td>
                  <td> 
                   <input type="reset" class="submit_btn" value="Reset" onclick="window.location.href='busregistration'">
                  </td>
                  <td> 
                   <input type="button" class="submit_btn" onclick="window.location.href='welcome'" value="Cancel">
                  </td>
                  </tr>
                  </table>
                  </td>
				        </tr>   
                   
              </table>
         	</td>
  		</tr>
 	</table></div></td></tr></table>
</form></div></div>
<script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<script>
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

function Validate2(imei)
{
var e = document.getElementById("imei");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a Device IMEI number");
}
}

function busreg(bus_no){
	if(document.getElementById("bus_no").value==''){
		alert("Bus Registration Number is required");
		return false;
	}
	else
		{
    str=document.getElementById(bus_no).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(bus_no).value=str;
		}
}

function driver(driver_id){
	if(document.getElementById("driver_id").value==''){
		alert("Driver Name is required");
		return false;
	}
	else
		{
		str=document.getElementById(driver_id).value;
	    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
	    document.getElementById(driver_id).value=str;
		}
}

function validateAlpha(){
    var textInput = document.getElementById("driver_id").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("driver_id").value = textInput;
}


function licence(licence_id){
	if(document.getElementById("licence_id").value==''){
		alert("Driver Licence Number is required");
		return false;
	}
}

/* function expiry(datepicker){
	if(document.getElementById("datepicker").value==''){
		alert("Driver Licence Expiry Date is required");
		return false;
	} 
} */
</script>
<script>
function check(){
	if(document.getElementById("bus_no").value==''){
		alert("Bus Registration Number is required");
		return false;
	}
	else if(document.getElementById("driver_id").value==''){
		alert("Driver Name is required");
		return false;
	}
	else if(document.getElementById("licence_id").value==''){
		alert("Driver Licence Number is required");
		return false;
	}
	else if(document.getElementById("datepicker").value==''){
		alert("Driver Licence Expiry Date is required");
		return false;
	}
	
	
}
</script>

<jsp:include page="footer.jsp"></jsp:include>
				                

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">


<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});


</script>

<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/bus_reg_ajax",  
		    data: "org_name="+orgname,
		    success: function(response){  
		
$('#info').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		





	            