<%@page import="java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_e3">
    $(document).ready(function() {
        $("#carrierid").select2();
    });
</script>
<script id="script_e3">
    $(document).ready(function() {
        $("#manuid").select2();
    });
</script>
<script id="script_e3">
    $(document).ready(function() {
        $("#imei").select2();
    });
</script>

<script id="script_e3">
    $(document).ready(function() {
        $("#apn_id").select2();
    });
</script>

<jsp:include page="header.jsp"></jsp:include>
     <div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table"> 



<form action="deviceconfiguration" method="POST" onload="addDate();">

                  
<table class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	              <h2>Device/Sim Configuration</h2>
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

									<%-- <input type="text" class="org_input_txtbx_height1" id="manuid" onblur="toTitleCase('manuid')" name="manufacturer" oninput="validateAlpha()" value=""/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font> --%>
				                 <div id="info9"> <select name="manufacturer"  id="manuid" style="width:220px;"onblur="Validate('manuidid')" >  
                                   <option value="Selected">--Select Manufacturer Name--</option>
                                   <option value="coban">Coban</option>
                                   </select>
                                   </div> 
				                  </td>	
				                  <td valign="middle"  width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Card Carrier:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_contact_person_name_id" onkeypress="return onlyAlphabets(event,this);" name="contact_person_name" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                 --%>

		<div id="info10">		                 
      <select name="carrier" style="width:220px;" id="carrierid" onblur="Validate('carrierid')" onchange="doAjaxPost()">  
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
      </select></div> 			                   </td>			                   
				              </tr>
				              <tr class="row2">
				              <td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="txtinput"><span class="err">*</span> Device Model Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<div id="info4"><input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="modelid" onblur="modelcheck('modelid')" name="model_no" value="${organisation.address}" />
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                 </div>
				                  </td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Sim Card Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <div id="info3">	<input type="text" class="org_input_txtbx_height1" width="60%" id="simno_id" onblur="simno('simno_id')" oninput="validatenum1()" name="sim_card_number" value="${organisation.email_id}" />
				                  	
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </div>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1"><td width="10%"></td>
				              <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Procured Date:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                  <%--  <textarea class="input_txtarea_height1"  rows="3" cols="4" style="width:200px;height:50px;" id="org_address" name="address">${organisation.address}</textarea> --%>
				                <div id="info5"><input type="text" name="device_procured_date" id="datepicker" onblur="devicedate('datepicker')" class="org_input_txtbx_height1">
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </div>
				                  </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Sim Procured Date:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<div id="info2"><input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="datepicker1" onblur="simdate('datepicker1')" onkeypress="return onlyAlphabets(event,this);" name="sim_procured_date" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </div>
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Invoice Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <div id="info6">	<input type="text" name="device_invoice_number" class="org_input_txtbx_height1" id="invoice_id" onblur="deviceinvoice('invoiceid')" oninput="validatenum2()">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </div>
				                  </td>
									<td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim Invoice Number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                <div id="info1">	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="sim_invoice_id" onblur="siminvoice('sim_invoice_id')" oninput="validatenum3()" name="sim_invoice_number" value="${organisation.contact_person_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </div>  
				                  </td>
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                 <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span>  Device IMEI Number:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	 <%-- <input type="text" name="device_imei_number" class="org_input_txtbx_height1" id="imei_id" onblur="deviceimei('imei_id')" oninput="validatenum4()">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                   --%>
				                  
				                  <select   style="width:220px;"name="device_imei_number" id="imei" onblur="Validate2('imei')" onchange="doAjaxPost1()" >
							    <option value="" selected>-- Select IMEI No--</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}">${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
  
				                   </td>
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span>Sim tested ?:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <div id="info12">	<input type="radio" id="id_yes_active" name="sim_card_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="sim_card_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/></div><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Tested:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <div id="info11">	<input type="radio" id="id_yes_active" name="device_tested" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_tested" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/></div><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Device-Sim Paired ? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<div id="info13"><input type="radio" id="id_yes_active" name="device_sim_paired" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_sim_paired" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/></div><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                <tr class="row1">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Device Status:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<div id="info14"><input type="radio" id="id_yes_active" name="device_status" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="device_status" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/></div><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Is Assigned? :</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<div id="info15"><input type="radio" id="id_yes_active" name="is_assigned" value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_assigned" checked value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<br/></div><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                <tr class="row2">
				                <td width="10%"></td>
				                  <td valign="middle" align="left"  width="20%"  class="input_txtlabel"><span class="err">*</span> Password:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <div id="info7">	<input type="text" name="password" class="org_input_txtbx_height1" id="passid" onblur="passcheck('passid')">
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </div>
				                  </td>
				                
				                  <td valign="middle"   width="20%" align="left" class="input_txtlabel"><span class="err">*</span> Comments:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  <div id="info8"><textarea  name="comments" class="textareanew" rows="3" style="width:220px;"id="comments_id" onblur="com('comments_id')"></textarea>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font> </td>
				                </div>
				                </tr>
				                
				                      <tr class="row1">
				                      <td></td>
				                <td colspan="4" valign="top" align="center"   class="input_txt">
				  <table>
                   <tr >
                   <td align="right"><span style="font-weight:bold;color:#3bb9ff;text-shadow:1px 1px #ccc;font-size:1.5em;">Device Sim</span></td>
                   <td align="left"><span style="font-weight:bold;color:#3bb9ff;text-shadow:1px 1px #ccc;font-size:1.5em;">Configuration Setup</span></td>
                   <td>
                   
                   <!-- <input type="reset" class="submit_btn" value="Reset" onclick="window.location.href='orgregistration'"></td> -->
                 <td>
                   </td>
                   </tr>
                   <tr>
                   <td width="50%">
                   Port Number
                   
                   </td><td><input type="text" class="org_input_txtbx_height1"  name="port_no" id="port_id" onblur="port('port_id')" oninput="validatenum5()" value="9000" readonly/></td></tr>
                   <tr><td width="50%">
                   APN
                   
                   </td><td>
                   
     <!-- <input type="text" class="org_input_txtbx_height1" name="apn" id="apn_id"/></td> -->
     <div id="info" >
      <select name="apn" id="apn_id" onblur="Validate1('apn_id')" style="width:220px;">  
      <option value="" selected>--Select APN--</option>  
      </select> 
      </div> 
      </td>
                  </tr><tr> <td width="50%">
                   Admin IP
                   
                   </td><td><input type="text" class="org_input_txtbx_height1"  name="adminip" id="admin_id" onblur="admin('admin_id')" value="50.62.213.127" readonly/></td></tr>
                   <tr><td width="50%">
                   <!-- GPRS
                   
                   </td><td><input type="text" class="org_input_txtbx_height1" name="gprs" id="gprs_id" onblur="gprscheck('gprs_id')"/></td></tr>
                   --> <tr><td width="50%">
                   Device Sim Configure
                   
                   </td><td><input type="radio"  name="device_sim_configure" value="yes"/> yes  <input type="radio"  name="device_sim_configure" value="no"/> No</td></tr>
                   <tr><td width="50%">
                  
                   
                   </td><td><input type="button" class="btn" value="Configure"/></td></tr>
                   
                   <tr><td width="50%">
                   Configuration Conformation
                   
                   </td><td><input type="text" class="org_input_txtbx_height1" name="configuration_conformation" id="confirm_id" onblur="confirm('confirm_id')"/></td></tr>
                   <tr><td width="50%">
                  Configure Date
                   
                   </td><td><input type="text" class="org_input_txtbx_height1" name="configuration_date" id="txtDate" placeholder="" onblur="cdate('datepicker2')"/>
                   </td></tr>
                   <tr><td width="50%">
                    User Id
                   
                   </td><td><input type="text"  class="org_input_txtbx_height1" name="create_user_id" id="userid" onblur="usercheck('userid')" value="<sec:authentication property="principal.username" />" readonly/></td></tr>
                 <tr><td width="50%">
                  
                   


                    <!-- </td><td><input type="submit" class="submit_btn" value="Submit"/></td></tr>   -->

                <!--   </td><td><input type="submit" class="pressableButton blue" value="Submit"/></td></tr> --> 


                   </td><td><input type="submit" class="btn" value="Submit" onclick="return check('this')"/></td></tr> 

                   
                 </table>
                  </td>
                
                  </tr>
				        </table></td></tr></table></td></tr></table></td></tr></table>
                  <c:if test="${simnoexists=='SimCard Number already exists!'}"><script>alert("Sim Card Number already exists");</script></c:if>
                  <c:if test="${dinvoicenoexists=='Device Invoice Number already exists!'}"><script>alert("Device Invoice Number already exists");</script></c:if>
                  <c:if test="${sinvoicenoexists=='Sim Invoice Number already exists!'}"><script>alert("Sim Invoice Number already exists");</script></c:if>
                  <c:if test="${imeinoexists=='Device Imei Number already exists!'}"><script>alert("Device Imei Number already exists");</script></c:if>
                  </form></div></div>
                  
              
