<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
<tr>
<td valign="top" align="left">
<div>
        
            <div class="headings altheading">
              <h2>Search</h2> </div>
           </div>
           </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>

					
					<form name="grid" onSubmit="return validate(this)" action="vieworg" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
							<tr class="title">
								<td valign="center" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
         						<td valign="top" align="left" width="18%"> Registration Number</td>
					         	<td valign="top" align="left" width="16%"> Organization Id</td>
					         	<td valign="top" align="left" width="20%"> Organization Name</td>
          						<td valign="top" align="left" width="15%"> IsActive</td>
          						<td valign="top" align="left" width="25%"> Action</td>

          						
        					</tr>
        					<c:if test="${fn:length(orgregistrationform.orgregistration) gt 0 }">
        					<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="center" align="center" width="5%"><input type="checkbox" value="${orgRegistration.registration_no}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="10%"><a href="orgdetails?registration_no=${orgRegistration.registration_no}">${orgRegistration.registration_no}</a></td>
											<td valign="top" align="left" width="15%">${orgRegistration.org_id}</td>
											<td valign="top" align="left" width="15%">${orgRegistration.org_name}</td>
											<td valign="top" align="left" width="15%">${orgRegistration.is_active}</td>
											
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editorg?registration_no=${orgRegistration.registration_no}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteorg?registration_no=${orgRegistration.registration_no}"/>" onclick="return confirmation()">Remove</a>
									
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
        				<table align="right">
				                  <tr>
				                   
				                    <td><input type="button" class="submit_btn" value="Back" onclick="window.location.href='vieworg'"></td>
				                    <td>&nbsp;&nbsp;</td>
				                    
				                  </tr>
				                  </table>
        				</form>
        			
        				</td>
        				</tr>
        				</table>
        				</div>
        				
        				
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
