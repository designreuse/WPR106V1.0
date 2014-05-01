<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>Edit User Details</title>
</head>
<body>
	<form method="POST" action="updateroute" name="update">
	<script type="text/javascript">
$(document).ready(function () {
	//called when key is pressed in textbox
	$("#inp_contact_no").keypress(function (e) {	
	   //if the letter is not digit then display error and don't type anything
	   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
		   {
	      //display error message
	      $("#errmsg").html("Kindly give numbers").show();
	             return false;
	 	 }
	   else{
	  	 $("#errmsg").html("Kindly give numbers").fadeOut();
	  	 }
	 });
});
</script>
<script language="Javascript" type="text/javascript">
 
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 45 && charCode < 47) || (charCode > 31 && charCode < 33))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
 
    </script>
    <script type="text/javascript">
	function validat(){
	
	var x=document.forms["update"]["notification_email"].value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos < 1 || dotpos<atpos+2 || dotpos+2>=x.length)
	  {
	  alert("Not a valid e-mail address");
	  setTimeout(function(){document.getElementById("inp_id_email").focus();}, 1);
	  return false;
	  }


	}
</script>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 >Edit Route Information</h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${routeForm.routes[0]}" var="route"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                 <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span>
				                   Bus Id :</td>
				                   <td valign="top" align="left" class="input_txt">
				                  <select class="org_input_cmbbx" name="bus_id" id="inp_id_validate">
							    <option value="${route.bus_id}" selected>${route.bus_id}</option>
        				    
			                <c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="BusDeviceRegistrations" varStatus="status">
        				          <option value="${BusDeviceRegistrations.bus_id}">${BusDeviceRegistrations.bus_id}</option>
			                  </c:forEach>
			                 </select>
				                </tr>
                                 <tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span>
				                   Route Id :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="hidden" name="route_id" value=" ${route.route_id}">
				                 	  ${route.route_id}</td></tr>
	                           
				                <%--  <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Admin Id :</td>
				                 <td valign="top" align="left" class="input_txt">
				                 <input type="text" class="org_input_txtbx_height1" id="inp_id" name="admin_id" value="${addUser.admin_id}"/>
 								
 				                  </td>
				                </tr>
				                 <tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="org_input_txtbx_height1" id="inp_id" onkeypress="return onlyAlphabets(event,this);" name="name" value="${addUser.name}"/>                 
								
								 </td>
				                </tr>
				                 <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Password :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="password" class="org_input_txtbx_height1" id="inp_id" name="password" value="${addUser.password}"/>
				                  </td>
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> User Type :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="org_input_txtbx_height1" id="inp_id" name="user_access_control" value="${addUser.user_access_control}"/>                 
				                	<c:choose>
				                	<c:when test="${addUser.user_access_control=='Normal'}">
				                	<input type="radio" name="user_access_control" value="Admin"/>Admin User&nbsp;&nbsp;
				                	<input type="radio" name=user_access_control value="Normal" checked="true"/>Normal User&nbsp;&nbsp;
									
				                	</c:when>
				                	<c:when test="${addUser.user_access_control=='Admin'}">
				                	<input type="radio" name="user_access_control" value="Admin"  checked="true"/>Admin User&nbsp;&nbsp;
				                	<input type="radio" name=user_access_control value="Normal"/>Normal User&nbsp;&nbsp;
									
				                	</c:when>
				                	</c:choose>
				                	 
								 </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Contact Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="org_input_txtbx_height1" id="inp_contact_no" name="contact_no" maxlength="10" value="${addUser.contact_no}"/>                 
								 </td>
				                </tr>
				          
				          		<tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Notification Email :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="org_input_txtbx_height1" id="inp_id_email" name="notification_email" value="${addUser.notification_email}"/>                 
								 </td>
				                </tr>
				             --%>      <tr class="row2">
				                   <td valign="middle" align="right" class="input_txt">
				                   <input id="inp_id" type="submit" class="submit_btn1" value="Update" onclick="return validat()"></td>
				                   
				                    
				                    <td valign="middle" align="left" class="input_txt">
				                    <input type="button" class="submit_btn1" value="Cancel"  onclick="window.location.href='viewroute'"></td>
				                  </tr>
				                  </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </body>
				          </html>				          