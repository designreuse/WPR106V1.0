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
			          <h2>Holidays Information</h2><div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>
                        &nbsp;&nbsp;<a  href='clientviewholiday' class="btn" >Go Back</a>
						</div> 
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td><div style="display:none" id="div"><div class="searchpanel">
<form action="clientfindholidays" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">
							    <span style="line-height:8px;">&nbsp;Date   &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e3"style="width:260px;" name="holiday_date">
							 	<option value="">Select None</option>     
							   <c:forEach items="${holidaysForm1.holidays}" var="holidays" varStatus="status">
							    <option value="${holidays.holiday_date}" <c:if test="${holiday_date==holidays.holiday_date}"><c:out value="Selected"/></c:if>>${holidays.holiday_date}</option>
							    </c:forEach>
							    </select></td>
							    <td align="right" valign="middle" width="5%"><br>
							    <input type="submit" class="btn" value="Search" ></td>
							    <td width="5%"><font color="#ccc">.</font></td>
							    </tr>
							    <tr><td><font color="#ccc">.</font></td></tr>
							   
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
								
         						<td valign="top" align="left" width="25%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="15%"> Branch </td>
          						<td valign="top" align="left" width="15%">Date</td>
          						<td valign="top" align="left" width="15%">Reason</td>
          						<td valign="top" align="left" width="15%">Action</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%">
							<c:if test="${fn:length(holidaysForm.holidays) gt 0 }">
        					<c:forEach items="${holidaysForm.holidays}" var="holiday" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left" style="overflow:hidden;"width="25%" title="${holiday.org_name}">${holiday.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" style="overflow:hidden;"width="15%" title="${holiday.branch}">${holiday.branch}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%" title="${holiday.holiday_date}">${holiday.holiday_date}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%" title="${holiday.holiday_reason}">${holiday.holiday_reason}</td>
											<td valign="top" align="left" style="overflow:hidden;"width="15%" >
										
										<%-- <a href="<c:out value="editholidays?org_name=${holiday.org_name}&branch=${holiday.branch}"/>" style="padding-right:10px;"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>| --%>
												
										<a href="<c:out value="clientdeleteholidays?holiday_date=${holiday.holiday_date}"/>" onclick="return confirmation('Are you sure want to Delete?')"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(holidaysForm.holidays) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Informations Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660</td>
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table></div></div>
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Holiday ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
  	<jsp:include page="footer.jsp"></jsp:include>
