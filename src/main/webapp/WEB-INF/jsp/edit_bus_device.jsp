<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Edit Bus and Device Details</title>
</head>
<body>
	<form method="POST" action="update_bus_device">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 align="center" >Edit Bus and Device Information<br></b></h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${busDeviceRegistrationForm.busDeviceRegistrations[0]}" var="BusRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            <tr class="row2">
				                  
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Bus ID :</td>
				                  <td valign="top" align="left" class="input_txt"><input type="hidden" class="input_txtbx_edit_device" name="bus_id" value=" ${BusRegistration.bus_id}">
				                 	  ${BusRegistration.bus_id}</td>
				                  
				                </tr>
				                 <tr class="row1">
				                  
				                 	   <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device ID :</td>
				                 <td valign="top" align="left" class="input_txt">
				                 <input  class="input_txtbx_edit_device" type="hidden" id="inp_id" name="device_id" value="${BusRegistration.device_id}"/>
 									${BusRegistration.device_id}
				               </td>
				                </tr>
				                <tr class="row2">
				                 
 									<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Bus Registration Number :</td>
				                 <td valign="top" align="left" class="input_txt">
				                 <input type="text" class="input_txtbx_edit_device"  id="inp_id" name="bus_reg_id" value="${BusRegistration.bus_reg_id}"/>
 									<!--  <font color="Red" size="+1"><form:errors path="BusDeviceRegistration.bus_reg_id"></form:errors></font>-->
 				                  </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device IMEI Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="input_txtbx_edit_device" id="inp_id" name="device_imei_number" value="${BusRegistration.device_imei_number}"/>                 
								 </td>
				                </tr>
				                 <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device SIM Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="text" class="input_txtbx_edit_device" id="inp_id" name="device_sim_number" value="${BusRegistration.device_sim_number}"/>
				                  </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver ID :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="input_txtbx_edit_device" id="inp_id" name="driver_id" value="${BusRegistration.driver_id}"/>                 
								 </td>
				                </tr>
				                 <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Description :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="text" class="input_txtbx_edit_device" id="inp_id" name="description" value="${BusRegistration.description}"/>
				                  </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Is Active :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <%-- <input type="text" class="input_txtbx_edit_device" id="inp_id" name="isactive" value="${BusRegistration.isactive}"/> --%>                 
				                	 <c:choose>
				                	 <c:when test="${BusRegistration.isactive==1}">
				                	 <input type="radio" name="isactive" value="1" checked="checked"/>Yes&nbsp;&nbsp;
				                     <input type="radio" name="isactive" value="0" />No&nbsp;&nbsp;
				                     </c:when>
				                    <c:otherwise>
				                    <input type="radio" name="isactive" value="1"/>Yes&nbsp;&nbsp;
				                     <input type="radio" name="isactive" value="0" checked="checked"/>No&nbsp;&nbsp;
				                    </c:otherwise>
				                	 </c:choose>
				                 
				                
								 </td>
				                </tr>
				                 
				          
													
				                  <tr class="row2" >
				                   
				                    <td valign="middle" align="right" class="input_txt" ><input id="inp_id" type="submit" class="submit_btn1" value="Update" ></td>                   
				                    <td valign="middle" align="left" class="input_txt"><input type="reset" class="submit_btn1" value="Cancel"  onclick="window.location.href='view_bus_device'"></td>
				                  </tr>
				                  </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </body>
				          </html>				          