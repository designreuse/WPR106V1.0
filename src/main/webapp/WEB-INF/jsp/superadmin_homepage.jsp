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
			          <h2>Admin   Home</h2><div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">
<form action="findsuperadminhome" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Org Name &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							   <c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin1" varStatus="status">
							    <option value="${superAdmin1.org_name}">${superAdmin1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Branch  &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e2"style="width:250px;" name="branch">
							 	<option value="">Select None</option>     
							   <c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin1" varStatus="status">
							    <option value="${superAdmin1.branch}">${superAdmin1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="20%"><br/>
							    <input type="submit" class="btn" value="Search" ></td>
							
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
									<!-- <td valign="middle" align="center" width="1%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="23.8%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="15%"> Branch Name</td>
          						<td valign="top" align="left" width="14%"> No.of Busses</td>
          						<td valign="top" align="left" width="25%"> No.of Students</td>



								</tr></table><div class="Panel_One_Inner">
								<table cellpadding="0" cellspacing="0" border="0" class="order-table table" style="table-layout: fixed;width:100%">
								<!-- Display Admin Userd here  Suresh--> 
								<c:if test="${fn:length(superAdminHomeForm.superAdminHome) gt 0 }">
									<c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,'row_hover');" onmouseout="mouse_event(this,'row1');">
								           	<td valign="top" align="left" style="overflow:hidden;" width="25%">${superAdmin.org_name}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="16%">${superAdmin.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%">${superAdmin.no_of_vechicle}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="25%">${superAdmin.no_of_student}</td>
										</tr>
							    	</c:forEach></c:if>
							    <c:if test="${fn:length(superAdminHomeForm.superAdminHome) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Data Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%"> &#9660;</td>
          						
          						
        					</tr></table>
								</td>
							</tr>
							
							</table>
								
							</div></div>
<jsp:include page="footer.jsp"></jsp:include>
