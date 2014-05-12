<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
  	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

   <!-- ######################################DDDL END HERE@############################################## -->
  
 <jsp:include page="header.jsp"></jsp:include> 


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			         <h2> View Users</h2><div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
                    
			        </div>
			    
			    
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	
<tr>

<td>

<div style="display:none" id="div"><div class="searchpanel">
<form action="finduserInSearch" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="30%" class="input_txtlabel">&nbsp;Organization Name<br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${adduserform.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.org_name}">${addUser1.org_name}</option>
							    </c:forEach>
							    </select>
							    </td>
							    
							    
							    <td align="left" valign="middle" width="30%">Branch<br/>
							    <select   id="e2"style="width:250px;" name="branch">
									<option value="">Select None</option>							      
							    <c:forEach items="${adduserform.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.branch}">${addUser1.branch}</option>
							    </c:forEach>
							    </select>

							    
							  </td>
							  
							    <td align="left" valign="middle" width="30%">First Name<br/>
							    <select   id="e3"style="width:250px;" name="firstname">
								<option value="">Select None</option>							      
							    <c:forEach items="${adduserform.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.firstname}">${addUser1.firstname}</option>
							    </c:forEach>
							    </select>

							    </td>
							     
							  </tr>
							  <tr >
							    
							    <td align="left" valign="middle" width="30%">Last Name<br/>
							    	<select   id="e4"style="width:250px;" name="lastname">
							    <option value="">Select None</option>  
							    <c:forEach items="${adduserform.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.lastname}">${addUser1.lastname}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="30%">Email<br/>
							    <select   id="e5"style="width:250px;" name="email">
							      <option value="">Select None</option>
							    <c:forEach items="${adduserform.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.email}">${addUser1.email}</option>
							    </c:forEach>
							    </select>
							    </td>
							  
							    <td align="left" valign="middle" width="30%">
							    <input type="submit" class="pressableButton blue" value="Search" ></td>
							 
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
								<td valign="top" align="left" width="15%"> Organization</td>
         						<td valign="top" align="left" width="15%"> Branch</td>
         						<td valign="top" align="left" width="10%"> FirstName</td>
         						<td valign="top" align="left" width="10%"> LastName</td>
         						<td valign="top" align="left" width="18%"> Email</td>
					         	<td valign="top" align="left" width="13%"> UserName</td>
					         	<td valign="top" align="left" width="9%"> Password</td>
					        	<td valign="top" align="left" width="9%"> Action</td>
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
							
        					<c:if test="${fn:length(adduserform.adduser) gt 0 }">
        					<c:forEach items="${adduserform.adduser}" var="addUser" varStatus="status">
        				       					<tr class="row1">
							         	    <td valign="top" align="left" style="overflow:hidden;"width="15%" title="${addUser.org_name}" >${addUser.org_name}</td>
							         	    <td valign="top" align="left" style="overflow:hidden;"width="15%"title="${addUser.branch}">${addUser.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="11%"title="${addUser.firstname}">${addUser.firstname}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%"title="${addUser.lastname}">${addUser.lastname}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="18%"title="${addUser.email}">${addUser.email}</td>
											<td valign="top" align="left"  style="overflow:hidden;"width="13%"title="${addUser.username}">${addUser.username}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="9.5%"title="${addUser.password}">${addUser.password}</td>
											
											
											<td valign="top" align="left" width="7%">
										
												<a href="<c:out value="edituser?username=${addUser.username}"/>" style="padding-right:10px;"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>
												
											<a href="<c:out value="deleteuser?org_name=${addUser.org_name}"/>" onclick="return confirmation()"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(adduserform.adduser) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Users Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table></div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
					        	<td valign="top" align="right" width="101%"> &#9660;</td>
          						
        					</tr>
        					</table>
        			
        				
        				</td>
        				</tr>
        				</table></div></div>
        				
        				
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the User ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>

<script language="javascript">

function selectall(field)
{

	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}
</script>
	 

<jsp:include page="footer.jsp"></jsp:include>
