<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<link rel=StyleSheet href="<c:url value="/resources/css/head.css" />" rel="stylesheet" type="text/css" />
<%-- <link href="<c:url value="/resources/css/newstyles/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/newstyles/style-desktop.css" />" rel="stylesheet"  type="text/css" /> --%>
<style>
.errorblock {
	color: #ff0000;
	/* background-color: #ffEEEE; */
	border: 2px solid #ff0000;
	padding: 8px;
	margin: 16px;
	border-radius:15px;
	
	
}
</style>
</head>

<body>
<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
<div class="head">
 <div class="bg"></div>
<table width="100%">
<form name='f' action="<c:url value='j_spring_security_check' />" method='post'>
    <tr>
    <td width="55%" height="103"></td>
      <td width="16%"><span class="l1">Email</span><br />
        <input type="text" value="" name="j_username" placeholder="Email" class="tb" />
      <input type="checkbox"  />Keep me Logged in</td>
      
      <td width="17%" ><span class="l1"> Password</span><br />
          <input type="password" value="" name="j_password" placeholder="password" class="tb" />
          <A href="">Forgot Your Password</A>
                  </td>
      
      <td width="12%">
        <input type="submit" value="Login" class="button" /></td>
        </tr>
         </form>
      </table>
     
      </div>
      <br />
<table width="95%" class="ta">
  <tr>
  <td><img src="resources/images/netalloy_school_building_tattoo_tatoo-1331px.png" width="160" height="83" /> <div class="req"> <span class="req1">Request for demo</span> </div></td>

        </tr>
  <tr>
    <td><input type="text" value="" placeholder="First Name" class="text1" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="Last Name" class="text2" /></td>
  </tr>
  <tr>
    <td>     <input type="text" value="" placeholder="Email Address" class="text3" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="Organaisation Name" class="text4" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="Mobile Number" class="text5" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="Address Line 1" class="text6" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="Address Line 2" class="text7" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="City" class="text8" /></td>
  </tr>
  <tr>
    <td><input type="text" value="" placeholder="State" class="text9" /></td>
  </tr>
  <tr>
  <td align="center"><input type="button" value="Submit"  class="btn" /></td></tr></td>
  </table>
<!-- <img src="/lady.png" width="160" height="179"/ style="margin-left:3cm;" /> -->
<table width="100%" height="132" >

  <tr>
    <td height="84" width="30%" class="footer"><p><img src="resources/images/facebook.png" width="35" height="35" />Facebook.com/tracker</p></td>
    <td height="84" width="30%"><p><img src="resources/images/google+.png" width="35" height="35" />googleplus.com/tracker</p></td>
    <td height="84" width="30%"><p><img src="resources/images/twitter.png" width="35" height="35" />twitter.com/tracker</p></td>
  </tr>
</table>
<p>&nbsp;</p>

</body>
</html>
