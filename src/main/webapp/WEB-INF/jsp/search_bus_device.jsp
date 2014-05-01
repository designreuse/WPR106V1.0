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

					<form name="grid"  action="viewbus" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
							<tr class="title">
								<td valign="center" align="center" width="10%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
         						<td valign="top" align="left" width="10%">Bus ID</td>
					         	<td valign="top" align="left" width="15%">Device ID</td>
					         	<td valign="top" align="left" width="15%">IMEI Number</td>
          						<td valign="top" align="left" width="15%">SIM Number</td>
          						<td valign="top" align="left" width="15%">Status</td>
          						<td valign="top" align="left" width="15%">Action</td>
        					</tr>
        					<c:if test="${fn:length(busDeviceRegistrationForm.busDeviceRegistrations) gt 0 }">
        					<c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="BusRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="center" align="center" width="10%"><input type="checkbox" value="${BusRegistration.bus_id}" name="chkUser"></td>
							       		<td valign="top" align="left"  width="10%">${BusRegistration.bus_id}</td>
					     		     	<td valign="top" align="left"  width="15%"><a href="bus_device_details?device_id=${BusRegistration.device_id}">${BusRegistration.device_id}</a></td>
					     		     	
											<td valign="top" align="left" width="15%">${BusRegistration.device_imei_number}</td>
											<td valign="top" align="left" width="15%">${BusRegistration.device_sim_number}</td>
											<td valign="top" align="left" width="15%">
											<c:choose>
											<c:when test="${BusRegistration.isactive==1}">
											<c:out value="ON"></c:out>
											</c:when>
											<c:when test="${BusRegistration.isactive==0}">
											<c:out value="OFF"></c:out>
											</c:when>
											<c:otherwise>
											<c:out value=""></c:out>
											</c:otherwise>
											</c:choose>
											</td>
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_bus_device?device_id=${BusRegistration.device_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_bus_device?device_id=${BusRegistration.device_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
					</c:if>
					<c:if test="${fn:length(busDeviceRegistrationForm.busDeviceRegistrations) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Bus and Devices Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				<table align="right">
				                  <tr>
				                   
				                    <td><input type="button" class="submit_btn" value="Back" onclick="window.location.href='view_bus_device'"></td>
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
