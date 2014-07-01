<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Login Page</title> 
 
 
<link href="<c:url value="/resources/css/newstyles/5grid/core.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/5grid/core-desktop.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/5grid/core-1200px.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/5grid/core-noscript.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/style-desktop.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/5grid/jquery.js" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none" />" rel="stylesheet"  type="text/css" />
<%-- <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
 --%>
 <!--[if IE 9]><link rel="stylesheet" href="css/style-ie9.css" /><![endif]-->
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<style>
.errorblock {
	color: #ff0000;
	/* background-color: #ffEEEE; */
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
.btn {
	background: url(resources/images/bg_buttons.png) 0 -50px;
	border: 1px solid #0D87AE!important;
	color: #fff;
	font-size: 12px;
	padding: 7px 10px;
	border-radius: 2px;
	-moz-border-radius: 7px;
	font-weight:normal;
	border: none;
	font-style:normal;
}
.btn:hover {
	background: url(resources/images/bg_buttons.png) repeat-x top;
	border: 1px solid #005977;
	cursor: pointer;
}
body{
 

/*bacground-size:100% 100%;
overflow-x:hidden; */

}

.txtfld{
	outline: none;
	padding-left: 10px;
	height:20px;
	width: 190px;
	font-family: Helvetica, Arial, "Sans Serif";
	font-size: 13px;
	color: #666;
	border: 1px solid #ccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: inset 0px 0px 5px 0px #eee;
	-moz-box-shadow: inset 0px 0px 5px 0px #eee;
	box-shadow: inset 0px 0px 5px 0px #eee;
	background:#fff;
}

.txtfld:focus {
	border-color: #006633;
	
}

.pass{
	outline: none;
	padding-left: 10px;
	height:20px;
	width: 190px;
	font-family: Helvetica, Arial, "Sans Serif";
	font-size: 13px;
	color: #666;
	border: 1px solid #ccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: inset 0px 0px 10px 0px #eee;
	-moz-box-shadow: inset 0px 0px 10px 0px #eee;
	box-shadow: inset 0px 0px 10px 0px #eee;
	background:#fff;
}

.pass:focus {
	border-color: #006633;
	
}
</style>
</head>
<body onload='document.f.j_username.focus();' >
 <c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if> 
	<script>

	function validate()	
	{
		document.getElementById("oerror").innerHTML="";	
	document.getElementById("ferror").innerHTML="";
	document.getElementById("lerror").innerHTML="";
	document.getElementById("mobiderror").innerHTML="";
	document.getElementById("eiderror").innerHTML="";
	document.getElementById("cityerror").innerHTML="";
	document.getElementById("staterror").innerHTML="";
	
	
	if(document.getElementById("cityid").value.substring(0,1)==' ')
	{
	document.getElementById("cityerror").innerHTML="Invalid City Name";
	return false;
	}
    
    if(document.getElementById("stateid").value.substring(0,1)==' ')
	{
	document.getElementById("staterror").innerHTML="Invalid State Name";
	return false;
	}
    
    if(document.getElementById("orgid").value.substring(0,1)==' ')
	{
	document.getElementById("oerror").innerHTML="Invalid Organization Name";
	return false;
	}
		
		var sub=document.getElementById("fname").value.substring(0,2);
	
		if(sub.substring(0,1)==' ')
		{
		document.getElementById("ferror").innerHTML="Invalid Firstname";
		return false;
		}
		if(sub=='  ')
			{
			document.getElementById("ferror").innerHTML="Invalid Firstname";	
			return false;
			}
		if(sub=='   ')
		{
		document.getElementById("ferror").innerHTML="Invalid Firstname";
		return false;
		}
		if(document.getElementById("lname").value.substring(0,1)==' ')
			{
			document.getElementById("lerror").innerHTML="Invalid Lastname";
			return false;
			}
		
	/* if(document.getElementById("eid").value=="")
	{
	document.getElementById("eiderror").innerHTML="Required Field Should not be Empty";
	
	return false;
	} */
	if(document.getElementById("lname").value!='')
		{
		//alert(document.getElementById("lname").value.length);
		if(document.getElementById("lname").value.length<4)
			{
		document.getElementById("lerror").innerHTML="Lastname must be of length 4 to 32.";
		return false;
			}
		}
	var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
	 if(document.getElementById("eid").value!="")
		{
	if(document.getElementById("eid").value.match(mail)==null)
    {
    	document.getElementById("eiderror").innerHTML="Invalid Email format";
    	
        return false;
    }
		}
    if(document.getElementById("mobid").value!="")
    	{
    	if(document.getElementById("mobid").value.substring(0,5)=='00000')
    		{
    		document.getElementById("mobiderror").innerHTML="Invalid mobile format";
    		return false;
    		}
    	}
    
    
	}
	</script>
<div id="header-wrapper" style=" overflow:hidden;background:url(resources/images/map.png) no-repeat;background-size:110% 100%;">
	<header id="header" class="5grid-layout" >
		<div class="Login_panel">
<form name='f' action="<c:url value='j_spring_security_check' />" method='post'>
	
<table cellpadding="3" cellspacing="0" border="0" width="100%"><tr>
	<td  align="right" width="65%"></td><td width="5%" align="left" style="color:#fff;">
Username </td><td style="color:#fff;"> Password</td><td></td><td></td></tr>
<tr>
<td  align="right"></td>
<td align="left" width="15%"><input type="text" class="txtfld"value="" name="j_username" oninput="validateusername();" placeholder="Username" id="uname" /><span style="color:red" id="urequires"></span></td>
<td><input type="password" value=""class="pass" name="j_password"placeholder="password" id="pswd"/><span style="color:red" id="prequires"></span></td><td>
<input type="submit" class="btn" value="Login"  onclick="return require()"/></td><td>
<input type="reset" class="btn" value="Reset"/></td></tr>
<tr><td  align="right"></td><td style="color:#fff;">
<input type="checkbox" name="checkboxG1" id="checkboxG1" class="css-checkbox" /><label for="checkboxG1" class="css-label">keep me logged in</label> </td>
<td >
<a href="#login_form" id="login_pop">
<font color="white">Forgot your password?</font></a></td>
<td></td><td></td></tr></table>
</form>
</div>
<div class="Login_side_contact_outline" id="contact-form">
<c:if test="${success==true}">
				<div class="table-row1">
					<div class="table-cell1" valign="top" align="left" style="padding: 5px 0 10px 0;margin-left:80px;">&nbsp;
						<div style="width:900px;margin-left:20px;">
							<!-- <p class="closestatus">
								<a title="Close" href="home">X</a>
							</p> -->
							<p>
								<span style="font-family:Helvetica;font-size:15px;color:#00ff00;font-weight: bold;">Thanks for contacting Us.!</span>
							</p>
						</div>
						</div>
				</div>
			</c:if>

<h1 class="ribbon_login">
   <strong class="ribbon_login-content"><span style="color: #fff;">Contact Us</span></strong>
</h1>
<br/><form action="contactus" method='post'>
			<input type="text"name="firstname" id="fname" value="${contact.firstname}" placeholder="First Name" oninput="validateAlpha();" onblur="toTitleCase('fname')" maxlength="32" autocomplete="off" tabindex="1" class="txtinput_small">
			
			<input type="text" name="lastname" id="lname" value="${contact.lastname}" placeholder="Last Name" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" maxlength="32" autocomplete="off" tabindex="2" class="txtinput_small_two">
			<font color="Red"><span id="ferror"><form:errors path="contacts.firstname"></form:errors></span><span id="lerror"></span></font>
    		<input type="text" name="email" id="eid" value="${contact.email}" placeholder="Email Address" autocomplete="off" tabindex="3" class="txtinput">
			 <font color="Red" ><span id="eiderror"><form:errors path="contacts.email"></form:errors></font></span>
    		<input type="text" name="organisation" maxlength="32" id="orgid" value="${contact.organisation}" placeholder="Organaisation Name" oninput="validateAlpha2();" onblur="toTitleCase2('orgid')"autocomplete="off" tabindex="4" class="txtinput">
			 <font color="Red" ><span id="oerror"><form:errors path="contacts.organisation"></form:errors></span></font>
			<input type="text" name="mobile" id="mobid" value="${contact.mobile}" placeholder="Mobile Number" oninput="validatenum();" min="10" maxlength="10" autocomplete="off" tabindex="5" class="txtinput">
			<font color="Red"><span id="mobiderror"><form:errors path="contacts.mobile"></form:errors></span></font>
			<textarea name="address1" id="addr1"  placeholder="Address Line 1"tabindex="6" class="txtblock">${contact.address1}</textarea>
			<font color="Red"  ><form:errors path="contacts.address1"></form:errors></font>
			<%-- <textarea name="address2" id="addr2" value="${contact.address2}" placeholder="Address Line 2" tabindex="7" class="txtblock"></textarea>
			<font color="Red" ><form:errors path="contacts.address2"></form:errors></font> --%>
			<input type="text" name="city"  maxlength="32"  id="cityid" value="${contact.city}" placeholder="City" oninput="validateAlpha3();" onblur="toTitleCase3('cityid')"class="txtinput"/>
			<font color="Red" ><span id="cityerror"><form:errors path="contacts.city"></form:errors></span></font>
			<input type="text" name="state" id="stateid" maxlength="32"  value="${contact.state}" placeholder="State" oninput="validateAlpha4();" onblur="toTitleCase4('stateid')" class="txtinput" />
     		<font color="Red" ><span id="staterror"><form:errors path="contacts.state"></form:errors></span></font><br/>
   			<span style="margin:0  0 0 120px;">
   			<input type="submit" value="Submit" id="submit" class="btn" onclick="return validate()">
   			<input type="reset" value="Reset" class="btn" onclick="window.location.href='login'"></span>
   			</form>
</div>

<!-- <div class="dee_copy_rights">© Copyright 2014, All rights reserved, Deemsys Inc.<br/>
Phone: 00 91 96327 19800 - Fax: 000-111-0000</div> -->
<center><div class="Login_page_footer_link">Contact Us | Terms of Use | Privacy Policy | Email-Us | Directions | Site Map</div></center>

</header>
</div>


</body>
</html>
<script>
function validateAlpha(){
    var textInput = document.getElementById("fname").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("fname").value = textInput;
}

function toTitleCase(fname)
{
	
    str=document.getElementById(fname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(fname).value=str;
	
}
function validateAlpha1(){
    var textInput = document.getElementById("lname").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("lname").value = textInput;
}

function toTitleCase1(lname)
{
	
    str=document.getElementById(lname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(lname).value=str;
	
}
function validateAlpha2(){
    var textInput = document.getElementById("orgid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("orgid").value = textInput;
}

function toTitleCase2(orgid)
{
	
    str=document.getElementById(orgid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(orgid).value=str;
	
}
function validateAlpha3(){
    var textInput = document.getElementById("cityid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("cityid").value = textInput;
}

function toTitleCase3(cityid)
{
	
    str=document.getElementById(cityid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(cityid).value=str;
	
}
function validateAlpha4(){
    var textInput = document.getElementById("stateid").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("stateid").value = textInput;
}

function toTitleCase4(stateid)
{
	
    str=document.getElementById(stateid).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(stateid).value=str;
	
}

function validatenum(){
    var textInput = document.getElementById("mobid").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("mobid").value = textInput;
}

$(function() {
    $("#eid").keydown(function(e) {
        if (e.keyCode == 32) // 32 is the ASCII value for a space
            e.preventDefault();
    });
});

$(function() {
    $("#pswd").keydown(function(e) {
        if (e.keyCode == 32) // 32 is the ASCII value for a space
            e.preventDefault();
    });
});

$(function() {
    $("#cityid").keydown(function(e) {
        if (e.keyCode == 32 && !this.value.length) // 32 is the ASCII value for a space
            e.preventDefault();
    });
});

$(function() {
    $("#stateid").keydown(function(e) {
        if (e.keyCode == 32 && !this.value.length) // 32 is the ASCII value for a space
            e.preventDefault();
    });
});

$(function() {
    $("#orgid").keydown(function(e) {
        if (e.keyCode == 32 && !this.value.length) // 32 is the ASCII value for a space
            e.preventDefault();
    });
});
/* $('#submit').click(function(){
   alert("test");
   $("#fname").on("input", function(e) {
	   alert("test12");
   if (e.which === 32 && !this.value.length)
	   alert("error");
       e.preventDefault();
   });   
}); */
$(function() {
$("#fname").on("keypress", function(e) {
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

function require(){
	document.getElementById("urequires").innerHTML="";
	document.getElementById("prequires").innerHTML="";
	if(document.getElementById("uname").value=="" && document.getElementById("pswd").value==""){
		document.getElementById("urequires").innerHTML="Field should not be Empty";
		document.getElementById("prequires").innerHTML="Field should not be Empty";
		return false;
	}
	else if(document.getElementById("uname").value==""){
		document.getElementById("urequires").innerHTML="Field should not be Empty";
		return false;
	}
	else if(document.getElementById("pswd").value==""){
		document.getElementById("prequires").innerHTML="Field should not be Empty";
		return false;
	}
}

function validateusername(){
    var textInput = document.getElementById("uname").value;
    textInput = textInput.replace(/[^A-Za-z0-9_]/g, "");
    document.getElementById("uname").value = textInput;
}

</script>