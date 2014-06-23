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
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>
                        &nbsp;&nbsp;<a  href='viewstudent' class="btn" >Go Back</a>
						</div>
			        </div>
			        
<div style="display:none" id="div"><div class="searchpanel">
 
			        <form action="findstudents" method="GET">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  	<td align="left" valign="middle" width="15%"><span style="line-height:8px;">&nbsp; Organization Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select id="e1" style="width:300px;" name="org_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform1.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.org_name}" <c:if test="${org_name==studentRegistration.org_name}"><c:out value="Selected"/></c:if>>${studentRegistration.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%"> <span style="line-height:8px;">&nbsp; Branch&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e2"style="width:300px;" name="branch">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform1.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.branch}" <c:if test="${branch==studentRegistration.branch}"><c:out value="Selected"/></c:if> >${studentRegistration.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%"><span style="line-height:8px;">&nbsp;Student Roll No&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e3"style="width:300px;" name="student_roll_no">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform1.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.student_roll_no}" <c:if test="${student_roll_no==studentRegistration.student_roll_no}"><c:out value="Selected"/></c:if>>${studentRegistration.student_roll_no}</option>
							    </c:forEach>
							    </select></td>
							    
							  </tr><tr><td><font color="#ccc">.</font></td></tr>
							  <tr>
							  	<td align="left" valign="middle" width="15%"><span style="line-height:8px;">&nbsp; First Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e4"style="width:300px;" name="first_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform1.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.first_name}" <c:if test="${first_name==studentRegistration.first_name}"><c:out value="Selected"/></c:if>>${studentRegistration.first_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%"><span style="line-height:8px;">&nbsp;Last Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e5"style="width:300px;" name="last_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform1.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.last_name}" <c:if test="${last_name==studentRegistration.last_name}"><c:out value="Selected"/></c:if>>${studentRegistration.last_name}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="right" valign="middle" width="20%"><br>
							    <input type="submit" class="btn" value="Search" ></td>
							    <td width="10%"><font color="#ccc" >.</font></td>
							 
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
					         	<td valign="top" align="left" width="20%"> Organization Name</td>
					         	<td valign="top" align="left" width="15%"> Branch</td>
					         	<td valign="top" align="left" width="15%"> Roll No</td>
					         	<td valign="top" align="left" width="15%"> First Name</td>
					         	<td valign="top" align="left" width="15%"> Last Name</td>
          						<td valign="top" align="left" width="8%">Action</td>
          						
        					</tr>
        				</table>
							<div class="Panel_One_Inner">    
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
								<c:if test="${fn:length(studentregistrationform.studentregistration) gt 0 }">
        					    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
        				       			<tr class="row1">
					     		     	<td valign="top" align="left"  style="overflow:hidden;"width="23%" title="${studentRegistration.org_name}">${studentRegistration.org_name}</td>
					     		     	<td valign="top" align="left"  style="overflow:hidden;"width="17.3%"title="${studentRegistration.branch}">${studentRegistration.branch}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="17.3%"title="${studentRegistration.student_roll_no}">${studentRegistration.student_roll_no}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="17.3%"title="${studentRegistration.first_name}">${studentRegistration.first_name}</td>
									    <td valign="top" align="left" style="overflow:hidden;"width="17.3%"title="${studentRegistration.last_name}">${studentRegistration.last_name}</td>
										<td valign="top" align="left" style="overflow:hidden;"width="8%">
										<a href="<c:out value="edit_student?student_roll_no=${studentRegistration.student_roll_no}&org_name=${studentRegistration.org_name}&branch=${studentRegistration.branch}"/>" ><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
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
        					<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Student ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>