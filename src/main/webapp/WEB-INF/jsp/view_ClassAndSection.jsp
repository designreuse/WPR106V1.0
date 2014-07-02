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
			          <h2>Class &amp; Section Information</h2><div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='viewclass' class="btn" >Back to View</a>
						</div>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td><div style="display:none" id="div"><div class="searchpanel">
<form action="findclass" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Organization Name &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e1"style="width:300px;" name="org_name">
							 	<option selected>--Select Organization--</option>     
							   <c:forEach items="${classSectionForm1.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.org_name}" <c:if test="${classSection1.org_name==org_name}"> <c:out value="selected"></c:out> </c:if> >${classSection1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Branch  &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e2"style="width:300px;" name="branch">
							 	<option selected>--Select Branch--</option>     
							   <c:forEach items="${classSectionForm1.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.branch}" <c:if test="${classSection1.branch==branch}"> <c:out value="selected"></c:out> </c:if>>${classSection1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Class   &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e3"style="width:300px;" name="class_std">
							 	<option selected>--Select Class--</option>     
							   <c:forEach items="${classSectionForm1.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.class_std}" <c:if test="${classSection1.class_std==class_std}"> <c:out value="selected"></c:out> </c:if>>${classSection1.class_std}</option>
							    </c:forEach>
							    </select></td>
							    </tr>
							    <tr><td><font color="#ccc">.</font></td></tr>
							    <tr>							   
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Section   &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e4"style="width:300px;" name="section">
							 	<option selected>--Select Section--</option>     
							   <c:forEach items="${classSectionForm1.classSections}" var="classSection1" varStatus="status">
							    <option value="${classSection1.section}" <c:if test="${classSection1.section==section}"> <c:out value="selected"></c:out> </c:if>>${classSection1.section}</option>
							    </c:forEach>
							    </select></td>
							   <td><font color="#ccc">.</font></td>
							    <td align="right" valign="middle" width="20%"><br>
							    <input type="submit" class="btn" value="Search" ></td>
							    <td width="10%"><font color="#ccc" >.</font></td>

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
								
         						<td valign="top" align="left" width="20.5%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="15%"> Branch </td>
          						<td valign="top" align="left" width="15.5%">Class</td>
          						<td valign="top" align="left" width="15%"> Section</td>
          						<td valign="top" align="left" width="8%">Service</td>
          						<td valign="top" align="left" width="9%">Action</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
							<c:if test="${fn:length(classSectionForm.classSections) gt 0 }">
        					<c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left" style="overflow:hidden;"width="20.5%" title="${classSection.org_name}">${classSection.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" style="overflow:hidden;"width="15%" title="${classSection.branch}">${classSection.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15.5%" title="${classSection.class_std}">${classSection.class_std}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%" title="${classSection.section}">${classSection.section}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="8%" title="${classSection.service}">${classSection.service}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="9%" >
										
										<a href="<c:out value="editclass?org_name=${classSection.org_name}&branch=${classSection.branch}"/>" style="padding-right:10px;"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
												
										<a href="<c:out value="delete_class?org_name=${classSection.org_name}&branch=${classSection.branch}&class_std=${classSection.class_std}&section=${classSection.section}"/>" onclick="return confirmation('Are you sure want to Delete?')"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
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
	var answer = confirm("Are you Sure You Want to Delete the Class ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
  	<jsp:include page="footer.jsp"></jsp:include>
