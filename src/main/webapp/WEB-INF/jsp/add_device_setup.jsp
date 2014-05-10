<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
  	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

<form action="deviceregistration" method="POST">  
<table class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headingsnew altheading">
	              <h2>Device/Sim Setup</h2>
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" >
    					<table cellpadding="0" cellspacing="0" border="0" width="100%">
    					<tr><td>
    					<table cellpadding="0" cellspacing="0" border="0" width="100%">
    					<tr><td width="30%"></td>
    					<td width="37%"><span style="font-weight:bold;color:#3bb9ff;text-shadow:1px 1px #ccc;font-size:1.5em;">Device Setup</span></td>
    					
    					<td><span style="font-weight:bold;color:#3bb9ff;text-shadow:1px 1px #ccc;font-size:1.5em;">Sim Setup</span></td>
    					</tr>
    					
    					</table>
    					
    					</td></tr>
    					  <tr>
    					  <td>
    					  <table cellpadding="0" cellspacing="0" border="0" width="100%">
    							<tr class="row1">
    							<td width="20%"></td>
				                  <td valign="middle" width="24%"  align="left" class="txtinput"><span class="err">*</span>  Device Manufacturer Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="hidden" value="" name="org_id"/>
									<input type="text" class="org_input_txtbx_height1"  id="inp_id" name="org_name" value=""/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font>
				                  </td>	
				                  
				                  <td valign="middle"  width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Card Carrier:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                 --%>
				                 <!-- if  change the id of select box then the stored styles will not be working for this -->
				                 <select   id="e1" style="width:220px;text-decoration:none;">
				                 <option value="." >Select one</option>
				                 <option value="sim carrier 1">sim carrier 1</option>
				                 <option value="sim carrier 1">sim carrier 1</option>
				                 <option value="sim carrier 1">sim carrier 1</option>
				                 <option value="sim carrier 1">sim carrier 1</option>
				                 <option value="sim carrier 1">sim carrier 1</option>
				                 </select>
				                   </td>			                   
				              </tr>
				              <tr class="row2">
				              <td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Model Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Sim Card Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%"  name="email_id" value="${organisation.email_id}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1"><td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Procured Date:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                  <%--  <textarea class="input_txtarea_height1"  rows="3" cols="4" style="width:200px;height:50px;" id="org_address" name="address">${organisation.address}</textarea> --%>
				                  <input type="text" name="" class="org_input_txtbx_height1">
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Sim Procured Date:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Invoice Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" name="" class="org_input_txtbx_height1">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
									<td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Invoice Number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                 <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span>  Device IMEI Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" name="" class="org_input_txtbx_height1">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim tested ?:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="radio" id="id_yes_active" name="is_active" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_active" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Tested:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="radio" id="id_yes_active" name="device_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Device-Sim Paired ? </td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="radio" id="id_yes_active" name="is_paired" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_paired" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                
				                      <tr class="row1">
				                      <td></td>
				                <td colspan="4" valign="top" align="center" width="60%"  class="input_txt">
				  <table>
                   <tr align="left">
                   <td></td>
                   <td ><input type="submit" class="pressableButton blue" value="Register" ></td>
                   <td>
                   
                   <!-- <input type="reset" class="submit_btn" value="Reset" onclick="window.location.href='orgregistration'"></td> -->
                 <td>
                   <input type="button" class="pressableButton blue" onclick="window.location.href='orgregistration'" value="Cancel"></td>
                   </tr>
                 </table>
                  </td>
                
                  </tr>
				        </table></td></tr></table></td></tr></table></td></tr></table>
                  
                  </form></div></div>



<jsp:include page="footer.jsp"></jsp:include>




<script type="text/javascript">

function doAjaxPost() {
	// get the form values  	
	var id = $('#org_unique_id').val();	
	$.ajax({
		type : "POST",
		url : "/BusTrackingApp/check_unique",
		data : "org_unique_id=" + id,
		success : function(response) {
			// we have the response  
		//	alert("success");
			if(response=="")
				
			$('#unique_error').html(response);      
			/*     $('#education').val(''); */
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}


</script>

