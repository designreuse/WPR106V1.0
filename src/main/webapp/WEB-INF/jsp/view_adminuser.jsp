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
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='viewuser' class="btn" >Back to View</a>
						</div>
                    
			        </div>
			    
			    
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	
<tr>

<td>

<div style="display:none" id="div"><div class="searchpanel">
<form action="finduser" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="20%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Organization Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e1" style="width:280px;" name="org_name">
							 	<option selected>--Select Organization--</option>     
							    <c:forEach items="${adduserform1.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.org_name}" <c:if test="${org_name==addUser1.org_name}"><c:out value="Selected"/></c:if>>${addUser1.org_name}</option>
							    </c:forEach>
							    </select>
							    
							    </td>
							    
							    
							    <td align="left" valign="middle" width="25%"><span style="line-height:8px;">&nbsp;Branch&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e2"style="width:280px;" name="branch">
									<option selected>--Select Branch--</option>							      
							    <c:forEach items="${adduserform1.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.branch}" <c:if test="${branch==addUser1.branch}"><c:out value="Selected"/></c:if>>${addUser1.branch}</option>
							    </c:forEach>
							    </select>

							    
							  </td>
							  
							    <td align="left" valign="middle" width="25%"><span style="line-height:8px;">&nbsp;First Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e3"style="width:280px;" name="firstname">
								<option selected>--Select First Name--</option>							      
							    <c:forEach items="${adduserform1.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.firstname}" <c:if test="${firstname==addUser1.firstname}"><c:out value="Selected"/></c:if>>${addUser1.firstname}</option>
							    </c:forEach>
							    </select>

							    </td>
							     
							  </tr>
							  <tr><td><font color="#ccc">.</font></td>
                                 <tr>	
							  <tr >
							    
							    <td align="left" valign="middle" width="25%"><span style="line-height:8px;">&nbsp;Last Name&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    	<select   id="e4"style="width:280px;" name="lastname">
							    <option selected>--Select Last Name--</option>  
							    <c:forEach items="${adduserform1.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.lastname}" <c:if test="${lastname==addUser1.lastname}"><c:out value="Selected"/></c:if>>${addUser1.lastname}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="25%"><span style="line-height:8px;">&nbsp;&nbsp;&nbsp;&nbsp;Email&nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e5"style="width:300px;" name="email">
							      <option selected>--Select Email--</option>
							    <c:forEach items="${adduserform1.adduser}" var="addUser1" varStatus="status">
							    <option value="${addUser1.email}" <c:if test="${email==addUser1.email}"><c:out value="Selected"/></c:if>>${addUser1.email}</option>
							    </c:forEach>
							    </select>
							    </td>
							  
							    <td align="right" valign="middle" width="25%"><br/>
							    <input type="submit" class="btn" value="Search" ></td>
							    <td width="25%"><font color="#ccc" >.</font></td>
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
								<td valign="top" align="left" width="15.5%"> Organization</td>
         						<td valign="top" align="left" width="14.5%"> Branch</td>
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
							         	    <td valign="top" align="left" style="overflow:hidden;"width="14%"title="${addUser.branch}">${addUser.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%"title="${addUser.firstname}">&nbsp;&nbsp;${addUser.firstname}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%"title="${addUser.lastname}">&nbsp;${addUser.lastname}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="18%"title="${addUser.email}">${addUser.email}</td>
											<td valign="top" align="left"  style="overflow:hidden;"width="12%"title="${addUser.username}">&nbsp;&nbsp;${addUser.username}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="8.5%"title="${addUser.password}">&nbsp;&nbsp;&nbsp;${addUser.password}</td>
											
											
											<td valign="top" align="left" width="9%">&nbsp;&nbsp;&nbsp;
										
												<a href="<c:out value="edituser?username=${addUser.username}"/>" >
												<img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
												<a href="<c:out value="deleteuser?username=${addUser.username}"/>" onclick="return confirm('Are you sure want to Delete?')">
												<img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
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