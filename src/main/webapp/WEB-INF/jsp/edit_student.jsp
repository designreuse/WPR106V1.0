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
	<form method="POST" action="update_bus">

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
	              <h2> Edit Student Registration</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${studentregistrationform.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						
				                <tr class="row1">
    						<td width="5%" class="input_txt"></td>
				                  <td valign="middle" align="right" class="input_txt"  ><span class="err">*</span> Organization Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                 <input type="hidden" name="org_name" class="org_input_cmbbx" value="${studentregistration.org_name}"/>${studentregistration.org_name}
				                 
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="drop_point_address" id="drop_location_id" onblur="Validate1('bid')">
							    <option value="Selected">-- Select Drop Location--</option>
				                  	</select>
				                  	</div>
				                    <td width="15%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2">
                        		<td width="5%" class="input_txt"></td>
                        		<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Branch :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="branch" class="org_input_cmbbx" value="${studentregistration.branch}"/>${studentregistration.branch}
				                  	
				                  	</td>
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span> KG Drop :</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="checkbox"  id="inp_id" name="kg_drop" value="${studentregistration.kg_drop}" />
				                  	
				                  </td>
				                  <td width="15%" class="input_txt"></td>
				                </tr>

								 
								<tr class="row1">
								<td width="5%" class="input_txt"></td>
								<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student Roll Number :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="student_roll_no" value="${studentregistration.student_roll_no}"/><br/>
				                  	<font color="Red" size="+1"><form:errors path="StudentRegistration.student_roll_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name1" value="${studentregistration.parent_name1}"/>
					               <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_route_no"></form:errors></font> --></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2">
				                 <td width="5%" class="input_txt"></td>
				                        <td valign="middle" align="right" class="input_txt"><span class="err">*</span> First Name:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="first_name" value="${studentregistration.first_name}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.student_class"></form:errors></font></td>
				                     <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Name 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name2" value="${studentregistration.parent_name2}"/>
					         <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_location"></form:errors></font>--></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1">
				                <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Last Name</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="last_name" value="${studentregistration.last_name}"/>
				                  	      	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.section"></form:errors></font></td>
				                
				         
				                
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_mobile1" value="${studentregistration.parent_mobile1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.father_name"></form:errors></font>
					              </td>
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2">
				                
				                <td width="5%" class="input_txt"></td>
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Gender :</td>
						            <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            	<input type="radio" value="M" name="gender" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="F" name="gender">FeMale
						            	<font color="Red" size="+1"><form:errors path="StudentRegistration.name"></form:errors></font></td>
						            	
						       
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Mobile 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" name="parent_mobile2" id="inp_id" value="${studentregistration.parent_mobile2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.mobile_number"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Avail Transport Facility :</td>
				                  	<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	 <input type="radio" name="transport_facility" value="1" class="input_txt" checked="checked">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="0" class="input_txt">No&nbsp;&nbsp;&nbsp;
				                  <!-- <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.transport_facility"></form:errors></font> -->	
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email1" value="${studentregistration.parent_email1}" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Route No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info1"><select name="pickup_route_no" class="student_txtbx_height_right_ddl" id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" value="${studentregistration.pickup_route_no}">
					               <option value="" selected>--Select PickUp Route No--</option>
					               <%-- <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option> 
			                  </c:forEach>--%>
			                  </select>
			                  </div>
				                  	</td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email2" value="${studentregistration.parent_email2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="pickup_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="pickup_point_address" id="pickup_location_id" onblur="Validate1('bid')" ">
							    <option value="Selected">-- Select PickUp Location--</option>
				                  	</select>
				                  	</div>
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Class:</td>
					               <td valign="middle" align="left" class="input_txt">
					               <div id="info3"> <select name="class_standard" id="class_standard_id" onchange="doAjaxPost_section()" class="student_txtbx_height_right_ddl" >
					               <option value="" selected>--Select Class--</option>
					               <%-- <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.class_std}">${classSection.class_std}</option>
			                  </c:forEach> --%>
					               </select></div>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Route No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info2"><select name="drop_route_no" class="student_txtbx_height_right_ddl" onchange="doAjaxPost_drop_route_no()" id="drop_route_id">
					               <option value="" selected>--Select Drop Route No--</option>
					               <%-- <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option>
			                  </c:forEach> --%>
			                  
			                  </select> </div>
			                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Section:</td>
					               <td valign="top" align="left" class="input_txt">
					              <div id="info_section"> <select name="section" id="section_id" class="student_txtbx_height_right_ddl">
					               <option value="" selected>--Select Section--</option>
					               <%-- <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.section}">${classSection.section}</option>
			                  </c:forEach> --%>
					               </select></div>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
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