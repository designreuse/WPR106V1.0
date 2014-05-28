<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  
   
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
	                            <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span>Organization Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <input type="hidden" name="org_name" class="org_input_cmbbx" value="${BusRegistration.org_name}"/>${BusRegistration.org_name}
				                  	 
				                  	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>

								 <tr class="row1">
						         	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Branch :</td>
						            <td valign="top" align="left" class="input_txt">
						      		<input type="hidden" name="branch" class="org_input_cmbbx" value="${BusRegistration.branch}"/>${BusRegistration.branch}
						            	
						            	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row2">
				                	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Bus Registration No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                 	<input type="hidden" name="vechicle_reg_no" class="org_input_cmbbx" value="${BusRegistration.vechicle_reg_no}"/>${BusRegistration.vechicle_reg_no}
				                  	
				                  	<br/><font color="Red" size="+1"></font></td>
				                </tr> 
								<tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device IMEI No : </td>
				                  	<td valign="top" align="left" class="input_txt"><select class="org_input_cmbbx" name="device_imei_number" id="imei" onblur="Validate2('imei')">
							    <option value="${BusRegistration.device_imei_number}" selected>${BusRegistration.device_imei_number}</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}">${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver Name :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="driver_id" name="driver_name" value="${BusRegistration.driver_name}" /></br><font color="Red" size="+1"></font></td>
				                </tr>
				                <tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="licence_id" name="driver_licence_no" value="${BusRegistration.driver_licence_no}"/>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License Expiry Date :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="datepicker" name="driver_licence_exp_date" value="${BusRegistration.driver_licence_exp_date}"/></br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Route No : </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="imei" name="route_no" value="${BusRegistration.route_no}"/>
				                  <%-- 	<select class="org_input_cmbbx" name="route_no" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select Route No--</option>
							     <c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        				        <option value="${route.route_no}">${route.route_no}</option>
			                  </c:forEach>
			                  </select> --%>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				          </table>
				           <table width="100%">
				                  <tr>
				                   <td width="50%" align="right"><input type="submit" class="btn" value="Update" ></td>
				                   <td>&nbsp;&nbsp;</td>
				                    
				                    <td><input type="reset" class="btn" value="Cancel"  onclick="window.location.href='viewbus'"></td>
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


<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});


</script>         