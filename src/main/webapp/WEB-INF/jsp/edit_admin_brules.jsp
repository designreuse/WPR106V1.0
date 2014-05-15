<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <form action="updatebrulesadmin" method="POST">
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
										<c:set value="${orgBusinessRuleForm.orgBusinessRules[0]}" var="orgbrulesadmin"></c:set>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1">
												 <td valign="middle" align="right" class="input_txt" width="40%">
												<%-- <input type="text" value="${orgbrulesadmin.org_id}" name="org_id" /> --%>
												<span class="err">*</span> Organization Name :</td>
												<td valign="top" align="left" class="input_txt">
												<input type="hidden" value="${orgbrulesadmin.org_name}" />${orgbrulesadmin.org_name}
			                 </tr>

											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Branch:</td>
												<td valign="top" align="left" class="input_txt">
												<input type="hidden" value="${orgbrulesadmin.branch}" />${orgbrulesadmin.branch} </td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Use Google Map With traffic?:</td>
												<td valign="top" align="left" class="input_txt">
												<c:choose>
												<c:when test="${orgbrulesadmin.google_map_traffic=='on'}">
												<input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="google_map_traffic" checked />
												</c:when>
												<c:when test="${orgbrulesadmin.google_map_traffic=='off'}">
												<input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="google_map_traffic"  />
												</c:when>
												</c:choose>
												
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup Start Time</td>
												<td valign="top" align="left" class="input_txt">
												<input type="text" class="input_txtbx_br" id="inp_id"
													name="pickup_start_time" value="${orgbrulesadmin.pickup_start_time}" />
												
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup end time :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="pickup_end_time" value="${orgbrulesadmin.pickup_end_time}"/> <br />
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop Start Time :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="datepicker"
													name="drop_start_time" value="${orgbrulesadmin.drop_start_time}"/> 
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop end Time :</td>
												<td valign="top" align="left" class="input_txt">
												<input	type="text" class="input_txtbx_br" id="datepicker"
													name="drop_end_time" value="${orgbrulesadmin.drop_end_time}"/>	
													</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop Start Time:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_br" id="inp_id"
													name="kg_start_time" value="${orgbrulesadmin.kg_start_time}" />
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop end Time:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="kg_end_time"  value="${orgbrulesadmin.kg_end_time}"/>	
									           
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Speed Limit  :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx_br" id="inp_id"
													name="speed_limit"  value="${orgbrulesadmin.speed_limit}" />
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>SMS Option:</td>
												<td valign="top" align="left" class="input_txt">
												<c:choose>
												<c:when test="${orgbrulesadmin.sms_options=='yes'}">
												<input type="radio" name="sms_options" value="yes" checked/> Yes&nbsp;&nbsp;
									             <input type="radio" name="sms_options" value="no"/>NO&nbsp;&nbsp;</c:when>
									             <c:when test="${orgbrulesadmin.sms_options=='no'}">
												<input type="radio" name="sms_options" value="yes" /> Yes&nbsp;&nbsp;
									             <input type="radio" name="sms_options" value="no" checked/>NO&nbsp;&nbsp;</c:when>
												</c:choose>
												 
												  </td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Alert Time Interval:</td>
												<td valign="top" align="left" class="input_txt"> <input
													type="text" class="input_txtbx_br" id="inp_id"
													name="alert_time_interval" value="${orgbrulesadmin.alert_time_interval}"/> 
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Is Saturday Working Day?: 
												 </td>
												 <td valign="top" align="left" class="input_txt">
												 <c:choose>
												 <c:when test="${orgbrulesadmin.saturday=='on'}">
												 <input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="saturday" checked />
												 </c:when>
												 <c:when test="${orgbrulesadmin.saturday=='off'}">
												 <input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="saturday" checked />
												 </c:when>
												 </c:choose>
												
												</td>
												
											</tr>
											<tr class="row2">
											<td valign="top" align="right" class="input_txt"> <span
													class="err"></span>SMS sending:</td>
													<td valign="top" align="left" class="input_txt">
													<c:choose>
												 <c:when test="${orgbrulesadmin.sms_sending=='on'}">
												 <input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="sms_sending" checked />
												 </c:when>
												 <c:when test="${orgbrulesadmin.sms_sending=='off'}">
												 <input type="Checkbox" class="input_txtbx_br" id="inp_contact_no" name="sms_sending"  checked/>
												 </c:when>
												 </c:choose>
												
												</td>
												</tr>
											<tr class="row1">
												<td valign="top" align="right"></td>
											
                	  <td valign="top" align="left">
                  	<table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Register" ></td>
                  
                  <td> 
                   <input type="button" class="btn " value="Cancel" onclick="window.location.href='welcome'">
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

<script type='text/javascript'	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
<jsp:include page="footer.jsp"></jsp:include>

						