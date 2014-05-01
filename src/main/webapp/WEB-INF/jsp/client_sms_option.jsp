<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
<jsp:include page="header.jsp"></jsp:include>
<style>
.errorblock {
	color: #ff0000;
	/* background-color: #ffEEEE; */
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>


<form action="insert_class_section" method="POST">
<table class="margin_table">

      <tr>
      
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>SMS Option</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%" ><span class="err">*</span> Route :</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select class="org_input_cmbbx" name="org_id" style="height:25px;">
				                  	<option value="">-- Organization --</option>
				                  	<c:forEach items="${orgRegistrationForm.orgregistration}" var="OrgRegistration" varStatus="status">
        				          <option value="${OrgRegistration.org_id}" <c:if test="${class_section.org_id==OrgRegistration.org_id}"><c:out value="Selected"/></c:if>>${OrgRegistration.org_name}</option>
			                  </c:forEach>
				                  	</select>
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               </tr>
				                
                        		<tr class="row2">
                        		<td valign="middle" align="right" class="input_txt" "><span class="err">*</span> Shift:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	
				                  	<select class="org_input_cmbbx" name="branch" id="org_id">
							    <option value="branch1">Shift 1</option>
							      <option value="branch1">Shift 1</option>
							      <option value="branch1">Shift 1</option>
        				     </select>
				                  <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr> 
						  <tr class="row1">
				                <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Trip :</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select class="org_input_cmbbx" name="branch" id="org_id">
							    <option value="branch1">Trip 1</option>
							      <option value="branch1">Trip 2</option>
							      <option value="branch1">Trip 3</option>
        				     </select>
				                </tr>
				                
				                <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> SMS Text:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<input type="text" class="input_txtbx_height1" id="inp_id" name="section" value="${class_section.section}"/>
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr>
				               
				                
                <tr class="row1" >
				              <td valign="top" align="left"></td>
                 
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="submit_btn" value="Submit"></td>
                  
                  
                  
                  </tr>
                  </table></td>                
				              
				               </tr>
                 </table>
                 </td>
                 </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form>
<table width="100%" style="margin:-38.7% 0 0 0;">
<tr>
<td>
			<div class="wrapperMenuSide">
<a href="#" onClick="ddaccordion.expandall('submenuheader'); return false">Expand All</a>
<a href="#" onClick="ddaccordion.collapseall('submenuheader'); return false">collapse all </a>

<div class="glossymenu">
<a class="menuitem"  href="welcome" style="padding-left:35px;back">Home</a>
        
<a class="menuitem submenuheader"  href="#" >Organization</a>
<div class="submenu">
	<ul>
	<li><a href="orgregistration">Organisation Registration</a></li>
	<li><a href="vieworg">Organisation Information</a></li>
	<li><a href="adduser">Admin User Registration</a></li>
	<li><a href="viewuser">Admin User Information</a></li>
	
	</ul>
</div>
<a class="menuitem submenuheader" href="#">Device Management</a>
<div class="submenu">
	<ul>
	<li><a href="changepassword">Device Setup</a></li>
	<li><a href="insert_device">Device Registration</a></li>
	<li><a href="view_devices">Device Information</a></li>	
	</ul>
</div>
   

<a class="menuitem submenuheader" href="#">Bus Management</a>
<div class="submenu">
	<ul>
	<li><a href="busregistration">Bus registration</a></li>
	<li><a href="viewbus">Bus Information</a></li>
	</ul>
</div>
<a class="menuitem submenuheader" href="#">Route Management</a>
<div class="submenu">
	<ul>
	<li><a href="insert_route">Route Registration</a></li>
	<li><a href="viewroute">View Route</a></li>
		</ul>

</div>
<a class="menuitem submenuheader" href="#" style="box-shadow:1px 1px 1px #fff;border:1.7px solid #fff;background: #003366; background-repeat: repeat-x; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#0066cc), to(#003366));background: -webkit-linear-gradient(top, #0066cc, #003366);background: -moz-linear-gradient(top, #0066cc, #003366);background: -ms-linear-gradient(top, #0066cc, #003366);background: -o-linear-gradient(top, #0066cc, #003366);">Class &amp; Section Management</a>	
<div class="submenu">
	<ul>
	<li><a href="addclass" style="background: #3bb9ff;">Class &amp; Section Registration</a></li>
	<li><a href="viewclass">Class &amp; Section view</a></li>
		</ul>

</div>	
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Student Management</a>	
<div class="submenu">
	<ul>
	<li><a href="studentregistration">Student Registration</a></li>
	<li><a href="viewstudent">Student Information</a></li>
		</ul>

</div>	
  
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Business Rules</a>	
<div class="submenu">
	<ul>
	<li><a href="businessrulesregistration">Business Rules Registration</a></li>
	<li><a href="viewbusinessrules">Business Rules View</a></li>
		</ul>

</div>	
<a class="menuitem" href="holidays" style="padding-left:35px;">Holidays</a>
<a class="menuitem" href="reports" style="padding-left:35px;">Reports</a>
<a class="menuitem submenuheader" href="#" style="border-bottom-width: 0">Tracking</a>
<div class="submenu">
	<ul>
	<li><a href="viewmap">Live Track</a></li>
	
		</ul>

</div>
</div>

 	</div></td>
</tr>
</table>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>