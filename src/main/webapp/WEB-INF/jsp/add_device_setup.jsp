<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!-- ###################################DDDL################################### -->
  
  	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
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

<form action="deviceregistration" method="POST">  
<table class="margin_table" border="0"  style="height:600px">
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
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
									<%-- <input type="text" class="org_input_txtbx_height1" id="manuid" onblur="toTitleCase('manuid')" name="manufacturer" oninput="validateAlpha()" value=""/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font> --%>
				                   <select name="manufacturer"  id="manuid" style="width:220px;" onblur="Validate('manuidid')" >  
                                   <option value="Selected">--Select Manufacturer Name--</option>
                                   <option value="cobal">Coban</option>
                                   </select>
				                  </td>	
				                  
				                  <td valign="middle"  width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Card Carrier:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                 --%>

				                 
      <select name="carrier" style="width:220px;" id="carrierid" onblur="Validate('carrierid')" onchange="doAjaxPost1()">  
      <option value="Selected">--Select Carrier--</option>
       <c:forEach items="${carriername}" var="carriername" varStatus="status">
        				        <option value="${carriername}" <%-- <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if> --%>>${carriername}</option>
			                  </c:forEach>
 <%--    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  

 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_track","root","root");  

   

 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_carrier");
 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
      <%
 }
     %> --%>
      </select> 			                   </td>			                   
				              </tr>
				              <tr class="row2">
				              <td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="txtinput"><span class="err">*</span> Device Model Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="modelid" onblur="modelcheck('modelid')" name="model_no" value="${organisation.address}" />
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Sim Card Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" id="simno_id" onblur="simno('simno_id')" oninput="validatenum1()" name="sim_card_number" value="${organisation.email_id}" />
				                  	
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1"><td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Procured Date:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                  <%--  <textarea class="input_txtarea_height1"  rows="3" cols="4" style="width:200px;height:50px;" id="org_address" name="address">${organisation.address}</textarea> --%>
				                  <input type="text" name="device_procured_date" id="datepicker" onblur="devicedate('datepicker')" class="org_input_txtbx_height1">
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Sim Procured Date:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="datepicker1" onblur="simdate('datepicker1')" onkeypress="return onlyAlphabets(event,this);" name="sim_procured_date" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Invoice Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" name="device_invoice_number" class="org_input_txtbx_height1" id="invoice_id" onblur="deviceinvoice('invoiceid')" oninput="validatenum2()">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
									<td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Invoice Number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="sim_invoice_id" onblur="siminvoice('sim_invoice_id')" oninput="validatenum3()" name="sim_invoice_number" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                 <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span>  Device IMEI Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	 <input type="text" name="device_imei_number" class="org_input_txtbx_height1" id="imei_id" onblur="deviceimei('imei_id')" oninput="validatenum4()">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  
				                  
				                  
  
				                   </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim tested ?:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="radio" id="id_yes_active" name="sim_card_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="sim_card_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
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
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Device-Sim Paired ? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="radio" id="id_yes_active" name="device_sim_paired" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_sim_paired" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Status:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="radio" id="id_yes_active" name="device_status" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_status" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Is Assigned? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="radio" id="id_yes_active" name="is_assigned" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_assigned" checked value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Password:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                  	<input type="text" name="password" class="org_input_txtbx_height1" id="passid" onblur="passcheck('passid')">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Comments:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<textarea  name="comments" class="textareanew" rows="3" style="width:220px;"id="comments_id" onblur="com('comments_id')"></textarea>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font> </td>
				                
				                </tr>
				                
				                      <tr class="row1">
				                      <td width="10%"></td>
				                      <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>APN:</td>
				                      <td valign="top" align="left" class="input_txt"  ><div id="info" >
      <select name="apn" id="apn_id" onblur="Validate1('apn_id')" style="width:220px;" disabled="disabled">  
      <option value="" selected>--Select APN--</option>  
      </select> 
      </div> </td>
      <td><input type="hidden" class="org_input_txtbx_height1" name="create_user_id" id="userid" onblur="usercheck('userid')" value="<sec:authentication property="principal.username" />" /></td></tr>
				                
     
				  
                   <tr class="row2">
                   <table border="0" width="100%">
                   <tr>
                   <td width="30%"></td>
                   <td align="right" width="20%"><input type="submit" class="btn" value="Register" ></td>
                 <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel"></td>
                   </tr>
                   </table>
                   
                   </tr>
                 
                  
				        </table></td></tr></table></td></tr></table>
				        
				        </td></tr>
				        
				        </table>
				        
                  
                  </form></div></div>



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
