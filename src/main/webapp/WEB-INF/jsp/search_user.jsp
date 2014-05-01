<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Admin User Information::Search Result
			          <span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
<tr>

<td>

<div style="display:none" id="div">
<div style="border:#ccc 2px solid; border-bottom-left-radius:10px;border-bottom-right-radius:10px; padding:15px; margin-bottom:20px; background-color:white;"> 
<form action="finduser" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="right" valign="middle" width="15%" class="input_txtlabel"> Org Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="org_id" class="search_txtbx_height12" ></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp; Branch &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="admin_id" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;First Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    
							  </tr>
							  <tr >
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;Last Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Email&nbsp; </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel"> </td>
							    <td align="left" valign="middle" width="20%"><br/><input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="15%"> Organization</td>
         						<td valign="top" align="left" width="15%"> Branch</td>
         						<td valign="top" align="left" width="10%"> FirstName</td>
         						<td valign="top" align="left" width="10%"> LastName</td>
         						<td valign="top" align="left" width="15%"> Email</td>
					         	<td valign="top" align="left" width="10%"> UserName</td>
					         	<td valign="top" align="left" width="10%"> Password</td>
					        	<td valign="top" align="left" width="25%"> Action</td>
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							
        					<c:if test="${fn:length(adduserform.adduser) gt 0 }">
        					<c:forEach items="${adduserform.adduser}" var="addUser" varStatus="status">
        				       					<tr class="row1">
							         	    <td valign="top" align="left"  width="15%">${addUser.org_name}</td>
							         	    <td valign="top" align="left" width="15%">${addUser.branch}</td>
											<td valign="top" align="left" width="10%">${addUser.firstname}</td>
											<td valign="top" align="left" width="10%">${addUser.lastname}</td>
											<td valign="top" align="left" width="15%">${addUser.email}</td>
											<td valign="top" align="left"  width="10%">${addUser.username}</td>
											<td valign="top" align="left" width="10%">${addUser.password}</td>
											
											
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edituser?admin_reg_no=${addUser.username}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteuser?admin_id=${addUser.username}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(adduserform.adduser) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Users Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
					        	<td valign="top" align="right" width="101%"> &#9660;</td>
          						
        					</tr>
        					</table>
        			</div>
        				
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
        	
<script type="text/javascript">
function toggle(a,id){
var div=document.getElementById(id);
if(div.style.display=='none'){
div.style.display='block';
a.innerHTML='<img src="resources/images/search-red-icon.png" style="height:40px;width:70px;" title="Close Search"/>';
}
else{
div.style.display='none';
a.innerHTML='<img src="resources/images/search-blue-icon.png" style="height:40px;width:70px;" title="Open Search"/>';
}
}
</script>
	 

<jsp:include page="footer.jsp"></jsp:include>
