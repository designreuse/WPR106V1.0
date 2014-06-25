<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>


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
        	
	            <div class="headings altheading">
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
									<input type="text" class="org_input_txtbx_height1"  id="oname" name="org_name" oninput="validateAlpha();" min="4" maxlength="32" onblur="toTitleCase('oname')"  value="${organisation.org_name}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font>
				                  </td>	
				                  
				                  <td valign="middle" width="27.5%" align="left" class="input_txtlabel"><span class="err">*</span> Office Fax:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="office_fax_id"  name="office_fax" onblur="faxcheck('office_fax_id')" oninput="validatenum();" min="10" maxlength="10"  value="${organisation.office_fax}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.office_fax"></form:errors></font>
				                  </td>			                   
				              </tr>
				              <tr class="row2">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="text" class="org_input_txtbx_height1"  id="branchid" name="branch"  oninput="validateAlpha1();" min="4" maxlength="32" onblur="toTitleCase1('branchid')"  value="${organisation.branch}" />
				                	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.branch"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Email ID:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" onblur="emailcheck('email')" id="email" oninput="validateemail();" name="email_id" value="${organisation.email_id}" onfocus="doAjaxcheckunique()"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Address:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                   <textarea class="textareanew"  rows="3" cols="7" style="width:220px;height:50px;" onblur="toTitleCase5('addr_id')" id="addr_id" name="address" onfocus="doAjaxcheckunique()">${organisation.address}</textarea>
				                   	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Name:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="chairmanid"  name="chairman_name" min="4" maxlength="32"  oninput="validateAlpha2();" onblur="toTitleCase2('chairmanid')"value="${organisation.chairman_name}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.chairman_name"></form:errors></font>
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Country:</td>
				                  <td valign=
				                  "top" align="left" class="input_txt" >
				                  	<!-- <select name="country" class="org_input_cmbbx" id="country_id">
				                  	<option>-- Select Country--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="countryid" min="4" maxlength="32" onblur="countrycheck('countryid')" oninput="validatecountry();" name="country" value="${organisation.country}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.country"></form:errors></font>
				                  </td>
									<td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Telephone number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="cno_id" oninput="validatenum4();" onblur="cnocheck('cno_id')" name="chairman_telephone_number" min="10" maxlength="10" value="${organisation.chairman_telephone_number}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.chairman_telephone_number"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> State:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<!-- <select name="state" class="org_input_cmbbx" id="state_id">
				                  	<option>-- Select State--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="stateid" min="4" maxlength="32" onblur="statecheck('stateid')" oninput="validatestate();" name="state" value="${organisation.state}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.state"></form:errors></font>
				                  
				                  	
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="principalid"  name="principal_name" min="4" maxlength="32" oninput="validateAlpha3();" onblur="toTitleCase3('principalid')" value="${organisation.principal_name}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.principal_name"></form:errors></font>
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
				                   <input type="text" class="org_input_txtbx_height1" min="4" maxlength="32" id="cityid" onblur="citycheck('cityid')" oninput="validatecity();" name="city" value="${organisation.city}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.city"></form:errors></font>
				                  
				                   </td>
				                
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Telephone Number:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pno_id" oninput="validatenum5();" name="principal_telephone_number" onblur="pnocheck('pno_id')" min="10" maxlength="10" value="${organisation.principal_telephone_number}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.principal_telephone_number"></form:errors></font>
				                  </td>
				                
				                </tr>
				                
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Pin code:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pinid" name="pincode" onblur="pincheck('pinid')" oninput="validatenum1();" min="6" maxlength="6" value="${organisation.pincode}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.pincode"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="transportid" min="4" maxlength="32" name="transport_officer_name"  oninput="validateAlpha4();" onblur="toTitleCase4('transportid')" value="${organisation.transport_officer_name}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.transport_officer_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Type Of Organization:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<select name="type_of_organization"  onblur="Validate('typeid')" onchange="fleetmanagement()" id="typeid" style="width:220px;">
				                  	<option value="">-- Select Organization--</option>
				                  	<option value="school"  <c:if test="${organisation.type_of_organization=='school'}"><c:out value="selected"/></c:if>>School</option>
				                  	<option value="college"  <c:if test="${organisation.type_of_organization=='college'}"><c:out value="selected"/></c:if>>College</option>
				                  	<option value="fleet management"  <c:if test="${organisation.type_of_organization=='fleet management'}"><c:out value="selected"/></c:if>>Fleet Management</option>
				                  	<option value="school and college"  <c:if test="${organisation.type_of_organization=='school and college'}"><c:out value="selected"/></c:if>>School and College</option>
				                  	<option value="private"  <c:if test="${organisation.type_of_organization=='private'}"><c:out value="selected"/></c:if>>Private</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.type_of_organization"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="tno_id"  name="transport_officer_number" oninput="validatenum6();" min="10" maxlength="10" onblur="tnocheck('tno_id')" value="${organisation.transport_officer_number}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.transport_officer_number"></form:errors></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 1:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum2();" onblur="landcheck1('landid1')" id="landid1" name="office_land_line1" min="10" maxlength="10" value="${organisation.office_land_line1}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.office_land_line1"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Is Active :</td>
									<td valign="top" align="left" class="input_txt">
				                  	<input type="radio" id="id_yes_active" name="is_active" checked value="1" <c:if test="${organisation.is_active=='1'}"><c:out value="checked=checked"/></c:if>>&nbsp;Yes&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="radio" id="id_no_active" name="is_active" value="0" <c:if test="${organisation.is_active=='0'}"><c:out value="checked=checked"/></c:if>>&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.is_active"></form:errors></font>
				                  
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 2:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum3();" onblur="landcheck2('landid2')" id="landid2" min="10" maxlength="10" name="office_land_line2" value="${organisation.office_land_line2}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.office_land_line2"></form:errors></font>
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
                   <td ><input type="submit" class="btn" value="Save" onclick="return check('this')"></td>
                   <td>
                   
                   <input type="button" class="btn" onclick="window.location.href='orgregistration'" value="Reset" ></td>
                 <td>
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel"></td>
                   </tr>
                 </table>
                  </td>
                
                  </tr>
				        </table><br/><br/><br/><br/></td></tr></table></td></tr></table></table>
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
    textInput = textInput.replace(/[^A-Za-z]/g, "");
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
    textInput = textInput.replace(/[^A-Za-z]/g, "");
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
    textInput = textInput.replace(/[^A-Za-z]/g, "");
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

	/* else if(document.getElementById("email").value!='')
		{
		 var email = document.getElementById("email").value;
		 var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   if(!pattern.test(email)) 
			   {
			   alert("Invalid Email Address");
		    return false;
			   }
		   }
	 */




</script>

 <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

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


<script type="text/javascript">
function fleetmanagement(){
	var type=document.getElementById('typeid').value;

	if(type=='fleet management'){
		document.getElementById('chairmanid').style.display='none';
		document.getElementById('cno_id').style.display='none';
		document.getElementById('principalid').style.display='none';
		document.getElementById('pno_id').style.display='none';
	}
	else if(type=='private'){
		document.getElementById('chairmanid').style.display='none';
		document.getElementById('cno_id').style.display='none';
		document.getElementById('principalid').style.display='none';
		document.getElementById('pno_id').style.display='none';
	}
	else{
		document.getElementById('chairmanid').style.display='block';
		document.getElementById('cno_id').style.display='block';
		document.getElementById('principalid').style.display='block';
		document.getElementById('pno_id').style.display='block';
	}
}


</script>


<!--Check Unique For Orgname and branch  -->
<script type="text/javascript">
function doAjaxcheckunique() {  
	/* alert("hi"); */
	var orgname = $('#oname').val();
	var branch=$('#branchid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/check_unique",  
		    data: "org_name=" + orgname+"&branch="+branch,
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


<jsp:include page="footer.jsp"></jsp:include>