<script>
function validateAlpha(){
    var textInput = document.getElementById("manuid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("manuid").value = textInput;
}

function toTitleCase(manuid)
{
	if(document.getElementById("manuid").value==''){
		alert("Device Manufacturer Name is required");
		return false;
	}
	else {
    str=document.getElementById(manuid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(manuid).value=str;
	}
}

function modelcheck(modelid){
	if(document.getElementById("manuid").value==''){
		alert("Model Number is required");
		return false;
	}
}

/* function devicedate(datepicker){
	if(document.getElementById("datepicker").value==''){
		alert("Device Procured Date is required");
		return false;
	}
}
 */
function deviceinvoice(invoice_id){
	if(document.getElementById("invoice_id").value==''){
		alert("Device Invoice Number is required");
		return false;
	}
}

function deviceimei(imei_id){
	if(document.getElementById("imei_id").value==''){
		alert("Device Imei Number is required");
		return false;
	}
}

function passcheck(passid){
	if(document.getElementById("passid").value==''){
		alert("Password is required");
		return false;
	}
}

function Validate(carrierid)
{
var e = document.getElementById("carrierid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a Sim Card Carrier");
}
}

function simno(simno_id){
	if(document.getElementById("simno_id").value==''){
		alert("Sim Card Number is required");
		return false;
	}
}

/* function simdate(datepicker1){
	if(document.getElementById("datepicker1").value==''){
		alert("Sim Procured Date is required");
		return false;
	}
}
 */
function siminvoice(sim_invoice_id){
	if(document.getElementById("sim_invoice_id").value==''){
		alert("Sim Invoice Number is required");
		return false;
	}
}

function com(comments_id){
	if(document.getElementById("comments_id").value==''){
		alert("Comments is required");
		return false;
	}
	else {
	    str=document.getElementById(comments_id).value;
	    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
	    document.getElementById(comments_id).value=str;
		}
}

/* function port(port_id){
	if(document.getElementById("port_id").value==''){
		alert("Port Number is required");
		return false;
	}
}

function admin(admin_id){
	if(document.getElementById("admin_id").value==''){
		alert("Admin IP is required");
		return false;
	}
}

function gprscheck(gprs_id){
	if(document.getElementById("gprs_id").value==''){
		alert("GPRS is required");
		return false;
	}
} */

function confirm(confirm_id){
	if(document.getElementById("confirm_id").value==''){
		alert("Configuration Confirmation is required");
		return false;
	}
}

/*  function cdate(datepicker2){
	if(document.getElementById("datepicker2").value==''){
		alert("Configuration Date is required");
		return false;
	}
} 

function usercheck(userid){
	if(document.getElementById("userid").value==''){
		alert("User Id is required");
		return false;
	}
} */

function validatenum1(){
    var textInput = document.getElementById("simno_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("simno_id").value = textInput;
}

/* function validatenum2(){
    var textInput = document.getElementById("invoice_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("invoice_id").value = textInput;
}

function validatenum3(){
    var textInput = document.getElementById("sim_invoice_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("sim_invoice_id").value = textInput;
}
 */
function validatenum4(){
    var textInput = document.getElementById("imei_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("imei_id").value = textInput;
}

/* function validatenum5(){
    var textInput = document.getElementById("port_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("port_id").value = textInput;
} */

function Validate1(apn_id)
{
var e = document.getElementById("apn_id");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a APN");
}
}

</script>    
<script type="text/javascript">
function doAjaxPost() {  
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
		

	
<!-- 		<script>
function addDate(){
date = new Date();
var month = date.getMonth()+1;
var day = date.getDate();
var year = date.getFullYear();

if (document.getElementById('datetext').value == ''){
document.getElementById('datetext').value = day + '-' + month + '-' + year;
}
}
</script> -->

  <script type="text/javascript">
window.onload = function()
{
GetDate();
};
function GetDate()
{
var dt = new Date();
var dd;
var mm;
var yyyy;
var date;
var month;
dd=dt.getDate();
mm=dt.getMonth();
date = (+dd) ;
month =(+mm) + (+1);
document.getElementById('txtDate').value = month + '/' + date + '/' + dt.getFullYear();

}
</script>
<script>
function check(){
if(document.getElementById("simno_id").value==''){
		alert("Sim Card Number is required");
		return false;
}
else if(document.getElementById("datepicker").value==''){
	alert("Device Procured Date is required");
	return false;
}
else if(document.getElementById("datepicker1").value==''){
	alert("Sim Procured Date is required");
	return false;
}
else if(document.getElementById("invoice_id").value==''){
	alert("Device Invoice Number is required");
	return false;
}
else if(document.getElementById("sim_invoice_id").value==''){
	alert("Sim Invoice Number is required");
	return false;
}
else if(document.getElementById("imei_id").value==''){
	alert("Device Imei Number is required");
	return false;
}
else if(document.getElementById("passid").value==''){
	alert("Password is required");
	return false;
}
else if(document.getElementById("comments_id").value==''){
	alert("Comments is required");
	return false;
}
else if(document.getElementById("confirm_id").value==''){
	alert("Configuration Conformation is required");
	return false;
}	
	
	
}
</script>

<script type="text/javascript">
function doAjaxPost1() {  
	/* alert("hi"); */
	var imeino = $('#imei').val();
	
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/imei_ajax",  
		    data: "device_imei_number="+imeino,
		    success: function(response){  
		var two_drop=response.split("<split>");
		    	
$('#info1').html(two_drop[0]);
$('#info2').html(two_drop[1]);
$('#info3').html(two_drop[2]);
$('#info4').html(two_drop[3]);
$('#info5').html(two_drop[4]);
$('#info6').html(two_drop[5]);
$('#info7').html(two_drop[6]);
$('#info8').html(two_drop[7]);
$('#info9').html(two_drop[8]);
$('#info10').html(two_drop[9]);
$('#info11').html(two_drop[10]);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
				
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>		
<script>
$(function() {
$( "#datepicker").datepicker({dateFormat:'yy-mm-dd'});
});

$(function() {
	$( "#datepicker1").datepicker({dateFormat:'yy-mm-dd'});
	});
	
$(function() {
	$( "#txtDate").datepicker({dateFormat:'yy-mm-dd'});
	});
</script>	


<jsp:include page="footer.jsp"></jsp:include>