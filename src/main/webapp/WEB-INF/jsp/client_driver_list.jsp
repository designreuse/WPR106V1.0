<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
  	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Driver List<br/></h2>
			          <div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='driverlist' class="btn" >Go Back</a>
						</div>	
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">

			        
						
						<form action="finddriverclient" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							   <td align="left" valign="middle" width="8%">
							   <%-- <select   id="e4"style="width:250px; display:none;" name="org_id">
							 	   
							    <c:forEach items="${busRegistrationForm.busregistration}" var="driverlist" varStatus="status">
							    <option value="${driverlist.org_id}">${driverlist.org_id}</option>
							    </c:forEach>
							    </select> --%>
							   Driver Name:<br/>
							    <select   id="e1"style="width:250px;" name="driver_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${busRegistrationForm1.busregistration}" var="driverlist" varStatus="status">
							    <option value="${driverlist.driver_name}">${driverlist.driver_name}</option>
							    </c:forEach>
							    </select></td>
							     <td align="left" valign="middle" width="10%">Vehicle No:<br/>
							    <select   id="e2"style="width:250px;" name="vechicle_reg_no">
							 	<option value="">Select None</option>     
							    <c:forEach items="${busRegistrationForm1.busregistration}" var="driverlist" varStatus="status">
							    <option value="${driverlist.vechicle_reg_no}">${driverlist.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">License No:<br/>
							    <select   id="e3"style="width:250px;" name="driver_licence_number">
							 	<option value="">Select None</option>     
							    <c:forEach items="${busRegistrationForm1.busregistration}" var="driverlist" varStatus="status">
							    <option value="${driverlist.driver_licence_no}">${driverlist.driver_licence_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="10%">
							  <input type="submit" class="btn" value="Search" >
							  </td>
							 
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
													
					         	<td valign="top" align="left" width="15%">Driver Name</td>
          						<td valign="top" align="left" width="15%">Vehicle No</td>
          						<td valign="top" align="left" width="20%">Driver License No</td>
          						<td valign="top" align="left" width="15%">Driver License Expiry Date</td>
          						
          						
        					</tr>  </table>
						
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(busRegistrationForm.busregistration) gt 0 }">
        					<c:forEach items="${busRegistrationForm.busregistration}" var="DriverRegistration" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left"  width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.vechicle_reg_no}</td>
											<td valign="top" align="left" width="20%">${DriverRegistration.driver_licence_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.driver_licence_exp_date}</td>
											
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(busRegistrationForm.busregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Drivers Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table></div>
        			
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">

          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>  </table>
        				
        				</td>
        				</tr>
        				</table></div></div>

<jsp:include page="footer.jsp"></jsp:include>
 