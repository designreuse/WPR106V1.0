<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  --> 
  <script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
	 
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false,startDate: new Date()});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
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
    $(document).ready(function() {
        $("#imei").select2();
    });
    
    $(function() {
    	$("#driver_id").on("keypress", function(e) {
    		if (e.which === 32 && !this.value.length)
    	        e.preventDefault();
    	});
    	});
    
    
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
	<form method="POST" action="update_bus">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2>Editing Bus Information<br></b></h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${busRegistrationForm.busregistration[0]}" var="BusRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            <tr class="row2"><td width="20%" style="height: 50px"></td>
				                  <td valign="middle" align="left" class="input_txt" width="20%" ><span class="err">*</span>Organization Name:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                  <input type="hidden" name="org_name" class="org_input_cmbbx" value="${BusRegistration.org_name}"/>${BusRegistration.org_name}
				                  	 
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.org_name"></form:errors></font>
				                  </td>
				                </tr>

								 <tr class="row1"><td width="20" style="height: 50px"></td> 
						         	<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span> Branch :</td>
						            <td valign="middle" align="left" class="input_txt">
						      		<input type="hidden" name="branch" class="org_input_cmbbx" value="${BusRegistration.branch}"/>${BusRegistration.branch}
						            	
						            	</br><font color="Red" size="+1"><form:errors path="busRegistration.branch"></form:errors></font></td>
						         </tr> 
								<tr class="row2" style="height: 50px">
				                	<td width="20"></td><td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span> Bus Registration No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                 	<input type="hidden" name="vechicle_reg_no" class="org_input_cmbbx" style="text-transform: uppercase;" value="${BusRegistration.vechicle_reg_no}"/>${BusRegistration.vechicle_reg_no}
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="busRegistration.vechicle_reg_no"></form:errors></font></td>
				                </tr> 
								<tr class="row1"><td width="20"></td>
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Device IMEI No : </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<select name="device_imei_number" id="imei" onblur="Validate2('imei')" style="width: 220px;margin-top:-4px">
							    <option value="${BusRegistration.device_imei_number}" >${BusRegistration.device_imei_number}</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}">${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.device_imei_number"></form:errors></font></td>
				                </tr>	
				                <tr class="row2" ><td width="20"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver Name :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="driver_id" name="driver_name" value="${BusRegistration.driver_name}" oninput="validatealpha_driver_name()" onblur="changealpha_driver_name()" />
				                  	</br><font color="Red" size="+1"><span id="derror"></span><form:errors path="busRegistration.driver_name"></form:errors></font></td>
				                </tr>
				                <tr class="row1"><td width="20"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver License No :</td>

				                  	<%-- <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="licence_id" name="driver_licence_no" value="${BusRegistration.driver_licence_no}"/>
				                  	<br/><font color="Red" size="+1"></font></td> --%>

				                  	<td valign="top" align="left" class="input_txt"><input type="text"  style="text-transform: uppercase;" class="org_input_txtbx_height1" id="licence_id" name="driver_licence_no"  oninput="validatealphanum_driver_licence_no()" value="${BusRegistration.driver_licence_no}"/>
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.driver_licence_no"></form:errors></font></td>

				                </tr> 
				                <tr class="row2"><td width="20"></td>
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Driver License Expiry Date :</td>

				                  	<td valign="top" align="left" class="input_txt">
				                  	<div class='input-group date' id='endDate1' >
												<input type="text" name="driver_licence_exp_date" value="${BusRegistration.driver_licence_exp_date}" style="height:27px;width:190px;float:left;">
				                  				<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="24" height="35"/>
        										</span>
									</div>
				                  	<%-- <input type="text" class="org_input_txtbx_height1" id="datepicker" name="driver_licence_exp_date" value="${BusRegistration.driver_licence_exp_date}"/><br/><font color="Red" size="+1"></font></td>
				                 --%>

				                  	
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.driver_licence_exp_date"></form:errors></font></td>
				                </tr> 

				                <tr class="roww"><td width="20"></td>
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Route No : </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text"  style="text-transform: uppercase;" class="org_input_txtbx_height1" id="route_id" name="route_no" value="${BusRegistration.route_no}" oninput="validatealphanum_route_no()"/>
				                  <%-- 	<select class="org_input_cmbbx" name="route_no" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select Route No--</option>
							     <c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        				        <option value="${route.route_no}">${route.route_no}</option>
			                  </c:forEach>
			                  </select> --%>
				                  	</br><font color="Red" size="+1"><form:errors path="busRegistration.route_no"></form:errors></font></td>
				                </tr>	
				          </table>
				           <table width="100%">
				                  <tr>

				                   <td width="50%" align="right"><input type="submit" class="btn" value="Save Cahnges" onclick="return check('this')"></td>

				                   <td>&nbsp;&nbsp;</td>
				                    
				                    <td><input type="button" class="btn" value="Cancel"  onclick="window.location.href='viewbus'"></td>
				                  </tr>
				                  </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </div>
				          </div>
				          				
				          <jsp:include page="footer.jsp"></jsp:include>
				         
				         <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">


<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

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
	
    str=document.getElementById(driver_id).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(driver_id).value=str;
		
}

function validatealpha_driver_name(){
	
	var textInput = document.getElementById("driver_id").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("driver_id").value = textInput;
		
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
<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});


</script>         >>>>>>> .r116
