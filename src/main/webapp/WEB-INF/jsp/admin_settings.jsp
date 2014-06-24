<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!-- <script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script> -->
  <script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="resources/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false});
    jQuery('#endDate2').datetimepicker({ format: 'hh:mm' ,pickDate: false});
    jQuery('#endDate3').datetimepicker({ format: 'hh:mm' ,pickDate: false});
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'hh:mm' ,pickDate: false});

	jQuery("#startDate").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate1").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#endDate").on("dp.change",function (e) {
    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate1").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate2").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate3").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});
});
});//]]>  

</script>
<script id="script_e4">
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
        $("#sms_option_id").select2();
    });
</script>

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
													class="err">*</span> Branch</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<div id="info" style="height:8px;" > 
													<select name="branch" style="width:220px;" id="bid" onblur="Validate1('bid')" disabled="disabled" >
							    					<option value="">-- Select branch--</option>
							  
			                 
        				      </select>
        				       </div> </td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Use Google Map With traffic?</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<input type="radio" value="on"  id="inp_contact_no" name="google_map_traffic"/> &nbsp; ON &nbsp;&nbsp;&nbsp;
												<input type="radio" value="off" id="inp_contact_no" name="google_map_traffic"  checked /> &nbsp; OFF 
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Pickup Start Time</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<!-- <input type="text" class="input_txtbx_driver" id="inp_id" name="license_type" /> -->
												<div class='input-group date' id='startDate' style="float:left;">
												<input type="text" id="timepicker2"	name="pickup_start_time"  />
												<span class="add-on" style="margin-top:-15px;">
												<img src="resources/images/clock.png" width="25" height="25"/>
        										</span>
					</div>	
												<br/>
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_type"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Pickup end time </td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
													 <div class='input-group date' id='startDate1' style="float:left;">
    													<input id="timepicker1" type="text" class="input-small" value=""/>
    													<span class="add-on">
        												<img src="resources/images/clock.png" width="25" height="25"/>
      													</span></div> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Drop Start Time </td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<div class='input-group date' id='endDate' style="float:left;">
												<input type="text" class="input_txtbx_br"  id="timepicker3"	name="drop_start_time" value="${driverdetails.license_expired_date}"/>
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.license_expired_date"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
												</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Drop end Time </td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <textarea rows="*" cols="*" class="input_txtArea_driver" name="address" value="${license_expired_date.address}"></textarea>
												 --%><div class='input-group date' id='endDate1' style="float:left;">
												 <input
													type="text" class="input_txtbx_br"  id="timepicker4"
													name="drop_end_time" value="${driverdetails.license_expired_date}"/>	
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> 
													<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.address"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>KG Drop Start Time</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<div class='input-group date' id='endDate2' style="float:left;">
												 <input	type="text" class="input_txtbx_br"  id="timepicker5" name="kg_start_time" />
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> 
												<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>KG Drop end Time</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												<div class='input-group date' id='endDate3' style="float:left;">
												<input type="text" class="input_txtbx_br"  id="timepicker6"	name="kg_end_time" />	
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> 
									             <br />
												
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Speed Limit  </td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="speed_limit" />
												 <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row1"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>SMS Option</td><td width="0%">:</td>
												<td valign="top" align="left" class="input_txt">
												 <select  name="sms_options" id="sms_option_id" style="width:220px;">
												 <option value="only delay">Only Delay Time</option>
												 <option value="before reach">Before Reaching Stop</option>
												 </select>
												<br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.driver_status"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Alert Time Interval</td><td width="0%">:</td>
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
												 </td><td width="0%">:</td>
												 <td valign="top" align="left" class="input_txt">
												<input type="radio" value="on" id="inp_contact_no" name="saturday"/> &nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="saturday" checked /> &nbsp; OFF
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td>
												<td valign="middle" align="left"  width="20%"></td>
											</tr>
											<tr class="row2"><td valign="middle" align="left"  width="20%"></td>
											<td valign="top" align="left" class="input_txt"> <span
													class="err"></span>SMS sending</td><td width="0%">:</td>
													<td valign="top" align="left" class="input_txt">
												<input type="radio" value="on" id="inp_contact_no" name="sms_sending" />&nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="sms_sending" checked/>&nbsp; OFF
												<span class="err" id="errmsg"></span> <br />
												<font color="Red" size="+1"><form:errors path="DriverRegistration.contact_no"></form:errors></font>
												</td><td valign="middle" align="left"  width="20%"></td>
												</tr>
											</table>
                	 
                  	<table cellpadding="0" cellspacing="0" border="0" style="width:30%;margin:0 0 0 30%;">
                  <tr>
                  <td width="1%" valign="middle"><input type="submit" class="btn" value="Save" ></td>
                  
                  <td width="1%" align="left" valign="middle"> 
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

					