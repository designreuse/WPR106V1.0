<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="update_student" method="POST">
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
$(document).ready(function () {
	//called when key is pressed in textbox
	$("#inp_age").keypress(function (e) {	
	   //if the letter is not digit then display error and don't type anything
	   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
		   {
	      //display error message
	      $("#errmsg1").html("Kindly give numbers").show();
	             return false;
	 	 }
	   else{
	  	 $("#errmsg1").html("Kindly give numbers").fadeOut();
	  	 }
	 });
	
	$("#inp_contact_no").keypress(function (e) {	
		   //if the letter is not digit then display error and don't type anything
		   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
			   {
		      //display error message
		      $("#errmsg1").html("Kindly give numbers").show();
		             return false;
		 	 }
		   else{
		  	 $("#errmsg1").html("Kindly give numbers").fadeOut();
		  	 }
		 });
	
	}); 
</script>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2>Student Registration</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${studentregistrationform.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Registration Number:</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	&nbsp;&nbsp;&nbsp;
				                  	<c:out value="${student.student_reg_no}"></c:out><input type="hidden" name="student_reg_no" value="${student.student_reg_no}"/>
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Father/Gaurdian Name:</td>
					               <td valign="top" align="left" class="input_txt"><input type="text" onkeypress="return onlyAlphabets(event,this);"class="student_txtbx_height_left" id="inp_id" name="father_name" value="${student.father_name }"></td>
				                
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Organization ID:</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	&nbsp;&nbsp;&nbsp;
				                  	<%-- <input type="hidden" class="input_txtbx1" id="inp_id" name="org_id" value="${student.org_id }" />
				                  	${student.org_id} --%>
				                  	<select class="student_txtbx_edit_right_ddl" name="org_id" id="org_id">
							   
        				    <option value="${student.org_id }" selected>${student.org_id }</option>
			                <c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				          <option value="${OrgRegistration.org_id}">${OrgRegistration.org_id}</option>
			                  </c:forEach>
			                 </select>
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Contact Number:</td>
					                <td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_left" id="inp_contact_no" name="mobile_number" maxlength="10" value="${student.mobile_number }"/><br/><font color="Red" size="+1"></font></td>
				                
				                </tr>
                        		<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student Roll Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="student_roll_no" value="${student.student_roll_no}"/>
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> E-mail Id:</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_left" id="inp_id" name="email_id" value="${student.email_id }" /></br><font color="Red" size="+1"></font></td>
				                
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Name :</td>
						            <td valign="top" align="left" class="input_txt">
						            	<input type="text" class="student_txtbx_height_right" id="inp_id" name="name" onkeypress="return onlyAlphabets(event,this);"value="${student.name}"/>
						            	<br/><font color="Red" size="+1"></font></td>
						            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> PickUp Bus Id:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="student_txtbx_height_left" id="inp_id" name="pickup_bus_id" value="${student.pickup_bus_id }" />
				                  	 --%>
				                  	  <select id="inp_id" class="student_txtbx_edit_left_ddl" name="pickup_bus_id">
				                  	  <option value="${student.pickup_bus_id }" selected>${student.pickup_bus_id }</option>
				                  <c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="bus_id_ddl" varStatus="status">
        				          <option value="${bus_id_ddl.bus_id}">${bus_id_ddl.bus_id}</option>
			                  </c:forEach>
			                  </select>
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Class :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_right" id="inp_id" value="${student.student_class }" name="student_class" /></br><font color="Red" size="+1"></font></td>
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Drop Bus Id:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="student_txtbx_height_left" id="inp_id" name="drop_bus_id" value="${student.drop_bus_id }" />
				                  	 --%>
				                  	 <select id="inp_id" class="student_txtbx_edit_left_ddl" name="drop_bus_id">
				                  	 <option value="${student.drop_bus_id }" selected>${student.drop_bus_id }</option>
				                  <c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="bus_id_ddl" varStatus="status">
        				          <option value="${bus_id_ddl.bus_id}">${bus_id_ddl.bus_id}</option>
			                  </c:forEach>
			                  </select>
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Section:</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_right" id="inp_id" name="section" value="${student.section }"/></br><font color="Red" size="+1"></font></td>
				                  	 <td valign="middle" align="left" class="input_txt"><span class="err">*</span> PickUp Route Id:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="student_txtbx_height_left" id="inp_id" name="pickup_route_id" value="${student.pickup_route_id }" />
				                  	 --%>
				                  	 <select id="pickup_route_bus_id" class="student_txtbx_edit_left_ddl" name="pickup_route_id">
				                  <option value="${student.pickup_route_id }" selected>${student.pickup_route_id }</option>
				                  <c:forEach items="${routeForm.routes}" var="route" varStatus="status">
        				          <option value="${route.route_id}">${route.route_id}</option>
			                  </c:forEach>
			                  </select>
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>	
				                <tr class="row1">
				                 	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Age:</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" maxlenth="3" class="student_txtbx_height_right" id="inp_age" name="age" value="${student.age }"/></br><font color="Red" size="+1"></font></td>
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Drop Route Id:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<%-- <input type="text" class="student_txtbx_height_left" id="inp_id" name="drop_route_id" value="${student.drop_route_id }"/>
				                  	 --%>
				                  	  <select id="inp_id" name="drop_route_id" class="student_txtbx_edit_left_ddl">
				                  	  <option value="${student.drop_route_id }" selected>${student.drop_route_id }</option>
				                  <c:forEach items="${routeForm.routes}" var="route" varStatus="status">
        				          <option value="${route.route_id}">${route.route_id}</option>
			                  </c:forEach>
			                  </select>
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                 <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Gender:</td>
					                <td valign="top" align="left" class="input_txt">
					                <c:choose>
					                <c:when test="${student.gender=='male'}">
					                <input type="radio" name="gender" value="male" class="input_txt"  checked="true" style="margin:0% 0% 0% 13%;">Male&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="female" class="input_txt">Female&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="other" class="input_txt">Other
					                </c:when>
					                
					                <c:when test="${student.gender=='female' }">
					                <input type="radio" name="gender" value="male" class="input_txt"   style="margin:0% 0% 0% 13%;">Male&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="female" class="input_txt" checked="true">Female&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="other" class="input_txt">Other
					                </c:when>
					                
					                <c:when test="${student.gender=='other' }">
					                <input type="radio" name="gender" value="male" class="input_txt"   style="margin:0% 0% 0% 13%;">Male&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="female" class="input_txt" >Female&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="gender" value="other" class="input_txt" checked="true">Other
					                </c:when>
					                
					                </c:choose>
					                </td>
					                
					                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> PickUp Stop ID:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_left" id="inp_id" name="pickup_stop_id" value="${student.pickup_stop_id }" />
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Blood Group:</td>
					                <td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_right" id="inp_id" name="blood_group" value="${student.blood_group }" /></br><font color="Red" size="+1"></font></td>
					                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Drop Stop ID:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_left" id="inp_id" name="drop_stop_id" value="${student.drop_stop_id }" />
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>				                </tr>
				                <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Address:</td>
					               <td valign="top" align="left" class="input_txt">
					              <!--  <input type="text" class="input_txtbx1" id="inp_id" name="address" />
					            -->    
					               <textarea align="left" class="input_txtArea2" style="margin:0% 0% 0% 10%;" name="address"><c:out value="${student.address}"/></textarea>
					               <br/>          
					               <font color="Red" size="+1"></font>
					               
					               </td>
					               <td valign="middle" align="right" class="input_txt"><span class="err"></span></td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" class="input_txtbx1" id="inp_id" name="#" />
				                  	
				                  </td>
				                </tr>
				                
				               
                <tr class="row1">
                <td valign="top" align="right"></td>
				               <td valign="top" align="right"></td>
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" ></td>
               
                  <td valign="top" align="left"><input type="button" class="submit_btn1" onclick="window.location.href='viewstudent'"value="Cancel"></td></tr></table>
                  </td>
                 </table>
                 </td>
                 <td valign="top" align="left"></td>
                 </tr>
              </table></div>
         	</td>
  		</tr>
 	</table>
</form>
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>