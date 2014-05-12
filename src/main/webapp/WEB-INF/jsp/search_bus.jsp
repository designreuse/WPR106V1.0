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
			          <h2> Vehicle Information</h2><div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
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


<div style="display:none" id="div"><div class="searchpanel">
 
<form action="findbusInSearch" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel"> Organization Name &nbsp;
							    <br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							       <option value="">Select None</option>
							    <c:forEach items="${busregistrationform.busregistration}" var="BusRegistration1" varStatus="status">
							    <option value="${BusRegistration1.org_name}">${BusRegistration1.org_name}</option>
							    </c:forEach>
							    </select>
							    </td>
							    
								<td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp; Branch &nbsp;
								<br/>
							    <select   id="e2"style="width:250px;" name="branch">
							     <option value="">Select None</option>
							    <c:forEach items="${busregistrationform.busregistration}" var="BusRegistration1" varStatus="status">
							    <option value="${BusRegistration1.branch}">${BusRegistration1.branch}</option>
							    </c:forEach>
							    </select>
								</td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp;Bus Registration No &nbsp;
							    <br/>
							    <select   id="e3"style="width:250px;" name="vechicle_reg_no">
							     <option value="">Select None</option>
							    <c:forEach items="${busregistrationform.busregistration}" var="BusRegistration1" varStatus="status">
							    <option value="${BusRegistration1.vechicle_reg_no}">${BusRegistration1.vechicle_reg_no}</option>
							    </c:forEach>
							    </select>
							    </td>
							    
							  </tr>
							  <tr >
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp;Device IMEI No: &nbsp;
							    <br/>
							    <select   id="e4"style="width:250px;" name="device_imei_number">
							      <option value="">Select None</option>
							    <c:forEach items="${busregistrationform.busregistration}" var="BusRegistration1" varStatus="status">
							    <option value="${BusRegistration1.device_imei_number}">${BusRegistration1.device_imei_number}</option>
							    </c:forEach>
							    </select>
							    </td>
							    
							    <td align="left" valign="middle" width="20%"><br/>
							    <input type="submit" class="btn" value="Search" ></td>
							 
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
         						<td valign="top" align="left" width="10%"> Branch</td>
         						<td valign="top" align="left" width="10%"> Bus Reg No</td>
         						<td valign="top" align="left" width="15%"> Device IMEI No</td>
         						<td valign="top" align="left" width="12%"> Driver Name</td>
					         	<td valign="top" align="left" width="10%"> Licence No</td>
					         	<td valign="top" align="left" width="15%"> Licence Exp Date</td>
					        	<td valign="top" align="left" width="25%"> Action</td>
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							 <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
							<c:if test="${fn:length(busregistrationform.busregistration) gt 0 }">
        					<c:forEach items="${busregistrationform.busregistration}" var="BusRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="top" align="left" style="overflow:hidden;"width="15%">${BusRegistration.org_name}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%">${BusRegistration.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%">${BusRegistration.vechicle_reg_no}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%">${BusRegistration.device_imei_number}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="12%">${BusRegistration.driver_name}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="10%">${BusRegistration.driver_licence_no}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%">${BusRegistration.driver_licence_exp_date}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_bus?vechicle_reg_no=${BusRegistration.vechicle_reg_no}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_bus?org_id=${BusRegistration.vechicle_reg_no}}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach></c:if>
							    <c:if test="${fn:length(busregistrationform.busregistration) == 0}">	
							    	<tr class="row1">
							    	
							    	</tr>
							    	</c:if> </table>
        				
        			</div>
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
