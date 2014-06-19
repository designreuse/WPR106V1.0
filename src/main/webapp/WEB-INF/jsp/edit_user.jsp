<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
	<form method="POST" action="updateuser">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 >Edit User Information</h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${adduserform.adduser[0]}" var="addUser"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row1">
    						<td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel" width="15%">
				                  <span class="err">*</span>Organization Name</td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  
				                  <input type="hidden" name="org_name" class="org_input_cmbbx" value="${addUser.org_name}"/>${addUser.org_name}
				               <%--  <select class="org_input_cmbbx" name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" >${orgname}</option>
			                  </c:forEach>
			                 </select> --%>
			                 <br/><font color="Red" size="+1"><form:errors path="user.org_name"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Branch </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                 
				                  <input type="hidden" name="branch" class="org_input_cmbbx" value="${addUser.branch}"/>${addUser.branch}
				                 
				                 <%-- <div id="info" style="height:8px; " > 	<select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="">-- Select branch--</option>
							   </select> 
        				       </div> --%>
        				       <br/><font color="Red" size="+1"><form:errors path="user.branch"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> First Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="fname" oninput="validateAlpha();" onblur="toTitleCase('fname')" value="${addUser.firstname }" name="firstname" />
				                  	<br/><font color="Red" size="+1"><form:errors path="user.firstname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
                        		<tr class="row2">
                        		<td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Last Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="lname" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" name="lastname"   value="${addUser.lastname}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="user.lastname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Email </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="eid"  name="email" onblur="emailcheck('eid')"  value="${addUser.email}"/>
				                 <br/><font color="Red" size="+1"><form:errors path="user.email"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> User Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" class="org_input_txtbx_height1" id="uname"  name="username" onblur="user('uname')"  value="${addUser.username}"/>${addUser.username}
				                  	<br/><font color="Red" size="+1"><c:out value="${userexists}"/><form:errors path="user.username"></form:errors></font>
				                  
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Password </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" onblur="passcheck('pass')" id="pass" name="password" value="${addUser.password}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="user.password"></form:errors></font>
				                  </td><td width="15%"></td>
				                  
				                </tr>
				                 <tr class="row2">
				                 <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Re-Enter Password </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="repass" onblur="repasscheck('repass')" name="confirm_password" value="${addUser.confirm_password}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="user.confirm_password"></form:errors></font>
				                  </td><td width="25%"></td>
				                  
				                </tr>
                        		<tr class="row1">
                        		<td>&nbsp;&nbsp;</td>
				                   <td align="right" ><input type="submit" class="btn" value="Update" ></td>
				                   
				                    <td colspan="1"></td>
				                    <td><input type="reset" class="btn" value="Cancel"  onclick="window.location.href='viewuser'"></td>
				                  </tr>
                        	
				        </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </div>
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
	
    str=document.getElementById(fname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(fname).value=str;
		
}

function validateAlpha1(){
    var textInput = document.getElementById("lname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("lname").value = textInput;
}

function toTitleCase1(lname)
{

    str=document.getElementById(lname).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(lname).value=str;
   

}
</script>				          		          