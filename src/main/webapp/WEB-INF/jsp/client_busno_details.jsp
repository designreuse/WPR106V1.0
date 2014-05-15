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
			          <h2>Vehicle Information<br/></h2>
			          
			          
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">
						<form action="findbus" method="GET">
							 
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							   <td align="left" valign="middle" width="20%">&nbsp;Vehicle No:<br/>
							    <select   id="e1"style="width:250px;" name="vechicle_reg_no">
							 	<option value="">Select None</option>     
							    <c:forEach items="${busregistrationform.busregistration}" var="driverlist" varStatus="status">
							    <option value="${driverlist.vechicle_reg_no}">${driverlist.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;From Date:<br/><input type="text" name="driver_id" style="margin:4px 0 0 0;"></td>
							    
							      <td align="left" valign="middle" width="10%">&nbsp;&nbsp;To Date:<br/><input type="text" name="driver_id" style="margin:4px 0 0 0;"></td>
							   <td align="center" valign="middle" width="10%">
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
								<!-- <input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"> -->					
					         	<td valign="top" align="left" width="5%">Date</td>
          						<td valign="top" align="left" width="10%">Start Time</td>
          						<td valign="top" align="left" width="10%">End Time</td>
          						<td valign="top" align="left" width="5%">Duration</td>
          						<td valign="top" align="left" width="40%">Location</td>
          						<td valign="top" align="left" width="25%">Trip</td>
        					</tr>  </table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%"class="order-table table">
							 
        							<tr class="row1">
							       		
					     		     	 <td valign="top" align="left"  width="10%"><a href="driver_details?driver_id=${DriverRegistration.driver_id}">${DriverRegistration.driver_id}</a></td>
											<td valign="top" align="left" width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.contact_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.license_type}</td>
											<td valign="top" align="left" width="25%">
										
										
											</td>
								</tr>
							    	
    
        				</table>
        				
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
        					</tr>  </table>
        				
        				</td>
        				</tr>
        				</table></div></div>        	




<jsp:include page="footer.jsp"></jsp:include>
