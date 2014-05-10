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
			          <h2>Vehicle Route View<br/></h2>
			          
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">

						<form action="clientfindroutedetails" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							  
							   <td align="left" valign="middle" width="8%">&nbsp;Route No:<br/>
							    <select   id="e3"style="width:250px;" name="route_no">
							 	<option value="">Select None</option>     
							    <c:forEach items="${routeViewForm.route_views}" var="clientrouteview1" varStatus="status">
							    <option value="${clientrouteview1.route_no}">${clientrouteview1.route_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">Stop details By:<br/>
							    <select   id="e2"style="width:250px;" name="trip">
							 	<option value="0">Pickup</option>
							   <option value="1">Drop</option>
							   <option value="2">KG Drop</option>
							    </select>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="pressableButton blue" value="Search" ></td>
							 
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
								<td valign="top" align="left" width="13%">Vechicle Reg No</td>					
					         	<td valign="top" align="left" width="10%">Route No</td>
          						<td valign="top" align="left" width="8%">Stop Id</td>
          						<td valign="top" align="left" width="45%">Stop Location</td>
          						<td valign="top" align="left" width="15%">Stop Arrival Time</td>
          						<td valign="top" align="left" width="15%">Trip</td>
          						
        					</tr>  </table>
						<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(routeViewForm.route_views) gt 0 }">
        					<c:forEach items="${routeViewForm.route_views}" var="clientrouteview" varStatus="status">
        				       		<tr class="row1">	
        				       				<td valign="top" align="left" width="15%">${clientrouteview.bus_reg_no}</td>						       		
											<td valign="top" align="left" width="10%">${clientrouteview.route_no}</td>
											<td valign="top" align="left" width="8%">${clientrouteview.stop_id}</td>
											<td valign="top" align="left" width="50%">${clientrouteview.bus_stop_address}</td>
											<td valign="top" align="left" width="15%">${clientrouteview.bus_arrival_time}</td>
											<td valign="top" align="left" width="10%"><c:choose>
											<c:when test="${clientrouteview.trip==0}">
											<c:out value="PickUp"></c:out>											
											</c:when>
											<c:when test="${clientrouteview.trip==1}">
											<c:out value="Drop"></c:out>											
											</c:when>
											<c:when test="${clientrouteview.trip==2}">
											<c:out value="KG Drop"></c:out>											
											</c:when>
											</c:choose></td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(routeViewForm.route_views) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Routes Found!!!</b></center></td>
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
 