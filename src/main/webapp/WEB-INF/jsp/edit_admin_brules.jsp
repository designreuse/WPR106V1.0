<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--  <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
<script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
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
<script id="script_bid">
    $(document).ready(function() {
        $("#sms_option_id").select2();
    });
</script>
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
												<input type="hidden" name="org_name" value="${orgbrulesadmin.org_name}" />${orgbrulesadmin.org_name}
			                 </tr>

											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Branch:</td>
												<td valign="top" align="left" class="input_txt">
												<input type="hidden" name="branch" value="${orgbrulesadmin.branch}" />${orgbrulesadmin.branch} </td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span> Use Google Map With traffic?:</td>
												<td valign="top" align="left" class="input_txt">
												<c:choose>
												<c:when test="${orgbrulesadmin.google_map_traffic=='on'}">
												<input type="radio" value="on"  id="inp_contact_no" name="google_map_traffic" checked /> &nbsp; ON &nbsp;&nbsp;&nbsp;
												<input type="radio" value="off" id="inp_contact_no" name="google_map_traffic"/> &nbsp; OFF 
												</c:when>
												<c:when test="${orgbrulesadmin.google_map_traffic=='off'}">
												<input type="radio" value="on" id="inp_contact_no" name="google_map_traffic" />&nbsp; ON &nbsp;&nbsp;&nbsp;&nbsp
												<input type="radio" value="off" id="inp_contact_no" name="google_map_traffic" checked/> &nbsp; OFF
												
												</c:when>
												</c:choose>
												
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup Start Time</td>
												<td valign="top" align="left" class="input_txt">
												
												<div class='input-group date' id='startDate' style="float:left;">
												<input type="text" id="timepicker2"	name="pickup_start_time"  value="${orgbrulesadmin.pickup_start_time}"/>
												<span class="add-on" style="margin-top:-15px;">
												<img src="resources/images/clock.png" width="25" height="25"/>
												</span>
												</div>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Pickup end time :</td>
												<td valign="top" align="left" class="input_txt">
													 <div class='input-group date' id='startDate1' style="float:left;">
    													<input id="timepicker1" type="text" class="input-small" name="pickup_end_time" value="${orgbrulesadmin.pickup_end_time}"/>
    													<span class="add-on">
        												<img src="resources/images/clock.png" width="25" height="25"/>
      													</span></div>  <br />
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop Start Time :</td>
												<td valign="top" align="left" class="input_txt">
													<div class='input-group date' id='endDate' style="float:left;">
												<input type="text" class="input_txtbx_br"  id="timepicker3"	name="drop_start_time" value="${orgbrulesadmin.drop_start_time}"/>
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div>
      												</br>
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>Drop end Time :</td>
												<td valign="top" align="left" class="input_txt">
												
													<div class='input-group date' id='endDate1' style="float:left;">
												 <input
													type="text" class="input_txtbx_br"  id="timepicker4"
													name="drop_end_time" value="${orgbrulesadmin.drop_end_time}"/>	
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> <br>
													</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop Start Time:</td>
												<td valign="top" align="left" class="input_txt"> 
													<div class='input-group date' id='endDate2' style="float:left;">
												 <input	type="text" class="input_txtbx_br"  id="timepicker5" name="kg_start_time" value="${orgbrulesadmin.kg_start_time}" />
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> 
												<br />
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="right" class="input_txt"><span
													class="err">*</span>KG Drop end Time:</td>
												<td valign="top" align="left" class="input_txt">
									           <div class='input-group date' id='endDate3' style="float:left;">
												<input type="text" class="input_txtbx_br"  id="timepicker6"	name="kg_end_time" value="${orgbrulesadmin.kg_end_time}"/>	
													<span class="add-on">
        											<img src="resources/images/clock.png" width="25" height="25"/>
      												</span></div> 
									             <br />
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
												<select style="width:220px;" name="sms_options" id="sms_option_id">
												 <option value="${orgbrulesadmin.sms_options}" selected>${orgbrulesadmin.sms_options}</option>
												 <option value="only delay">Only Delay Time</option>
												 <option value="before reach">Before Reaching Stop</option>
												 </select>
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
												 <input type="radio" value="on" id="inp_contact_no" name="saturday" checked /> &nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="saturday"/> &nbsp; OFF
												 </c:when>
												 <c:when test="${orgbrulesadmin.saturday=='off'}">
												 <input type="radio" value="on" id="inp_contact_no" name="saturday"/> &nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="saturday" checked /> &nbsp; OFF
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
												 <input type="radio" value="on" id="inp_contact_no" name="sms_sending" checked />&nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="sms_sending"/>&nbsp; OFF
												 </c:when>
												 <c:when test="${orgbrulesadmin.sms_sending=='off'}">
												 <input type="radio" value="on" id="inp_contact_no" name="sms_sending" />&nbsp; ON &nbsp;&nbsp;&nbsp;
												 <input type="radio" value="off" id="inp_contact_no" name="sms_sending" checked /> &nbsp; OFF
												 </c:when>
												 </c:choose>
												
												</td>
												</tr>
											<tr class="row1">
												<td valign="top" align="right"></td>
											
                	  <td valign="top" align="left">
                  	<table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Save Changes" ></td>
                  
                  <td> 
                   <input type="button" class="btn " value="Cancel" onclick="window.location.href='view_business_rule'">
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

<!-- <script type='text/javascript'	src='http://code.jquery.com/jquery-1.4.3.min.js'></script> -->
<jsp:include page="footer.jsp"></jsp:include>

						