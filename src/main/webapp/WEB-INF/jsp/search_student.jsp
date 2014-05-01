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
           </td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<div class="contentbox">
					
					<form name="grid" onSubmit="return validate(this)" action="viewstudent" method="POST">
    
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="center" align="center" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
					         	<td valign="top" align="left" width="20%"> Registration Number</td>
					         	<td valign="top" align="left" width="15%"> Roll Number</td>
					         	<td valign="top" align="left" width="15%"> Name</td>
					         	<td valign="top" align="left" width="15%"> Class</td>
					         
          						<td valign="top" align="left" width="25%">Action</td>
          						
        					</tr>
        						<c:if test="${fn:length(studentregistrationform.studentregistration) gt 0 }">
        					<c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="center" align="center" width="5%"><input type="checkbox" value="${studentRegistration.student_reg_no}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="15%"><a href="student_details?student_reg_no=${studentRegistration.student_reg_no}">${studentRegistration.student_reg_no}</a></td>
									    <td valign="top" align="left" width="15%">${studentRegistration.student_roll_no}</td>
									    <td valign="top" align="left" width="15%">${studentRegistration.name}</td>
									    <td valign="top" align="left" width="15%">${studentRegistration.student_class}</td>
										
										<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_student?student_reg_no=${studentRegistration.student_reg_no}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_student?student_roll_no=${studentRegistration.student_roll_no}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(studentregistrationform.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Students Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        					</table>
        					<table align="right">
				                  <tr>
				                   
				                    <td><input type="button" class="submit_btn" value="Back" onclick="window.location.href='viewstudent'"></td>
				                    <td>&nbsp;&nbsp;</td>
				                    
				                  </tr>
				                  </table>
        				</form>
        				</div>
        				</td>
        				</tr>
        				</table>
        				
        				</div>
        				
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Student ?");
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
