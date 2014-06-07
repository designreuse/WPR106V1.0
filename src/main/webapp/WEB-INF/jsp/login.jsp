<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
<style>
.errorblock {
	color: #ff0000;
	/* background-color: #ffEEEE; */
	border: 2px solid #ff0000;
	padding: 8px;
	margin: 16px;
	border-radius:15px;
	
	
}
.txtfld{
	outline: none;
	padding: 10px;
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
	border-color: #3bb9ff;
	-webkit-box-shadow: inset 0px 0px 5px 0px #ddd;
	-moz-box-shadow: inset 0px 0px 5px 0px #ddd;
	box-shadow: inset 0px 0px 5px 0px #86D4FE;
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
	border-color: #3bb9ff;
	-webkit-box-shadow: inset 0px 0px 5px 0px #ddd;
	-moz-box-shadow: inset 0px 0px 5px 0px #ddd;
	box-shadow: inset 0px 0px 5px 0px #86D4FE;
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
<div id="header-wrapper">
	<header id="header" class="5grid-layout" >
		
				<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
	<div class="Login_panel" style="margin-top:10px;padding-top:15px;color:#fff;">
	<table cellpadding="3" cellspacing="0" border="0" width="100%"><tr>
	<td  align="right" width="65%"></td><td width="5%" align="left" style="color:#fff;">
Email </td><td style="color:#fff;"> Password</td><td></td><td></td></tr>
<tr>
<td  align="right"></td>
<td align="left" width="15%"><input type="text" class="txtfld"value="" name="j_username" /></td>
<td><input type="password" value=""class="pass" name="j_password"/></td><td>
<input type="submit" class="btn" value="Login"/></td><td>
<input type="reset" class="submit_btn" value="Reset"/></td></tr>
<tr><td  align="right"></td><td style="color:#fff;">
<input type="checkbox" name="checkboxG1" id="checkboxG1" class="css-checkbox" /><label for="checkboxG1" class="css-label">keep me logged in</label> </td>
<td >
<a href="#login_form" id="login_pop">
<font color="white">Forgot your password?</font></a></td>
<td></td><td></td></tr></table>
</div></form>
<form name="contactform" method="POST" action="contactus">
<div class="Login_side_contact_outline" id="contact-form">
<h1 >
   <img src="resources/images/contact.png" width="360" height="35"/>
</h1>
<br/>
			<input type="text" name="name" id="fname" placeholder="First Name" autocomplete="off" tabindex="1" class="txtinput_small">
			<input type="text" name="name" id="lname" placeholder="Last Name" autocomplete="off" tabindex="1" class="txtinput_small_two">
			<input type="email" name="email" id="email" placeholder="Your e-mail address" autocomplete="off" tabindex="2" class="txtinput">
			<input type="text" name="name" id="oname" placeholder="Organization Name" autocomplete="off" tabindex="1" class="txtinput">
			<input type="text" name="telephone" id="telephone" placeholder="Mobile Number" autocomplete="off" tabindex="3" class="txtinput">
			<input type="tel" name="country" id="country" placeholder="Country" tabindex="4" class="txtinput">
			<textarea name="message" id="message" placeholder="Comments/Questions" tabindex="5" class="txtblock"></textarea>
			<div style="margin:0 0 0 10%;"><a href="javascript: submitform()" class="otherspressableCont subcontact">Submit</a>
			 <span style="margin:0 0 0 15%;">
			<a href="#" class="otherspressableCont resetcontact">Reset</a></span> </div>
</div>
</form>
<div class="syrees_copy_rights">© Copyright 2014, All rights reserved, Deemsys Inc.<br/>
Phone: 00 91 98422 11989 - Fax: 000-111-0000</div><br/>
<div class="Login_page_footer_link"><span style="padding-left:220px;float:center;">Contact Us | Terms of Use | Privacy Policy | Email-Us | Directions | Site Map</span></div>

</header>
</div>

<a href="#x" class="overlay" id="login_form"></a>
        <div class="popup">
            <div class="ThreeDee">Recover Password</div>
            <table cellpadding="5" cellspacing="3">
           <tr>
               <td> <label for="login">Organization Name</label></td>
                <td><input class="textfld123"type="text" id="login" value="" /></td>
            </tr>
            <tr>
              <td>  <label for="password">Branch</label></td>
              <td>  <input class="textfld123"type="text" id="login" value="" /></td></tr>
            <tr>
                <td><label for="password">User Name</label></td>
                <td><input class="textfld123"type="text" id="login" value="" /></td>
            </tr><tr><td></td><td>
            <input type="button" value="Log In" /></td></tr>
</table>
            <a class="close" href="#close"></a>
            
        </div>
        <script type="text/javascript"> 
        function submitform() {   document.contactform.submit(); } 
   </script> 
</body>
</html>