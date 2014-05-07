<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

	<form method="POST" action="updateorg">
	

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2>Edit Organization Information</h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${orgregistrationform.orgregistration[0]}" var="orgRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            
	                            <tr class="row1">
				                  <td valign="middle" width="20%"align="left" class="txtinput"><span class="err">*</span> Organization Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <input type="hidden" value="${org_id}" name="org_id"/>
									<input type="hidden" class="org_input_txtbx_height1"  id="oname" name="org_name" oninput="validateAlpha();" onblur="toTitleCase('oname')" value="${orgRegistration.org_name}"/>${orgRegistration.org_name}
				                  	<br/><font color="Red" size="+1"><form:errors path="OrgRegistration.org_name"></form:errors></font>
				                  </td>	
				                  
				                  <td valign="middle" width="27.5%" align="left" class="input_txtlabel"><span class="err">*</span> Office Fax:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="office_fax_id"  name="office_fax" onblur="faxcheck('office_fax_id')" oninput="validatenum();" value="${orgRegistration.office_fax}" />
				                  	
				                  </td>			                   
				              </tr>
				              <tr class="row2">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                	<input type="hidden" class="org_input_txtbx_height1"  id="branchid" name="branch"  oninput="validateAlpha1();" onblur="toTitleCase1('branchid')" value="${orgRegistration.branch}" />${orgRegistration.branch}
				                   <br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Email ID:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" width="60%" onblur="emailcheck('email')" id="email" name="email_id" value="${orgRegistration.email_id}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.email_id"></form:errors></font>
				                  </td>
				               
				                  
				                </tr>
				              <tr class="row1">
				              <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Address:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                 <%--  	<input type="text" class="org_input_txtbx_height1" onkeyup="doAjaxPost()" id="org_address_id" name="address" value="${organisation.address}" />
				                   --%>
				                   <textarea class="input_txtarea_height1"  rows="3" cols="4" style="width:200px;height:50px;" onblur="toTitleCase5('addr_id')" id="addr_id" name="address">${orgRegistration.address}</textarea>
				                   	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.address"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Name:</td>
				                  <td valign="center" align="left" class="input_txt" width="60%" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="chairmanid"  name="chairman_name"  oninput="validateAlpha2();" onblur="toTitleCase2('chairmanid')"value="${orgRegistration.chairman_name}" />
				                  	
				                  </td>
				                 
				                </tr>
				                
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Country:</td>
				                  <td valign=
				                  "top" align="left" class="input_txt" >
				                  	<!-- <select name="country" class="org_input_cmbbx" id="country_id">
				                  	<option>-- Select Country--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="countryid" onblur="countrycheck('countryid')" oninput="validatenum4();" name="country" value="${orgRegistration.country}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.country"></form:errors></font>
				                  </td>
									<td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Chairman Telephone number:</td>
				                  <td valign="center" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="cno_id" oninput="validatenum4();" onblur="cnocheck('cno_id')" name="chairman_telephone_number" value="${orgRegistration.chairman_telephone_number}" />
				                  	
				                  </td>
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> State:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<!-- <select name="state" class="org_input_cmbbx" id="state_id">
				                  	<option>-- Select State--</option>
				                  	</select> -->
				                  	<input type="text" class="org_input_txtbx_height1" id="stateid" onblur="statecheck('stateid')" oninput="validatenum4();" name="state" value="${orgRegistration.state}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.state"></form:errors></font>
				                  
				                  	
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="principalid"  name="principal_name"  oninput="validateAlpha3();" onblur="toTitleCase3('principalid')" value="${orgRegistration.principal_name}" />
				                  	
				                  </td>
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> City:</td>
				                  <td valign="top" align="left" class="input_txt" ">
				                  	<%-- <select name="city" class="org_input_cmbbx" id="city_id">
				                  	<option>-- Select City--</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                   --%>
				                   <input type="text" class="org_input_txtbx_height1" id="cityid" onblur="citycheck('cityid')" oninput="validatenum4();" name="city" value="${orgRegistration.city}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  
				                   </td>
				                
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Principal Telephone Number:</td>
				                  <td valign="top" align="left" class="input_txt"  >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pno_id" oninput="validatenum5();" name="principal_telephone_number" onblur="pnocheck('pno_id')" value="${orgRegistration.principal_telephone_number}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                
				                </tr>
				                
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Pin code:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  	<input type="text" class="org_input_txtbx_height1"  id="pinid" name="pincode" onblur="pincheck('pinid')" oninput="validatenum1();" value="${orgRegistration.pincode}" />
				                  	<br/><font color="Red" size="+1"><span id="errmsg"></span><span id="unique_error"></span><form:errors path="OrgRegistration.pincode"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="transportid"  name="transport_officer_name"  oninput="validateAlpha4();" onblur="toTitleCase4('transportid')" value="${orgRegistration.transport_officer_name}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Type Of Organization:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<select name="type_of_organization" class="org_input_cmbbx" id="typeid" onblur="Validate('typeid')">
				                  	<option value="${orgRegistration.type_of_organization}" selected>${orgRegistration.type_of_organization}</option>
				                  	<option>School</option>
				                  	<option>College</option>
				                  	<option>Fleet Management</option>
				                  	<option>School and College</option>
				                  	<option>Private</option>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle"   align="left" class="input_txtlabel"><span class="err"></span> Transport Officer Number:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1"  id="tno_id"  name="transport_officer_number" oninput="validatenum6();" onblur="tnocheck('tno_id')" value="${orgRegistration.transport_officer_number}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.contact_person_name"></form:errors></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row1">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 1:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum2();" onblur="landcheck1('landid1')" id="landid1" name="office_land_line1" value="${orgRegistration.office_land_line1}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Is Active :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <%-- <input type="text" class="org_input_txtbx_height1" id="inp_id" name="is_active" value="${orgRegistration.is_active}"/> --%>

				                  <c:choose>
				                  <c:when test="${orgRegistration.is_active==1}">
				                  <input type="radio" name="is_active" value="1" checked="checked"/>Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0"/>No&nbsp;&nbsp;

				                  </c:when>
				                   <c:when test="${orgRegistration.is_active==0}">
				                  <input type="radio" name="is_active" value="1" />Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0" checked="checked"/>No&nbsp;&nbsp;
				                  </c:when>
				                  </c:choose>
				                  
				                  </td>
				                  
				                </tr>
				                <tr class="row2">
				                 <td valign="middle" align="left"   class="input_txtlabel"><span class="err">*</span> Office Land Line 2:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" oninput="validatenum3();" onblur="landcheck2('landid2')" id="landid2" name="office_land_line2" value="${orgRegistration.office_land_line2}" />
				                  	<br/><font color="Red" size="+1"><span id="unique_error"></span><form:errors path="OrgRegistration.city"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left"   class="input_txtlabel"></td>
									<td valign="top" align="left" class="input_txt">
				                  		
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                
	                            <tr class="row1">
	                            	<td valign="middle" align="left"   class="input_txtlabel"></td>
				                   <td valign="middle" align="right" class="input_txt"><input id="inp_id" type="submit" class="submit_btn1" value="Update" ></td>
				                   
				                    
				                    <td valign="middle" align="right" class="input_txt"><input type="reset" class="submit_btn1" value="Cancel"  onclick="window.location.href='vieworg'"></td>
				                	<td valign="middle" align="left"   class="input_txtlabel"></td>
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