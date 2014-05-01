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
			          <h2>Vehicle Route View</h2>
			        </div>
			        
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewdriver">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
    <tr>
    <td>
						<div style="border:#ccc 2px solid; border-radius:5px;padding:15px; margin-bottom:0px;">
						<form action="finddriver" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							  
							   <td align="left" valign="middle" width="8%">&nbsp;Route No:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stop details By:</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="" class="org_input_cmbbx">
							    <option value="Pickup">Pickup</option>
							    <option value="Drop">Drop</option>
							    <option value="KG Drop">KG Drop</option>
							    </select>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="submit_btn" value="View Stops" name="find"></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					
						</td>
						</tr>
					</table>
					 <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="15%">Vechicle Reg No</td>					
					         	<td valign="top" align="left" width="10%">Route No</td>
          						<td valign="top" align="left" width="8%">Stop Id</td>
          						<td valign="top" align="left" width="50%">Stop Location</td>
          						<td valign="top" align="left" width="15%">Stop Arrival Time</td>
          						<td valign="top" align="left" width="10%">Trip</td>
          						
        					</tr>  </table>
						<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
 