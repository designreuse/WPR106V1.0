<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  <script type='text/javascript' src='resources/js/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="resources/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
 
$(window).load(function(){
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false,startDate:new Date()});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false});
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});

	jQuery("#startDate").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate1").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#endDate").on("dp.change",function (e) {
    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate1").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	

	
});
});//]]>  

</script>
<script id="script_bid">
   
    $(function() {
    	$("#driver_id").on("keypress", function(e) {
    		if (e.which === 32 && !this.value.length)
    	        e.preventDefault();
    	});
    	});
</script>
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
                        		<tr class="row2"><td width="20%"></td>
				                  <td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span>Organization Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	 <select  style="width:220px;"name="org_name" id="orgid" onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option selected value="">-- Select Organization--</option>
							    <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <c:if test="${orgname==org_name}"><c:out value="Selected"/></c:if> >${orgname}</option>
			                  </c:forEach>
							    </select>
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.org_name"></form:errors></font>
				                  </td>
				                </tr>
<!-- <input type="text" id="branch"> -->
								 <tr class="row1"><td width="20%"></td>
						         	<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span> Branch :</td>
						            <td valign="top" align="left" class="input_txt">
						           <span id="info" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(branch_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="bid" name="branch" >
				                 	<option selected value="">--Select branch--</option>
							  		<c:forEach items="${branch_array}" var="branch1" >
							  		<option value="${branch1}" <c:if test="${branch1==branch}"><c:out value="Selected"/></c:if>>${branch1}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" >
							    <option selected value="">-- Select branch--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
						            	
						            	</br><font color="Red" size="+1"><form:errors path="busRegistration.branch"></form:errors></font></td>
						         </tr> 
								<tr class="row2"><td width="20%"></td>
				                	<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span> Bus Registration No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1"  oninput="validatealphanum_vechicle_reg_no()" id="bus_no" name="vechicle_reg_no" value="${busreg.vechicle_reg_no}" onkeyup="ChangeCase(this);" onblur="doAjaxcheckvechicle_reg_no()"/>
				                  	<br/><font color="Red" size="+1"><span id="info1"><form:errors path="busRegistration.vechicle_reg_no"></form:errors></span></font></td>
				                
				                </tr> 
								<tr class="row1"><td width="20%"></td>
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Device IMEI No : </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<select   style="width:220px;"name="device_imei_number" id="imei" onblur="Validate2('imei')" >
							    <option selected value="">-- Select IMEI No--</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}" <c:if test="${deviceregistration.device_imei_number==device_imei_no}"><c:out value="Selected"/></c:if> >${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
				                  	
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.device_imei_number"></form:errors></font>
				                  	</td>
				                </tr>	
				                <tr class="row2"><td width="20%"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver Name :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="driver_id" name="driver_name" min="4" maxlength="32" onblur="changealpha_driver_name()" oninput="validatealpha_driver_name()" value="${busreg.driver_name}"/>
				                </br><font color="Red" size="+1"><span id="derror"></span><form:errors path="busRegistration.driver_name"></form:errors></font>
				                </td>
				                </tr>
				                <tr class="row1"><td width="20%"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver License No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="licence_id" onkeyup="ChangeCase(this);" name="driver_licence_no" oninput="validatealphanum_driver_licence_no()" value="${busreg.driver_licence_no}"/>
				                </br><font color="Red" size="+1"><form:errors path="busRegistration.driver_licence_no"></form:errors></font>
				                </tr> 
				                <tr class="row2"><td width="20%"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver License Expiry Date :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<span class='input-group date' id='endDate1' >
							    <input type="text"  name="driver_licence_exp_date" value="${busreg.driver_licence_exp_date}" style="width:190px;" readonly/>
							   <span class="add-on" style="margin:0 0 0 0px;">
							   <img src="resources/images/date.png" width="25" height="45"/>
        							</span></span>
        				
				                </br><font color="Red" size="+1"><form:errors path="busRegistration.driver_licence_exp_date"></form:errors></font></td>
				                </tr> 
				                <tr class="roww">
				                  <td width="20%"></td>	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Route No : </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" onkeyup="ChangeCase(this);" id="route_id" name="route_no" oninput="validatealphanum_route_no()" value="${busreg.route_no}" onblur="doAjaxcheckroute_no()"/>
				                  <%-- 	<select class="org_input_cmbbx" name="route_no" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select Route No--</option>
							     <c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        				        <option value="${route.route_no}">${route.route_no}</option>
			                  </c:forEach>
			                  </select> --%>
				                  	</br><font color="Red" size="+1"><span id="info2"><form:errors path="busRegistration.route_no"></form:errors></span></font></td>
				                </tr>	
				                
				                 <tr class="roww"><td width="20%"></td>
                  <td valign="top" align="right"></td>
                 
                  <td valign="top" align="left">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn"  value="Save" onclick="return check('this')"></td>
                  <td> 
                   <input type="reset" class="btn" value="Reset" onclick="window.location.href='busregistration'">
                  </td>
                  <td> 
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel">
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



<script type="text/javascript">

function validatealphanum_vechicle_reg_no(){
    var textInput = document.getElementById("bus_no").value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById("bus_no").value = textInput;
}

function validatealphanum_driver_licence_no(){
    var textInput = document.getElementById("licence_id").value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById("licence_id").value = textInput;
}

function validatealphanum_route_no(){
    var textInput = document.getElementById("route_id").value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById("route_id").value = textInput;
}

function changealpha_driver_name(){
	
    str=document.getElementById("driver_id").value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById("driver_id").value=str;
		
}

function validatealpha_driver_name(){
	
	var textInput = document.getElementById("driver_id").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("driver_id").value = textInput;
		
}


function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}


</script>

<!-- <script>
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
}   */
</script>-->

<script type="text/javascript">
function doAjaxcheckvechicle_reg_no() {  

	/*  alert("hi"); */ 

	var vechicle_reg_no = $('#bus_no').val();
	
	

	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/check_vehicle_reg_no",  
		    data: "vechicle_reg_no=" + vechicle_reg_no,
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
function doAjaxcheckroute_no() {  

	 //alert("hi"); 

	var route_no = $('#route_id').val();
	  
	//alert(route_no);
	

	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/check_route_no",  
		    data: "route_no=" + route_no,
		    success: function(response){  
		    	

$('#info2').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
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
		<script>
		function check(){
			if(document.getElementById("driver_id").value.substring(0,1)==' ')
			{
			document.getElementById("derror").innerHTML="Invalid Drivername";
			return false;
			}
			
		}
		
		
		</script>

<jsp:include page="footer.jsp"></jsp:include>
				                






	            