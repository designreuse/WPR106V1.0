<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_typeid">
    $(document).ready(function() {
        $("#typeid").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<form method="POST" action="updateorg">
	

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2>Edit Organization Information</h2>
	       </div></div> 
	       <div class="contentbox" >
	        <c:set value="${orgregistrationform.orgregistration[0]}" var="orgRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="height:650px">
	                            
	                            <tr class="row1">
				                  <td valign="middle" width="20%"align="left" class="txtinput"><span class="err">*</span> Organization Name :</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  <input type="hidden" value="${org_id}" name="org_id"/>
									<input type="hidden" class="org_input_txtbx_height1"  id="oname" name="org_name" oninput="validateAlpha();" onblur="toTitleCase('oname')" value="${orgRegistration.org_name}"/>${orgRegistration.org_name}
				                  		<br/><font color="Red" size="+1"><span id="oerror"><form:errors path="OrgRegistration.org_name"></form:errors></font></span>
				                  </td>	
				                  
				                  <td valign="middle" width="27.5%" align="left" class="input_txtlabel"><span class="err">*</span> Office Fax:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="office_fax_id" tabindex="9"  name="office_fax" onblur="faxcheck('office_fax_id')" min="10" maxlength="10" oninput="validatenum();" value="${orgRegistration.office_fax}" />
				                  		<br/><font color="Red" size="+1"><c:if test="${ferror==true}"><c:out value="Fax number already exist"></c:out></c:if><form:errors path="OrgRegistration.office_fax"></form:errors></font>
				                  </td>			                   
				              </tr>
				              <tr class="row2">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Branch:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                	<input type="hidden" class="org_input_txtbx_height1"  id="branchid" name="branch"  oninput="validateAlpha1();" onblur="toTitleCase1('branchid')" value="${orgRegistration.branch}" />${orgRegistration.branch}
				                   	<br/><font color="Red" size="+1"><span id="berror"><form:errors path="OrgRegistration.branch"></form:errors></font></span>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Email ID:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" tabindex="10" onblur="emailcheck('email')" id="email" on name="email_id" value="${orgRegistration.email_id}" />
				                  		<br/><font color="Red" size="+1"><span id="eiderror"><c:if test="${emailerror==true}"><c:out value="Email Id already exist"></c:out></c:if><form:errors path="OrgRegistration.email_id"></form:errors></font></span>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Address:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                   <textarea class="textareanew"  rows="3" cols="4" tabindex="1" style="width:220px;height:50px;" onblur="toTitleCase5('addr_id')" id="addr_id" name="address">${orgRegistration.address}</textarea>
				                   		<br/><font color="Red" size="+1"><span id="aerror"><form:errors path="OrgRegistration.address"></form:errors></font></span>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Name:</td>
				                  <td valign="middle" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="chairmanid" tabindex="11"  name="chairman_name" min="4" maxlength="32"  oninput="validateAlpha2();" onblur="toTitleCase2('chairmanid')"value="${orgRegistration.chairman_name}" />
				                  <br/><font color="Red" size="+1"><span id="ciderror"></span></font>	
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Country:</td>
				                  <td valign=
				                  "top" align="left" class="input_txt" >
				                  	<!-- <select name="country" class="org_input_cmbbx" id="country_id">
				                  	<option>-- Select Country--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="countryid" min="4" tabindex="2" maxlength="32" onblur="countrycheck('countryid')" oninput="validatecountry();" name="country" value="${orgRegistration.country}" />
				                  		<br/><font color="Red" size="+1"><span id="cerror"><form:errors path="OrgRegistration.country"></form:errors></font></span>
				                  </td>
									<td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Telephone number:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="cno_id" oninput="validatenum4();" tabindex="12" maxlength="10" onblur="cnocheck('cno_id')" name="chairman_telephone_number" value="${orgRegistration.chairman_telephone_number}" />
				                  		<br/><font color="Red" size="+1"><c:if test="${cerror==true}"><c:out value="Mobile number already exist"></c:out></c:if><form:errors path="OrgRegistration.chairman_telephone_number"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> State:</td>
				                  <td valign="middle" align="left" class="input_txt"  >
				                  	<!-- <select name="state" class="org_input_cmbbx" id="state_id">
				                  	<option>-- Select State--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="stateid" min="4" maxlength="32" tabindex="3"  onblur="statecheck('stateid')" oninput="validatestate();" name="state" value="${orgRegistration.state}" />
				                  		<br/><font color="Red" size="+1"><span id="serror"><form:errors path="OrgRegistration.state"></form:errors></font></span>
				                  
				                  	
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Name:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="principalid" min="4" maxlength="32" tabindex="13"  name="principal_name"  oninput="validateAlpha3();" onblur="toTitleCase3('principalid')" value="${orgRegistration.principal_name}" />
				                  <br>	<font color="Red" size="+1"><span id="piderror"></span></font>	
				                  </td>
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> City:</td>
				                  <td valign="middle" align="left" class="input_txt" ">
				                  	<%-- <select name="city" class="org_input_cmbbx" id="city_id">
				                  	<option>-- Select City--</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                   --%>
				                   <input type="text" class="org_input_txtbx_height1" id="cityid" min="4" maxlength="32" tabindex="4" onblur="citycheck('cityid')" oninput="validatecity();" name="city" value="${orgRegistration.city}" />
				                  		<br/><font color="Red" size="+1"><span id="cityerror"><form:errors path="OrgRegistration.city"></form:errors></font></span>
				                  
				                   </td>
				                
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Telephone Number:</td>
				                  <td valign="middle" align="left" class="input_txt"  >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pno_id" oninput="validatenum5();" tabindex="14" name="principal_telephone_number" min="10" maxlength="10" onblur="pnocheck('pno_id')" value="${orgRegistration.principal_telephone_number}" />
				                  		<br/><font color="Red" size="+1"><c:if test="${perror==true}"><c:out value="Mobile number already exist"></c:out></c:if><form:errors path="OrgRegistration.principal_telephone_number"></form:errors></font>
				                  </td>
				                
				                </tr>
				                
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Pin code:</td>
				                  <td valign="middle" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1" tabindex="5" id="pinid" name="pincode" onblur="pincheck('pinid')" min="6" maxlength="6" oninput="validatenum1();" value="${orgRegistration.pincode}" />
				                  		<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.pincode"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err">*</span> Transport Officer Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" tabindex="15" id="transportid" min="4" maxlength="32"  name="transport_officer_name"  oninput="validateAlpha4();" onblur="toTitleCase4('transportid')" value="${orgRegistration.transport_officer_name}" />
				                  		<br/><font color="Red" size="+1"><span id="tiderror"><form:errors path="OrgRegistration.transport_officer_name"></form:errors></font></span>
				                  </td>
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Type Of Organization:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<select name="type_of_organization" style="width:220px;" tabindex="6" onchange="fleetmanagement()" id="typeid" onblur="Validate('typeid')">
				                  	<option value="${orgRegistration.type_of_organization}" selected>${orgRegistration.type_of_organization}</option>
				                  	<option value="">-- Select Organization--</option>
				                  	<option value="school"  <c:if test="${organisation.type_of_organization=='school'}"><c:out value="selected"/></c:if>>School</option>
				                  	<option value="college"  <c:if test="${organisation.type_of_organization=='college'}"><c:out value="selected"/></c:if>>College</option>
				                  	<option value="fleet management"  <c:if test="${organisation.type_of_organization=='fleet management'}"><c:out value="selected"/></c:if>>Fleet Management</option>
				                  	<option value="school and college"  <c:if test="${organisation.type_of_organization=='school and college'}"><c:out value="selected"/></c:if>>School and College</option>
				                  	<option value="private"  <c:if test="${organisation.type_of_organization=='private'}"><c:out value="selected"/></c:if>>Private</option>
				                  	</select>
				                  		<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.type_of_organization"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err">*</span> Transport Officer Number:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="tno_id" tabindex="16"  name="transport_officer_number" oninput="validatenum6();" min="10" maxlength="10" onblur="tnocheck('tno_id')" value="${orgRegistration.transport_officer_number}" />
				                  	<br/><font color="Red" size="+1"><c:if test="${terror==true}"><c:out value="Mobile number already exist"></c:out></c:if><form:errors path="OrgRegistration.transport_officer_number"></form:errors></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 1:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum2();" tabindex="7" onblur="landcheck1('landid1')" id="landid1" min="12" maxlength="12" name="office_land_line1" value="${orgRegistration.office_land_line1}" />
				                  	<br/><font color="Red" size="+1"><c:if test="${l1error==true}"><c:out value="Mobile number already exist"></c:out></c:if><span id="l1error"><form:errors path="OrgRegistration.office_land_line1"></form:errors></span></font>
				                  </td>
				                  
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Is Active :</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  <%-- <input type="text" class="org_input_txtbx_height1" id="inp_id" name="is_active" value="${orgRegistration.is_active}"/> --%>

				                  <c:choose>
				                  <c:when test="${orgRegistration.is_active==1}">
				                  <input type="radio" name="is_active" value="1" tabindex="17" checked="checked"/>Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0"/>No&nbsp;&nbsp;

				                  </c:when>
				                   <c:when test="${orgRegistration.is_active==0}">
				                  <input type="radio" name="is_active" value="1" />Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0" checked="checked"/>No&nbsp;&nbsp;
				                  </c:when>
				                  </c:choose>
				                  <br/><font color="Red" size="+1"><form:errors path="OrgRegistration.is_active"></form:errors></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 2:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum3();" tabindex="8" min="12" maxlength="12" onblur="landcheck2('landid2')" id="landid2" name="office_land_line2" value="${orgRegistration.office_land_line2}" />
				                  	<br/><font color="Red" size="+1"><span id="landerror"><c:if test="${l2error==true}"><c:out value="Mobile number already exist"></c:out></c:if><form:errors path="OrgRegistration.office_land_line2"></form:errors></span></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"></td>
									<td valign="middle" align="left" class="input_txt">
				                  		
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                
	                            <tr class="row1">
	                            	<td valign="middle" align="left"   class="input_txtlabel"></td>
				                   <td valign="middle" align="right" class="input_txt"><input id="inp_id" type="submit" class="btn" value="Save Changes" onclick="return check('this')"></td>
				                   
				                    
				                    <td valign="middle" align="right" class="input_txt"><input type="reset" class="btn" value="Cancel"  onclick="window.location.href='vieworg'"></td>
				                	<td valign="middle" align="left"   class="input_txtlabel"></td>
				                  </tr>
				                  </table>
				                 
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </div>
				          </div>
				     <script>
				     $(function() {
	$("#oname").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
	$(function() {
		$("#branchid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#addr_id").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#countryid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#stateid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#cityid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#principalid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	
	$(function() {
		$("#transportid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
	$(function() {
		$("#chairmanid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
				     
				     function check()
				 	{
				    	
				    	 document.getElementById("tiderror").innerHTML=""; 
				 		document.getElementById("ciderror").innerHTML="";
				 		document.getElementById("piderror").innerHTML="";
				 		document.getElementById("oerror").innerHTML="";
		document.getElementById("berror").innerHTML="";
		document.getElementById("aerror").innerHTML="";
		document.getElementById("cerror").innerHTML="";
		document.getElementById("serror").innerHTML="";
		document.getElementById("cityerror").innerHTML="";
		document.getElementById("l1error").innerHTML="";
		document.getElementById("landerror").innerHTML="";
		
	
		if(document.getElementById("oname").value.substring(0,1)==' ')
		{
		document.getElementById("oerror").innerHTML="Invalid Organization Name";
		return false;
		}
		if(document.getElementById("branchid").value.substring(0,1)==' ')
		{
		document.getElementById("berror").innerHTML="Invalid Branch";
		return false;
		}
		if(document.getElementById("addr_id").value.substring(0,1)==' ')
		{
		document.getElementById("aerror").innerHTML="Invalid Address";
		return false;
		}
		if(document.getElementById("countryid").value.substring(0,1)==' ')
		{
		document.getElementById("cerror").innerHTML="Invalid Country";
		return false;
		}
		if(document.getElementById("stateid").value.substring(0,1)==' ')
		{
		document.getElementById("serror").innerHTML="Invalid State";
		return false;
		}
		if(document.getElementById("cityid").value.substring(0,1)==' ')
		{
		document.getElementById("cityerror").innerHTML="Invalid City";
		return false;
		}
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	    
		 if(document.getElementById("email").value!="")
			{
		if(document.getElementById("email").value.match(mail)==null)
	    {
	    	document.getElementById("eiderror").innerHTML="Invalid Email ID";
	    	
	        return false;
	    }
			}
		 
		 
		 
 var landline=/^[0-9]\d{2,4}-\d{6,8}$/;
		 
		 if(document.getElementById("landid1").value!=""){
			 
			 if(document.getElementById("landid1").value.match(landline)==null)
				 {
				 document.getElementById("l1error").innerHTML="Invalid Land line number Eg:Areacode- phone number";
				 return false;
				 }
		 } 
		 
		 if(document.getElementById("landid2").value!=""){
			 
			 if(document.getElementById("landid2").value.match(landline)==null)
				 {
				 document.getElementById("landerror").innerHTML="Invalid Land line number Eg:Areacode- phone number";
				 return false;
				 }
		 } 
				 		if(document.getElementById("chairmanid").value!='')
				 			{
				 		if(document.getElementById("chairmanid").value.length<4)
				 		{
				 		document.getElementById("ciderror").innerHTML="Required & must be of length 4 to 32.";
				 		return false;
				 		}	
				 		if(document.getElementById("chairmanid").value.substring(0,1)==' '){
							document.getElementById("ciderror").innerHTML="Invalid Name";
							return false;
						}
				 			}
				 		if(document.getElementById("principalid").value!='')
				 		{
				 		
				 		if(document.getElementById("principalid").value.length<4)
				 		{
				 			
				 		document.getElementById("piderror").innerHTML="Required & must be of length 4 to 32.";
				 		return false;
				 		}
				 		if(document.getElementById("principalid").value.substring(0,1)==' '){
							document.getElementById("piderror").innerHTML="Invalid Name";
							return false;	
						}
				 		}	
						if(document.getElementById("transportid").value.substring(0,1)==' '){
							document.getElementById("tiderror").innerHTML="Invalid Name";
							return false;	
						}
						
						if(document.getElementById("landid2").value!="")
						{
							
						if(document.getElementById("landid1").value==document.getElementById("landid2").value){
							document.getElementById("landerror").innerHTML="Office Land Line number should not be the same!!";
							return false;	
						}
						}
				 	}
function validateAlpha(){
    var textInput = document.getElementById("oname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("oname").value = textInput;
}

function toTitleCase(oname)
{
	
    str=document.getElementById(oname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(oname).value=str;
	
}

function validateAlpha1(){
    var textInput = document.getElementById("branchid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("branchid").value = textInput;
}

function toTitleCase1(branchid)
{
	
    str=document.getElementById(branchid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(branchid).value=str;
	
}

function validateAlpha2(){
    var textInput = document.getElementById("chairmanid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("chairmanid").value = textInput;
}

function toTitleCase2(chairmanid)
{
	
    str=document.getElementById(chairmanid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(chairmanid).value=str;

	}

function validateAlpha3(){
    var textInput = document.getElementById("principalid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("principalid").value = textInput;
}

function toTitleCase3(principalid)
{
	
    str=document.getElementById(principalid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(principalid).value=str;
	
}

function validateAlpha4(){
    var textInput = document.getElementById("transportid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("transportid").value = textInput;
}

function toTitleCase4(transportid)
{
	
    str=document.getElementById(transportid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(transportid).value=str;
	
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
    textInput = textInput.replace(/[^0-9-]/g, "");
    document.getElementById("landid1").value = textInput;
}

function validatenum3(){
    var textInput = document.getElementById("landid2").value;
    textInput = textInput.replace(/[^0-9-]/g, "");
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


function countrycheck(countryid){

str=document.getElementById(countryid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(countryid).value=str;
	
}

function validatecountry(){
    var textInput = document.getElementById("countryid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("countryid").value = textInput;
}

function statecheck(stateid){
	
str=document.getElementById(stateid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(stateid).value=str;

}

function validatestate(){
    var textInput = document.getElementById("stateid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("stateid").value = textInput;
}

function citycheck(stateid){
	
str=document.getElementById(cityid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(cityid).value=str;
	
}

function validatecity(){
    var textInput = document.getElementById("cityid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("cityid").value = textInput;
}

function pincheck(pinid){
	
str=document.getElementById(pinid).value;
str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
document.getElementById(pinid).value=str;

}

function validateemail(){
    var textInput = document.getElementById("email").value;
    textInput = textInput.replace(/[^A-Za-z0-9_@.]/g, "");
    document.getElementById("email").value = textInput;
}
</script>
				          <script type="text/javascript">
function fleetmanagement(){
	var type=document.getElementById('typeid').value;

	if(type=='fleet management'){
		 document.getElementById('chairmanid').style.display='none';
		document.getElementById('cno_id').style.display='none';
		document.getElementById('principalid').style.display='none';
		document.getElementById('pno_id').style.display='none'; 
		
		document.getElementById('chairmanid').value='null';
		document.getElementById('cno_id').value='null';
		document.getElementById('principalid').value='null';
		document.getElementById('pno_id').value='null';
		
	}
	else if(type=='private'){
		 document.getElementById('chairmanid').style.display='none';
		document.getElementById('cno_id').style.display='none';
		document.getElementById('principalid').style.display='none';
		document.getElementById('pno_id').style.display='none'; 
		
		document.getElementById('chairmanid').value='null';
		document.getElementById('cno_id').value='null';
		document.getElementById('principalid').value='null';
		document.getElementById('pno_id').value='null';
		
	}
	
	else{
		document.getElementById('chairmanid').style.display='block';
		document.getElementById('cno_id').style.display='block';
		document.getElementById('principalid').style.display='block';
		document.getElementById('pno_id').style.display='block';
	}
}


</script>
	<jsp:include page="footer.jsp"></jsp:include>			          