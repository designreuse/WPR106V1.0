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
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Branch </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                 
				                  <input type="hidden" name="org_name" class="org_input_cmbbx" value="${addUser.branch}"/>${addUser.branch}
				                 
				                 <%-- <div id="info" style="height:8px; " > 	<select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="">-- Select branch--</option>
							   </select> 
        				       </div> --%>
        				       
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> First Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="fname" oninput="validateAlpha();" onblur="toTitleCase('fname')" value="${addUser.firstname }" name="firstname" />
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.firstname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
                        		<tr class="row2">
                        		<td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Last Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="lname" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" name="lastname"   value="${addUser.lastname}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.lastname"></form:errors></font>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Email </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="eid"  name="email" onblur="emailcheck('eid')"  value="${addUser.email}"/>
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row2">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> User Name </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" class="org_input_txtbx_height1" id="uname"  name="username" onblur="user('uname')"  value="${addUser.username}"/>${addUser.username}
				                  	<br/><font color="Red" size="+1"><c:out value="${userexists}"/><form:errors path="AddUser.username"></form:errors></font>
				                  
				                  </td><td width="15%"></td>
				                </tr>
				                <tr class="row1">
				                <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Password </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" onblur="passcheck('pass')" id="pass" name="password" value="${addUser.password}" />
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.password"></form:errors></font>
				                  </td><td width="15%"></td>
				                  
				                </tr>
				                 <tr class="row2">
				                 <td width="15%"></td>
				                  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Re-Enter Password </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="repass" onblur="repasscheck('repass')" name="confirm_password" value="${addUser.confirm_password}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="AddUser.password"></form:errors></font>
				                  </td><td width="25%"></td>
				                  
				                </tr>
                        		<tr class="row1">
                        		<td>&nbsp;&nbsp;</td>
				                   <td align="right" ><input type="submit" class="submit_btn" value="Update" ></td>
				                   
				                    <td colspan="1"></td>
				                    <td><input type="reset" class="submit_btn" value="Cancel"  onclick="window.location.href='viewuser'"></td>
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