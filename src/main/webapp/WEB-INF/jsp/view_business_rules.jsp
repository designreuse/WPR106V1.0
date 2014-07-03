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
			          <h2>Business Rules Information</h2><div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='view_business_rule' class="btn" >Back to view</a>
						</div>
			        </div>
			    				
<div style="display:none" id="div">
						<div class="searchpanel">
						<form action="findBusinessRules" method="GET">
							 
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							  <tr>
							    <td align="left" valign="middle" width="10%"><span style="line-height:8px;">&nbsp;Organization Name :&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    
							     <select   id="e1"style="width:300px;" name="org_name">
							      <option selected>-- Select Organization--</option>
							    <c:forEach items="${orgBusinessRuleForm1.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    
							    <option value="${vieworgBusinessRules1.org_name}" <c:if test="${org_name==vieworgBusinessRules1.org_name}"><c:out value="Selected"/></c:if>>${vieworgBusinessRules1.org_name}</option>
							    </c:forEach>
							    </select>
							    </td>
							    <td align="left" valign="middle" width="8%"><span style="line-height:8px;">&nbsp;Branch:&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select style="width:300px;"  id="e2" name="branch" >
							    <option selected>-- Select Branch --</option>
							    <c:forEach items="${orgBusinessRuleForm1.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    <option value="${vieworgBusinessRules1.branch}" <c:if test="${branch==vieworgBusinessRules1.branch}"><c:out value="Selected"/></c:if>>${vieworgBusinessRules1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="30%"><br/>
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
								
         						<td valign="top" align="left" width="20%"><span style="line-height:12px;font-weight:bold;"><br/>Organization Name</span></td>
					         	<td valign="top" align="left" width="13%"><span style="line-height:12px;font-weight:bold;"><br/>&nbsp;Branch</span></td>
					         	<td valign="top" align="left" width="5%"><span style="line-height:12px;font-weight:bold;"><br/>&nbsp;&nbsp;&nbsp;Use<br/>&nbsp;&nbsp;&nbsp;Map</span></td>
          						<td valign="top" align="left" width="13%"><span style="line-height:12px;font-weight:bold;"><br/>&nbsp;&nbsp;&nbsp;PickUp <br/>&nbsp;&nbsp;&nbsp;Start/end</span></td>          						
          						<td valign="top" align="left" width="13%"><span style="line-height:12px;font-weight:bold;"><br/>&nbsp;&nbsp;&nbsp;&nbsp;Drop <br/>&nbsp;&nbsp;&nbsp;&nbsp;Start/end</span></td>
          						<td valign="top" align="left" width="13%"><span style="line-height:12px;font-weight:bold;"><br/>&nbsp;&nbsp;&nbsp;&nbsp;KGDrop <br/>&nbsp;&nbsp;&nbsp;&nbsp;Start/end</span></td>
          						<td valign="top" align="left" width="7%"><span style="line-height:12px;font-weight:bold;">Speed<br/> Limit<br/>(kmph)</span></td>
          						<td valign="top" align="left" width="5%"><span style="line-height:12px;font-weight:bold;"><br/>SMS <br/>Option</span></td>          						
          						<td valign="top" align="left" width="7%">Action</td>          						
        					</tr></table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%"class="order-table table">
							<c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) gt 0 }">
        					
        					<c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules" varStatus="status">
        				       <tr class="row1">
        				       
        				       <td valign="top" align="left" style="overflow:hidden;"width="20%">${vieworgBusinessRules.org_name}</td>
					         	<td valign="top" align="left" style="overflow:hidden;"width="13%">&nbsp;${vieworgBusinessRules.branch}</td>
					         	<td valign="top" align="center" style="overflow:hidden;"width="5%">${vieworgBusinessRules.google_map_traffic}</td>
          						<td valign="top" align="center" style="overflow:hidden;"width="13%">${vieworgBusinessRules.pickup_start_time } &#47; ${vieworgBusinessRules.pickup_end_time }</td>          						
          						<td valign="top" align="center" style="overflow:hidden;"width="13%">${vieworgBusinessRules.drop_start_time } &#47; ${vieworgBusinessRules.drop_end_time }</td>
          						<td valign="top" align="center" style="overflow:hidden;"width="13%">${vieworgBusinessRules.kg_start_time } &#47; ${vieworgBusinessRules.kg_end_time }</td>
          						<td valign="top" align="left" style="overflow:hidden;"width="7%">&nbsp;${vieworgBusinessRules.speed_limit }</td>
          						<td valign="top" align="left" style="overflow:hidden;"width="5%">${vieworgBusinessRules.sms_options }</td> 
        				        <td valign="top" align="left" style="overflow:hidden;"width="7%">
							    <a href="<c:out value="editbusinessrulesadmin?org_name=${vieworgBusinessRules.org_name}&branch=${vieworgBusinessRules.branch}"/>"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
							    <a href="<c:out value="deleteadminbrules?org_name=${vieworgBusinessRules.org_name}&branch=${vieworgBusinessRules.branch}"/>" onclick="return confirm('Are you sure want to delete?')"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
								</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Business Rules Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr></table>
        				
        				
        				</td>
        				</tr>
        				</table></div></div>

<table width="100%"><tr>
<td>
<jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>