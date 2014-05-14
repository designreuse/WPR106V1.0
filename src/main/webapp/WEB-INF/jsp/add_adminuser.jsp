<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_orgid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>

<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

<form action="adduser" method="POST" onsubmit="return validate_passwords();">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2> Admin User Registration</h2>
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
    						
    						<tr class="row1">
    						<td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel" width="15%">
				                  <span class="err">*</span>Organization Name</td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                <select  name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" >${orgname}</option>
			                  </c:forEach>
			                 </select>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Branch </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                 <div id="info"> 
				                 	<select style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" disabled="disabled">
							   <option value="">-- Select branch--</option>
							  <%--  <c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				        <option value="${OrgRegistration.org_id}" <c:if test="${adminuser.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if>>${OrgRegistration.branch}</option>
			                  </c:forEach> --%>
			                 
        				      </select>
        				       </div> 
				                  </td><td width="15%"></td>
				                </tr>
				                <!-- <tr class="row2" style="border:none;"><td></td><td></td><td></td><td></td><td></td></tr> -->
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> First Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="fname" oninput="validateAlpha();" onblur="toTitleCase('fname')" value="${adminuser.firstname }" name="firstname" />
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.firstname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
                        		<tr class="row2">
                        		<td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Last Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="lname" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" name="lastname"   value="${adminuser.lastname}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.lastname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Email </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="eid"  name="email" onblur="emailcheck('eid')"  value="${adminuser.email}"/>
				                	<font color="Red" size="+1"><span id="info2"></span></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> User Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="uname"  name="username" onblur="user('uname')" onfocus="doAjaxcheckemail()" value="${adminuser.username}"/>
				                  	<font color="Red" size="+1"><span id="info1"></span></font>
				                  	<%--  <font color="Red" size="+1"><c:out value="${userexists}"/><form:errors path="AddUser.username"></form:errors></font> --%> 
				                  
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Password </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="password"  onblur="passcheck('pass')" id="pass" name="password" onfocus="doAjaxcheckuser()"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.password"></form:errors></font>
				                  </td><td width="15%"></td>
				                  
				                </tr>
				                 <tr class="row2">
				                 <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Re-Enter Password </td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="password" class="org_input_txtbx_height1" id="repass" onblur="repasscheck('repass')" name="confirm_password" />
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.password"></form:errors></font>
				                  </td><td width="25%"></td>
				                  
				                </tr>
                        		
				                
                  <tr class="row1">
                  
                 <td valign="top" align="left"></td>
                 <td valign="top" align="left"></td><td valign="top" align="left"></td>
                  <td valign="top" align="left">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="pressableButton blue"  value="Register" onclick="return check('this')"></td>
                  <td> 
                   <input type="reset" class="pressableButton blue" value="Reset" onclick="window.location.href='adduser'">
                  </td>
                  <td> 
                   <input type="button" class="pressableButton blue" onclick="window.location.href='welcome'" value="Cancel">
                  </td>
                  <td valign="top" align="left"></td>
                  </tr>
                  </table>
                  </td>
				        </tr>       
                 </table>
              </table>
         	</td>
  		</tr>
 	</table>
 	 <c:if test="${emailexists=='Email already exists!'}"><script>alert("Emailid already exists");</script></c:if>
 	 <c:if test="${userexists=='Username already exists!'}"><script>alert("Username already exists");</script></c:if>
</form></div>
    
</div>

<jsp:include page="footer.jsp"></jsp:include>
				
<script>
function validateAlpha(){
    var textInput = document.getElementById("fname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("fname").value = textInput;
}

function toTitleCase(fname)
{
	if(document.getElementById("fname").value==''){
		confirm("First Name is required");
		return false;
	}
	else
		{
    str=document.getElementById(fname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(fname).value=str;
		}
}

function validateAlpha1(){
    var textInput = document.getElementById("lname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("lname").value = textInput;
}

function toTitleCase1(lname)
{
	if(document.getElementById("lname").value==''){
		confirm("Last Name is required");
		return false;
	}
	else
		{
    str=document.getElementById(lname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(lname).value=str;
    }

}

function doAjaxPost_for_orgname() {

	var branch= $('#orgname').val();
	/*   var education = $('#education').val();	 */		
	$.ajax({
		type : "POST",
		url : "/BusTrackingApp/ajax_getorgname",
		data : "branch=" + branch,
		success : function(response) {
			
			$('#bid').html(response);
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}


</script>	   

<script>
function check(){
if(document.getElementById("fname").value==''){
	confirm("First Name is required");
	return false;
}
else if(document.getElementById("lname").value==''){
	confirm("Last Name is required");
	return false;
}
if(document.getElementById("eid").value==''){
	confirm("Email Address is required");
		return false;

		}
		}

		
function emailcheck(eid){
	if(document.getElementById("eid").value==''){
		confirm("Email Address is required");
			return false;
			
	}
	else if(document.getElementById("eid").value!='')
		{
		 var email = document.getElementById("eid").value;
		 var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   if(!pattern.test(email)) 
			   {
			   alert("Invalid Email Address");
		    return false;
			   }
		   }
	
}

function user(uname){
	if(document.getElementById("uname").value==''){
		confirm("Username is required");
			return false;
			
	}
}

function passcheck(pass){
	if(document.getElementById("pass").value==''){
		confirm("Password is required");
			return false;
			
	}
}

function repasscheck(repass){
	if(document.getElementById("repass").value==''){
		confirm("Confirm Password is required");
			return false;
			
	}
	
	else if(document.getElementById("pass").value != document.getElementById("repass").value){
		alert("Password and Confirm Password doen not match!!!");
		return false;
	
	}
}


</script>	   
 <script>
function check(){
if(document.getElementById("fname").value==''){
	confirm("First Name is required");
	return false;
}
else if(document.getElementById("lname").value==''){
	confirm("Last Name is required");
	return false;
}
if(document.getElementById("eid").value==''){
	confirm("Email Address is required");
		return false;
		
}
if(document.getElementById("eid").value!='')
	{
	 var email = document.getElementById("eid").value;
	 var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	   if(!pattern.test(email)) 
		   {
		   alert("Invalid Email Address");
	    return false;
		   }
	   }
if(document.getElementById("uname").value==''){
	confirm("User Name is required");
		return false;
		
}

if(document.getElementById("pass").value==''){
	confirm("Password is required");
		return false;
		
}

if(document.getElementById("repass").value==''){
	confirm("Confirm Password is required");
		return false;
		
}

if(document.add_adminuser.password.value != document.add_adminuser.confirm_password.value){
	alert("Password and Confirm Password doen not match!!!");
	return false;
}
}
</script> 

<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_user_ajax",  
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


<script type="text/javascript">
function Validate(orgid)
{
var e = document.getElementById("orgid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a Organization");
}

}
function Validate1(bid)
{
var e = document.getElementById("bid");
var strUser = e.options[e.selectedIndex].value;

var strUser1 = e.options[e.selectedIndex].text;
if(strUser==0)
{
alert("Please Select a branch");
}
}
</script>

<!-- UserName Exists -->

<script type="text/javascript">
function doAjaxcheckuser() {  
	 
	var name = $('#uname').val();
	
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/check_username",  
		    data: "username=" + name,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info1').html(response);

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


<!-- Check Email Exists -->

<script type="text/javascript">
function doAjaxcheckemail() {  
	 
	var email = $('#eid').val();
	
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/check_email",  
		    data: "email=" + email,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info2').html(response);

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
