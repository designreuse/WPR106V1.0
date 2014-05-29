<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  
    <script id="script_bid">
    $(document).ready(function() {
        $("#drop_location_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#pickup_location_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#class_standard_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#section_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#drop_route_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#pickup_route_id").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
	<form method="POST" action="update_student">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2> Edit Student Registration</h2>
	            </div>
            <div class="contentbox" style="height:700px;">
              <table cellpadding="0" cellspacing="0"  width="100%" border="0">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${studentRegistrationForm.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						
				                <tr class="row1">
    						<td width="5%"></td>
				                  <td valign="middle" align="right" class="input_txt" ><span class="err">*</span> Organization Name:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                 <input type="hidden" name="org_name" id="orgid" value="${student.org_name}"/>${student.org_name}</td>
				                 
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;"><select name="drop_point_address" id="drop_location_id" style="width:220px;" onblur="Validate1('bid')">
							    	<option value="${student.drop_point_address}" selected>${student.drop_point_address}</option>
				                  	</select>
				                  	</div>
				                  	</td>
				                    <td width="15%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2">
                        		<td width="3%" class="input_txt"></td>
                        		<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Branch :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="branch" id="bid" value="${student.branch}"/>${student.branch}
				                  	
				                  	</td>
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span> KG Drop :</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="checkbox"  id="inp_id" name="kg_drop" value="${student.kg_drop}" />
				                  	
				                  </td>
				                  <td width="15%" class="input_txt"></td>
				                </tr>

								 
								<tr class="row1">
								<td width="3%" class="input_txt"></td>
								<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Student Roll Number:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="hidden" class="student_txtbx_height_right" id="inp_id" name="student_roll_no" value="${student.student_roll_no}"/>${student.student_roll_no} <br/>
				                  	<font color="Red" size="+1"><form:errors path="StudentRegistration.student_roll_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text"  id="inp_id" name="parent_name1" value="${student.parent_name1}"/>
					               <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_route_no"></form:errors></font> --></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2">
				                 <td width="3%" class="input_txt"></td>
				                        <td valign="middle" align="right" class="input_txt"><span class="err">*</span> First Name:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="inp_id" name="first_name" value="${student.first_name}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.student_class"></form:errors></font></td>
				                     <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Name 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_name2" value="${student.parent_name2}"/>
					         <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_location"></form:errors></font>--></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1">
				                <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Last Name</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="inp_id" name="last_name" value="${student.last_name}"/>
				                  	      	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.section"></form:errors></font></td>
				                
				         
				                
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_mobile1" value="${student.parent_mobile1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.father_name"></form:errors></font>
					              </td>
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2">
				                
				                <td width="3%" class="input_txt"></td>
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Gender :</td>
						            <td valign="middle" align="left" class="input_txt">
						             <c:choose>
					                <c:when test="${student.gender=='M'}">
					                <input type="radio" value="M" name="gender" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                <input type="radio" value="F" name="gender">FeMale
					                </c:when>
					                
					                <c:otherwise>
					                <input type="radio" value="M" name="gender">Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                <input type="radio" value="F" name="gender" checked>FeMale
					                
					                </c:otherwise>
					                </c:choose>
						            	
						            	<font color="Red" size="+1"><form:errors path="StudentRegistration.name"></form:errors></font></td>
						            	
						       
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Mobile 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  name="parent_mobile2" id="inp_id" value="${student.parent_mobile2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.mobile_number"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Avail Transport Facility :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<c:choose>
				                  	<c:when test="${student.transport_facility=='yes'}">
				                  	<input type="radio" name="transport_facility" value="yes" class="input_txt" checked="checked">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt">No&nbsp;&nbsp;&nbsp;
				                  	</c:when>
				                  	<c:otherwise>
				                  	<input type="radio" name="transport_facility" value="yes" class="input_txt">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt"  checked="checked">No&nbsp;&nbsp;&nbsp;
				                  	</c:otherwise>
				                  	</c:choose>
				                  	 
				                  <!-- <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.transport_facility"></form:errors></font> -->	
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_email1" value="${student.parent_email1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Route No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info1"><select name="pickup_route_no" id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" style="width:220px;" value="${student.pickup_route_no}">
					               <option value="${student.pickup_route_no}" selected>${student.pickup_route_no}</option>
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option> 
			                  </c:forEach>
			                  </select>
			                  </div>
				                  	</td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_email2" value="${student.parent_email2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="pickup_address" style="height:8px;"><select name="pickup_point_address" id="pickup_location_id"  style="width:220px;" onblur="Validate1('bid')" >
							    <option value="${student.pickup_point_address}" selected>${student.pickup_point_address}</option>
				                  	</select>
				                  	</div>
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Class:</td>
					               <td valign="middle" align="left" class="input_txt">
					               <div id="info3"> <select name="class_standard" id="class_standard_id" style="width:220px;" onchange="doAjaxPost_section()"  >
					               <option value="${student.class_standard}" selected>${student.class_standard}</option>
					               <c:forEach items="${class_std}" var="class_std" varStatus="status">
        				        <option value="${class_std}">${class_std}</option>
			                  </c:forEach> 
					               </select></div>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Route No :</td>
				                  	<td valign="middle" align="left" class="input_txt">
				                  	 <div id="info2"><select name="drop_route_no" style="width:220px;" onchange="doAjaxPost_drop_route_no()" id="drop_route_id">
					               <option value="${student.drop_route_no}" selected>${student.drop_route_no}</option>
					                <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option>
			                  </c:forEach>
			                  
			                  </select> </div>
			                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Section:</td>
					               <td valign="middle" align="left" class="input_txt">
					              <div id="info_section"> <select name="section" id="section_id"  style="width:220px;" >
					               <option value="${student.section}" selected>${student.section}</option>
					               <%-- <c:forEach items="${class_std}" var="classSection" varStatus="status">
        				        <option value="${class_std}">${class_std}</option>
			                  </c:forEach> --%> 
					               </select></div>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				               
					                
                <tr class="row1">
                <td valign="top" align="right"></td>
				               <td valign="top" align="right"></td>
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="btn" value="Update" ></td>
               
                  <td valign="top" align="left"><input type="button" class="btn" onclick="window.location.href='viewstudent'"value="Cancel"></td></tr></table>
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
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>

<script type="text/javascript">
function doAjaxPost_pickup_route_no() {  
	/* alert("hi"); */
	var pickup_route_no = $('#pickup_route_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/pickup_route_no_ajax",  
		    data: "pickup_route_no="+pickup_route_no,
		    success: function(response){  
		
$('#pickup_address').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
	
<script type="text/javascript">
function doAjaxPost_drop_route_no() {  
	/* alert("hi"); */
	var drop_route_no = $('#drop_route_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/drop_route_no_ajax",  
		    data: "drop_route_no="+drop_route_no,
		    success: function(response){  
		
$('#drop_address').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
	</script>

<script type="text/javascript">
function doAjaxPost_section() { 
	alert("calling!!!");
	var orgname = $('#orgid').val();
	var branch=$('#bid').val();
	var classstandard=$('#class_standard_id').val();
	
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/stud_section_ajax",  
		    data: "org_name="+orgname+"&branch="+branch+"&class_standard="+classstandard,
		    success: function(response){
		    	
	$('#info_section').html(response);
	},  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>

<jsp:include page="footer.jsp"></jsp:include>