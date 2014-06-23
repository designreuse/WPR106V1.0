<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!-- ###################################DDDL################################### -->
  
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
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});
    
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
        $("#carrierid").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#manuid").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#apn_id").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

<form action="update_device" method="POST">  
<table class="margin_table" >
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	              <h2>Edit Device/Sim Setup</h2>
	            </div>
            <div class="contentbox"style="height:800px" > 
            <c:set value="${deviceRegistrationForm.deviceRegistrations[0]}" var="device"/>
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
									<%-- <input type="text" class="org_input_txtbx_height1" id="manuid" onblur="toTitleCase('manuid')" name="manufacturer" oninput="validateAlpha()" value=""/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font> --%>
				                   <select name="manufacturer"  id="manuid" style="width:220px;"onblur="Validate('manuidid')" >  
                                   <option value="${device.manufacturer}" <%-- <c:if test="${device.manufacturer==manufacturer}"><c:out value="selected"></c:out></c:if> --%> >${device.manufacturer}</option>
                                   <option value="coban">Coban</option>
                                   </select>
                                   <br/><font color="Red" size="+1"><form:errors path="deviceRegistration.manufacturer"></form:errors></font>
				                  </td>	
				                  
				                  <td valign="middle"  width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Card Carrier:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                 --%>

				                 
      <select name="carrier" style="width:220px;" id="carrierid" onblur="Validate('carrierid')" onchange="doAjaxPost1()">  
      <option value="${device.carrier}" selected>${device.carrier}</option>
       <c:forEach items="${carriername}" var="carriername" varStatus="status">
        				        <option value="${carriername}"  <%-- <c:if test="${carriername==carrier}"><c:out value="Selected"/></c:if> --%> >${carriername}</option>
			                  </c:forEach>

      </select> 		
      <br/><font color="Red" size="+1"><form:errors path="deviceRegistration.carrier"></form:errors></font> 	    
                     </td>			                   
				              </tr>
				              <tr class="row2">
				              <td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="txtinput"><span class="err">*</span> Device Model Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="modelid" onblur="modelcheck('modelid')" name="model_no" value="${device.model_no}" />
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.model_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Sim Card Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" id="simno_id" onblur="simno('simno_id')" oninput="validatenum1()" name="sim_card_number" value="${device.sim_card_number}" />
				                  	
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.sim_card_number"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1"><td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Procured Date:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                 <div class='input-group date' id='endDate' >
												<input type="text" name="device_procured_date" id="datepicker" onblur="devicedate('datepicker')" value="${device.device_procured_date}" readonly="readonly" style="height:27px;width:190px;float:left;">
				                  				<!-- <input type="text" id="timepicker2"	name="pickup_start_time"  style="height:24px;width:150px;float:left;"/>
												 --><span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="24" height="35"/>
        										</span>
					</div>
				                 <%-- <input type="text" name="device_procured_date" id="datepicker" onblur="devicedate('datepicker')" value="${device.device_procured_date}"> --%>
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.device_procured_date"></form:errors></font>
				                  </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Sim Procured Date:</td>
				                  <td valign="middle" align="left" class="input_txt" width="60%" >
				                  	<div class='input-group date' id='endDate1' >
												<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="datepicker1" onblur="simdate('datepicker1')" readonly="readonly" onkeypress="return onlyAlphabets(event,this);" name="sim_procured_date" value="${device.sim_procured_date}" style="height:27px;width:190px;float:left;" />
				                  	
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="24" height="35"/>
        										</span>
					</div>
				                  	
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.sim_procured_date"></form:errors></font>
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Invoice Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" name="device_invoice_number" class="org_input_txtbx_height1" id="invoice_id" onblur="deviceinvoice('invoiceid')" oninput="validatenum2()" value="${device.device_invoice_number}">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.device_invoice_number"></form:errors></font>
				                  </td>
									<td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Invoice Number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="sim_invoice_id" onblur="siminvoice('sim_invoice_id')" oninput="validatenum3()" name="sim_invoice_number" value="${device.sim_invoice_number}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.sim_invoice_number"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                 <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span>  Device IMEI Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	 <input type="text" name="device_imei_number" class="org_input_txtbx_height1" id="imei_id" onblur="deviceimei('imei_id')" oninput="validatenum4()" value="${device.device_imei_number}">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.device_imei_number"></form:errors></font>
				                  
				                  
				                  
  
				                   </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim tested ?:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <c:choose>
				                  <c:when test="${device.sim_card_tested==0}">
				                  <input type="radio" id="id_yes_active" name="sim_card_tested" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="sim_card_tested" value="0" checked="checked">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.sim_card_tested"></form:errors></font>
				                  </c:when>
				                  <c:when test="${device.sim_card_tested==1}">
				                  <input type="radio" id="id_yes_active" name="sim_card_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="sim_card_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                 </c:when>
				                  </c:choose>
				                  	
				                  </td>
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Tested:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <c:choose>
				                  <c:when test="${device.device_tested==1}">
				                  <input type="radio" id="id_yes_active" name="device_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </c:when>
				                  <c:when test="${device.device_tested==0}">
				                  <input type="radio" id="id_yes_active" name="device_tested" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_tested" value="0" checked="checked">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </c:when>
				                  </c:choose>
				                  	
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Device-Sim Paired ? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  <c:choose>
				                  <c:when test="${device.device_sim_paired==0}">
				                  <input type="radio" id="id_yes_active" name="device_sim_paired" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_sim_paired" value="0" checked>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </c:when>
				                  <c:when test="${device.device_sim_paired==1}">
				                  <input type="radio" id="id_yes_active" name="device_sim_paired" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_sim_paired" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </c:when>
				                  </c:choose>
				                  	
				                  </td>
				                
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Status:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <c:choose>
				                  <c:when test="${device.device_status==1}"><input type="radio" id="id_yes_active" name="device_status" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_status" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  	</c:when>
				                  <c:when test="${device.device_status==0}">
				                  <input type="radio" id="id_yes_active" name="device_status" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_status" value="0" checked="checked">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  	</c:when>
				                  </c:choose>
				                  	
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Is Assigned? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  <c:choose>
				                  <c:when test="${device.is_assigned==0}">
				                  <input type="radio" id="id_yes_active" name="is_assigned" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_assigned" checked value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </c:when>
				                  <c:when test="${device.is_assigned==1}">
				                  <input type="radio" id="id_yes_active" name="is_assigned" checked="checked" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_assigned" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </c:when>
				                  </c:choose>
				                  	
				                  </td>
				                
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Password:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                  	<input type="text" name="password" class="org_input_txtbx_height1" id="passid" onblur="passcheck('passid')" value="${device.password}">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.password"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Comments:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<textarea  name="comments" class="textareanew" rows="3" style="width:220px;"id="comments_id" onblur="com('comments_id')" >${device.comments}</textarea>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.comments"></form:errors></font> </td>
				                
				                </tr>
				                
				                      <tr class="row1">
				                      <td width="10%"></td>
				                      <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>APN:</td>
				                      <td valign="top" align="left" class="input_txt"  ><div id="info" >
      <select name="apn" id="apn_id" onblur="Validate1('apn_id')" style="width:220px;">  
      <option value="${device.apn}" selected>${device.apn}</option>  
      </select> 
      </div> 
      <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="deviceRegistration.apn"></form:errors></font>
      </td>
     <td> <input type="hidden" name="create_timestamp" id="create_timestamp_id" value="${device.create_timestamp}"/></td>
      <td><input type="hidden" class="org_input_txtbx_height1" name="create_user_id" id="userid" onblur="usercheck('userid')" value="<sec:authentication property="principal.username" />" /></td></tr>
				                  
				 
				 <tr class="row2">
                   <table border="0" width="100%">
                   <tr>
                   <td width="30%"></td>
                   <td align="right" width="20%"><input type="submit" class="btn" value="Save Changes" ></td>
                 <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="button" class="btn" onclick="window.location.href='view_devices'" value="Cancel"></td>
                   </tr>
                   </table>
                   </tr>
                   
                 </table>
                  
				        </table></td></tr></table></div></td></tr></table>
				        </form></div>
				        
                 </div>



<jsp:include page="footer.jsp"></jsp:include>




<!-- <script type="text/javascript">

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


</script> -->
<script type="text/javascript">
function doAjaxPost1() {  
	/* alert("hi"); */
	var carriername = $('#carrierid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/apn_ajax",  
		    data: "carrier=" + carriername,
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
