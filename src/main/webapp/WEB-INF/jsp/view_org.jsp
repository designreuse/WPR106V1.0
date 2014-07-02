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
			          <h2>Organization Information<br/></h2><div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='vieworg' class="btn" >Back to View</a>
						</div>
			        </div>
			    
			       
    	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td>
<div style="display:none" id="div"><div class="searchpanel">
						
 
<form action="findorg" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Organization Name &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select name="org_name" id="e1"style="width:300px;">
							    <option selected>--Select Organization--</option>
							    <c:forEach items="${orgregistrationform1.orgregistration}" var="orgRegistration1" varStatus="status">
							    <option value="${orgRegistration1.org_name}" <c:if test="${org_name==orgRegistration1.org_name}"><c:out value="Selected"/></c:if>>${orgRegistration1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">Branch  &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select name="branch" id="e2"style="width:300px;">
							    <option selected>--Select Branch--</option>
							    <c:forEach items="${orgregistrationform1.orgregistration}" var="orgRegistration1" varStatus="status">
							    <option value="${orgRegistration1.branch}" <c:if test="${branch==orgRegistration1.branch}"><c:out value="Selected"/></c:if>>${orgRegistration1.branch}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;City&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select name="city" id="e3"style="width:300px;">
							    <option selected>--Select City--</option>
							    <c:forEach items="${orgregistrationform1.orgregistration}" var="orgRegistration1" varStatus="status">
							    <option value="${orgRegistration1.city}" <c:if test="${city==orgRegistration1.city}"><c:out value="Selected"/></c:if>>${orgRegistration1.city}</option>
							    </c:forEach>
							    </select></td>
							    
                                 </tr>
                                 <tr><td><font color="#ccc">.</font></td></tr>
                                 <tr>							   
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Country&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select name="country" id="e4"style="width:300px;">
							    <option selected>--Select Country--</option>
							    <c:forEach items="${orgregistrationform1.orgregistration}" var="orgRegistration1" varStatus="status">
							    <option value="${orgRegistration1.country}" <c:if test="${country==orgRegistration1.country}"><c:out value="Selected"/></c:if>>${orgRegistration1.country}</option>
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
								<!-- <td valign="middle" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="19.8%"> Organization Name </td>					         	
					         	<td valign="top" align="left" width="15%"> Branch</td>
          						<td valign="top" align="left" width="13.5%"> City</td>
          						<td valign="top" align="left" width="13.0%"> Country</td>
          						<td valign="top" align="left" width="12.5%"> Org Type</td>
          						<td valign="top" align="left" width="2%">Status</td>
          						<td valign="top" align="left" width="9.5%"> Action</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%"class="order-table table">
							
        					<c:if test="${fn:length(orgregistrationform.orgregistration) gt 0 }">
        					<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<%-- <td valign="middle" align="center" width="15%"><input type="checkbox" value="${orgRegistration.org_name}" name="chkUser"></td> --%>
					     		     	<td valign="top" align="left" style="overflow:hidden;"width="19.2%" title="${orgRegistration.org_name}">${orgRegistration.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" style="overflow:hidden;"width="14.6%" title="${orgRegistration.branch}">${orgRegistration.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="13%" title="${orgRegistration.city}">${orgRegistration.city}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="13.0%" title="${orgRegistration.country}">${orgRegistration.country}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="12.5%" title="${orgRegistration.type_of_organization}">${orgRegistration.type_of_organization}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="5.8%" >
											<c:choose>
											<c:when test="${orgRegistration.is_active==1}">
											<c:out value="Active"></c:out>
											</c:when>
											<c:when test="${orgRegistration.is_active==0}">
											<c:out value="Inactive"></c:out>
											</c:when>
											<c:otherwise>
											<c:out value=""></c:out>
											</c:otherwise>
											</c:choose>
											</td>
											
											<td valign="top" align="left" style="overflow:hidden;"width="8.6%" >
										    <a href="<c:out value="editorg?org_name=${orgRegistration.org_name}&branch=${orgRegistration.branch}"/>">
										    <img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
											<a href="<c:out value="deleteorg?org_name=${orgRegistration.org_name}&branch=${orgRegistration.branch}"/>" onclick="return confirmation('Are you sure Want to Delete?')">
											<img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(orgregistrationform.orgregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Organization Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="101%">
							<tr class="title">
								<!-- <td valign="middle" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="right" width="100%">&#9660;</td>					         	
					         	
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table>
						</div></div>
						
						

<jsp:include page="footer.jsp"></jsp:include>
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