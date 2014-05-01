<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <form action="driverregistration" method="POST">
		<table class="margin_table">
			
			<tr>
				<td valign="top" align="left">
					
						<div class="headings altheading">
							<h2>Business Rule </h2>
						</div>
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="100%"
										style="padding-right: 25px;">

										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt" width="40%">
												
												<span class="err">*</span> Organization Name :</td>
												<td valign="top" align="left" class="input_txt">
												<select class="org_input_cmbbx" name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="Selected">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_name_school" varStatus="status">
        				        <option value="${orgname_for_school}" <%-- <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if> --%>>${orgname_for_school}</option>
			                  </c:forEach>
			                 </select></tr>

											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Branch:</td>
												<td valign="top" align="left" class="input_txt"><div id="info" style="height:8px; " > 	<select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="">-- Select branch--</option>
							  <%--  <c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				        <option value="${OrgRegistration.org_id}" <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if>>${OrgRegistration.branch}</option>
			                  </c:forEach> --%>
			                 
        				      </select>
        				       </div> </td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Use Google Map With traffic?:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="Checkbox" class="input_txtbx_driver" id="inp_contact_no"
													name="contact_no"  value="${driverdetails.contact_no}"/><span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup Start Time</td>
												<td valign="top" align="left" class="input_txt">
												<!-- <input type="text" class="input_txtbx_driver" id="inp_id" name="license_type" /> -->
												<input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_name" value="${driverdetails.driver_name}" onkeypress="return onlyAlphabets(event,this);"/>
												<br/>
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_type"></form:errors></font>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup end time :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="license_no" value="${driverdetails.license_no}"/> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_no"></form:errors></font>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop Start Time :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_driver" id="datepicker"
													name="license_expired_date" value="${driverdetails.license_expired_date}"/> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_expired_date"></form:errors></font>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop end Time :</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <textarea rows="*" cols="*" class="input_txtArea_driver" name="address" value="${license_expired_date.address}"></textarea>
												 --%><input
													type="text" class="input_txtbx_driver" id="datepicker"
													name="license_expired_date" value="${driverdetails.license_expired_date}"/>	
													<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.address"></form:errors></font>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop Start Time:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_status" />
												<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop end Time:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_status" />	
									             <br />
												
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Speed Limit  :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_status" />
												 <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>SMS Option:</td>
												<td valign="top" align="left" class="input_txt"><!-- <input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_status" /> -->
												 <input type="radio" name="driver_status" value="yes" checked="true"/>Yes&nbsp;&nbsp;
									             <input type="radio" name="driver_status" value="no"/>NO&nbsp;&nbsp;
												  <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Alert Time Interval:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_driver" id="inp_id"
													name="driver_status" /> 
												 <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Is Saturday Working Day?:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="checkbox" class="input_txtbx_driver" id="inp_id"
													name="driver_status" /> 
												 
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
												
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>SMS sending:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="checkbox" class="input_txtbx_driver" id="inp_id"
													name="driver_status" /> 
												 
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td>
											</tr>
											
											<tr class="row1">
												<td valign="top" align="right"></td>
											
                	  <td valign="top" align="left">
                  	<table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="submit_btn" value="Register" ></td>
                  
                  <td> 
                   <input type="button" class="submit_btn " value="Cancel" onclick="window.location.href='welcome'">
                  </td>
                  </tr>
                  </table></td>
											</tr>
										</table></td>
								</tr>
							</table>
							
							
							</td></tr>
							</table>
							</form></div></div>
				

				
							
							<script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}



</script>
<script type="text/javascript">
function doAjaxPost() {  
	alert("hi");
	var orgname = $('#orgid').val();
	 alert(orgname); 
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_brules_admin_ajax",  
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

<script type='text/javascript'	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
<jsp:include page="footer.jsp"></jsp:include>

						