<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  <script type="text/javascript" src="resources/js/autoddl/magicsuggest-1.3.1.js"></script>
  <link rel="stylesheet" href="resources/js/autoddl/magicsuggest-1.3.1.css">
   <script type="text/javascript">
        $(document).ready(function() {
            var jsonData = [];
            var cities=new Array();
            var i0=0;
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities[i0]='<c:out value="${classSection.org_name}"></c:out>';
                i0=i0+1;
            '</c:forEach>';
            for(var i0=0;i0<cities.length;i0++) jsonData.push({id:i0,name:cities[i0],status:i0%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            alert(i1);
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities1[i1]='<c:out value="${classSection.branch}"></c:out>';
                i1=i1+1;
            '</c:forEach>';
            for(var i1=0;i1<cities1.length;i1++) jsonData1.push({id:i1,name:cities1[i1],status:i1%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});


            var jsonData2 = [];
            var cities2=new Array();
            var i2=0;
            
			
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities2[i2]='<c:out value="${classSection.class_std}"></c:out>';
                i2=i2+1;
            '</c:forEach>';
            for(var i2=0;i2<cities2.length;i2++) jsonData2.push({id:i2,name:cities2[i2],status:i2%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData3 = [];
            var cities3=new Array();
            var i3=0;
            
			
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities3[i3]='<c:out value="${classSection.section}"></c:out>';
               
                i3=i3+1;
            '</c:forEach>';
            
            for(var i3=0;i3<cities3.length;i3++) jsonData3.push({id:i3,name:cities3[i3],status:i3%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

/* 
            var jsonData4 = [];
            var cities4=new Array();
            var i4=0;
            
			
            '<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration">';
                cities4[i4]='<c:out value="${orgRegistration.branch}"></c:out>';
                i4=i4+1;
           
                '</c:forEach>';            
            for(var i4=0;i4<cities4.length;i4++) jsonData4.push({id:i4,name:cities4[i4],status:i4%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
			
 */            
            var ms7 = $('#ms7').magicSuggest({
                data: jsonData,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
            var ms8 = $('#ms8').magicSuggest({
                data: jsonData1,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
            var ms9 = $('#ms9').magicSuggest({
                data: jsonData2,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });

            var ms10 = $('#ms10').magicSuggest({
                data: jsonData3,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
/*             var ms11 = $('#ms11').magicSuggest({
                data: jsonData4,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
			
 */
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
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%" border="0">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${studentRegistrationForm.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						
				                <tr class="row1">
    						<td width="5%" class="input_txt"></td>
				                  <td valign="middle" align="right" class="input_txt" ><span class="err">*</span> Organization Name:</td>
				                  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                 <input type="hidden" name="org_name" class="org_input_cmbbx" id="orgid" value="${student.org_name}"/>${student.org_name}</td>
				                 
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="drop_point_address" id="drop_location_id" onblur="Validate1('bid')">
							    	<option value="${student.drop_point_address}" selected>${student.drop_point_address}</option>
				                  	</select>
				                  	</div>
				                  	</td>
				                    <td width="15%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2">
                        		<td width="3%" class="input_txt"></td>
                        		<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Branch :</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="hidden" name="branch" id="bid" class="org_input_cmbbx" value="${student.branch}"/>${student.branch}
				                  	
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
				                  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="hidden" class="student_txtbx_height_right" id="inp_id" name="student_roll_no" value="${student.student_roll_no}"/>${student.student_roll_no} <br/>
				                  	<font color="Red" size="+1"><form:errors path="StudentRegistration.student_roll_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name1" value="${student.parent_name1}"/>
					               <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_route_no"></form:errors></font> --></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2">
				                 <td width="3%" class="input_txt"></td>
				                        <td valign="middle" align="right" class="input_txt"><span class="err">*</span> First Name:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="first_name" value="${student.first_name}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.student_class"></form:errors></font></td>
				                     <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Name 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name2" value="${student.parent_name2}"/>
					         <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_location"></form:errors></font>--></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1">
				                <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Last Name</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="last_name" value="${student.last_name}"/>
				                  	      	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.section"></form:errors></font></td>
				                
				         
				                
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_mobile1" value="${student.parent_mobile1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.father_name"></form:errors></font>
					              </td>
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2">
				                
				                <td width="3%" class="input_txt"></td>
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Gender :</td>
						            <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					               <input type="text" class="student_txtbx_height_right" name="parent_mobile2" id="inp_id" value="${student.parent_mobile2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.mobile_number"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Avail Transport Facility :</td>
				                  	<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email1" value="${student.parent_email1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Route No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info1"><select name="pickup_route_no" class="student_txtbx_height_right_ddl" id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" value="${student.pickup_route_no}">
					               <option value="${student.pickup_route_no}" selected>${student.pickup_route_no}</option>
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option> 
			                  </c:forEach>
			                  </select>
			                  </div>
				                  	</td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email2" value="${student.parent_email2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="pickup_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="pickup_point_address" id="pickup_location_id" onblur="Validate1('bid')" >
							    <option value="${student.pickup_point_address}" selected>${student.pickup_point_address}</option>
				                  	</select>
				                  	</div>
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Class:</td>
					               <td valign="middle" align="left" class="input_txt">
					               <div id="info3"> <select name="class_standard" id="class_standard_id" onchange="doAjaxPost_section()" class="student_txtbx_height_right_ddl" >
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
				                  	 <div id="info2"><select name="drop_route_no" class="student_txtbx_height_right_ddl" onchange="doAjaxPost_drop_route_no()" id="drop_route_id">
					               <option value="${student.drop_route_no}" selected>${student.drop_route_no}</option>
					                <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option>
			                  </c:forEach>
			                  
			                  </select> </div>
			                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Section:</td>
					               <td valign="middle" align="left" class="input_txt">
					              <div id="info_section"> <select name="section" id="section_id" class="student_txtbx_height_right_ddl" >
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