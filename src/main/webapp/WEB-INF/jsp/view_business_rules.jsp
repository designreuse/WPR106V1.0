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
			          <h2>Business Rules Information</h2>
			        </div>
			    				
<div style="display:none" id="div">
						<div class="searchpanel">
						<form action="findBusinessRules" method="GET">
							 
							<table >
							  <tr>
							    <td align="left" valign="middle" width="10%">Org Name :</td>
							    <td align="left" valign="middle" width="10%">
							    
							     <select   id="e1"style="width:300px;" name="org_name">
							      
							    <c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    <option value="${vieworgBusinessRules1.org_name}">${vieworgBusinessRules1.org_name}</option>
							    </c:forEach>
							    </select>

							    

<!-- <input type="text" id="firstname" name="firstname" value=""> -->
							    </td>
							    <td align="left" valign="middle" width="8%">&nbsp;Branch:</td>
							     <td align="left" valign="middle" width="10%">
							       <select style="width:300px;"  id="e2" name="branch" >
							    <c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    <option value="${vieworgBusinessRules1.branch}">${vieworgBusinessRules1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="30%">
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
								
         						<td valign="top" align="left" width="1%">Organization</td>
					         	<td valign="top" align="left" width="2%">Branch</td>
					         	<td valign="top" align="left" width="2%">UseMap</td>
          						<td valign="top" align="left" width="12%">PickUp Start/end</td>          						
          						<td valign="top" align="left" width="11%">Drop Start/end</td>
          						<td valign="top" align="left" width="13%">KGDrop Start/end</td>
          						<td valign="top" align="left" width="9%">Speed Limit</td>
          						<td valign="top" align="left" width="9%">SMS Option</td>          						
          						<td valign="top" align="left" width="13%">Action</td>          						
        					</tr></table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) gt 0 }">
        					
        					<c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules" varStatus="status">
        				       <tr class="row1">
        				       
        				       <td valign="top" align="left" width="10%">${vieworgBusinessRules.org_name}</td>
					         	<td valign="top" align="left" width="3%">${vieworgBusinessRules.branch}</td>
					         	<td valign="top" align="center" width="8%">${vieworgBusinessRules.google_map_traffic}</td>
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.pickup_start_time } &#47; ${vieworgBusinessRules.pickup_end_time }</td>          						
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.drop_start_time } &#47; ${vieworgBusinessRules.drop_end_time }</td>
          						<td valign="top" align="center" width="14%">${vieworgBusinessRules.kg_start_time } &#47; ${vieworgBusinessRules.kg_end_time }</td>
          						<td valign="top" align="center" width="15%">${vieworgBusinessRules.speed_limit }</td>
          						<td valign="top" align="left" width="2%">${vieworgBusinessRules.sms_options }</td> 
        				        <td valign="top" align="right" width="17%">
							    <a href="<c:out value="editbusinessrulesadmin?org_name=${vieworgBusinessRules.org_name}&branch=${vieworgBusinessRules.branch}"/>"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>
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