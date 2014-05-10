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
			          <h2>Class &amp; Section View</h2>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td><div style="display:none" id="div"><div class="searchpanel">
<form action="findclass" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel">&nbsp;Org Name &nbsp;<br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							   <c:forEach items="${classSectionForm.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.org_name}">${classSection1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Branch  &nbsp;<br/>
							    <select   id="e2"style="width:250px;" name="branch">
							 	<option value="">Select None</option>     
							   <c:forEach items="${classSectionForm.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.branch}">${classSection1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Class  &nbsp;<br/>
							    <select   id="e3"style="width:250px;" name="class_std">
							 	<option value="">Select None</option>     
							   <c:forEach items="${classSectionForm.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.class_std}">${classSection1.class_std}</option>
							    </c:forEach>
							    </select></td>
							    </tr><tr>							   
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Section  &nbsp;<br/>
							    <select   id="e4"style="width:250px;" name="section">
							 	<option value="">Select None</option>     
							   <c:forEach items="${classSectionForm.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.section}">${classSection1.section}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="20%"><input type="submit" class="pressableButton blue" value="Search" ></td>

							  </tr>
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
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
					         	<td valign="top" align="left" width="15%"> Branch </td>
          						<td valign="top" align="left" width="15%">Class</td>
          						<td valign="top" align="left" width="15%"> Section</td>
          						<td valign="top" align="left" width="15%">service</td>
          						<td valign="top" align="left" width="25%">Operation</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(classSectionForm.classSections) gt 0 }">
        					<c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left" width="15%">${classSection.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" width="15%">${classSection.branch}</td>
											<td valign="top" align="left" width="15%">${classSection.class_std}</td>
											<td valign="top" align="left" width="15%">${classSection.section}</td>
											<td valign="top" align="left" width="15%">${classSection.service}</td>
											<td valign="top" align="left" width="25%">
										
										<a href="<c:out value="editclass?org_name=${classSection.org_name}&branch=${classSection.branch}"/>" style="padding-right:10px;"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>
												
										<a href="<c:out value="deleteclass?org_id=${orgRegistration.org_id}"/>" onclick="return confirmation()"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(classSectionForm.classSections) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Classes Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660</td>
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table></div></div>
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Organization ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
  	<jsp:include page="footer.jsp"></jsp:include>
