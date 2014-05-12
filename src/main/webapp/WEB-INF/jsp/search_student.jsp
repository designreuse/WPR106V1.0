<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>


<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

		<table class="margin_table">
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Student Information</h2><div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
			        </div>
			        
<div style="display:none" id="div"><div class="searchpanel">
 
			        <form action="findstudents" method="GET">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  	<td align="left" valign="middle" width="15%"> Organization Name<br/>
							    <select id="e1" style="width:250px;" name="org_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.org_name}">${studentRegistration.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%">  Branch<br/>
							    <select   id="e2"style="width:250px;" name="branch">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.branch}">${studentRegistration.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%">Student Roll No<br/>
							    <select   id="e3"style="width:250px;" name="student_roll_no">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.student_roll_no}">${studentRegistration.student_roll_no}</option>
							    </c:forEach>
							    </select></td>
							    
							  </tr>
							  <tr>
							  	<td align="left" valign="middle" width="15%">&nbsp; First Name<br/>
							    <select   id="e4"style="width:250px;" name="first_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.first_name}">${studentRegistration.first_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">&nbsp;Last Name<br/>
							    <select   id="e5"style="width:250px;" name="last_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.last_name}">${studentRegistration.last_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="20%">
							    <input type="submit" class="pressableButton blue" value="Search" ></td>
							 
							  </tr>
							</table>
							</form>
							
							</div></div>
							
							
							<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img src="resources/images/filter.png" width="25" height="27"title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
					         	<td valign="top" align="left" width="15%"> Organization Name</td>
					         	<td valign="top" align="left" width="15%"> Branch</td>
					         	<td valign="top" align="left" width="15%"> Roll No</td>
					         	<td valign="top" align="left" width="15%"> First Name</td>
					         	<td valign="top" align="left" width="15%"> Last Name</td>
          						<td valign="top" align="left" width="25%">Operation</td>
          						
        					</tr>
        				</table>
							<div class="Panel_One_Inner">    
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
								<c:if test="${fn:length(studentregistrationform.studentregistration) gt 0 }">
        					    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
        				       			<tr class="row1">
					     		     	<td valign="top" align="left"  style="overflow:hidden;"width="15%">${studentRegistration.org_name}</td>
					     		     	<td valign="top" align="left"  style="overflow:hidden;"width="15%">${studentRegistration.branch}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="15%">${studentRegistration.student_roll_no}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="15%">${studentRegistration.first_name}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="15%">${studentRegistration.last_name}</td>
										<td valign="top" align="left" style="overflow:hidden;"width="25%">
										<a href="<c:out value="edit_student?student_roll_no=${studentRegistration.student_roll_no}&org_name=${studentRegistration.org_name}&branch=${studentRegistration.branch}"/>" ><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>
										<a href="<c:out value="delete_student?student_roll_no=${studentRegistration.student_roll_no}"/>" onclick="return confirm('Are you sure want to delete?')"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
								        <td>
								     </tr>
							    </c:forEach>
							    </c:if>
							     <c:if test="${fn:length(studentregistrationform.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b> No Students Found!!! </b></center></td>
							    	</tr>
							    	</c:if>
        					</table>
        					</div>
        					<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>
        				</table>
        					</td>
        					</tr>
        					</table></div></div><jsp:include page="footer.jsp"></jsp:include>