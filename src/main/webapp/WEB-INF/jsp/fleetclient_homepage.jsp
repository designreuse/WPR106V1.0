<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="fleet_header.jsp"></jsp:include>
	<form name="" action="" method=POST>		
		<table class="margin_table_fleet" style="width:100%">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading" style="width:100%">
							<h2>Home Page</h2>
						</div>
						<div class="contentbox" style="width:100%">
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title" >
								<td valign="top" align="left" width="10%"> Device Status</td>	
         						<td valign="top" align="left" width="15%" > Vehicle Reg.No</td>					         	
					         	<td valign="top" align="left" width="30%"> Current Location</td>
          						<td valign="top" align="center" width="15%"> Current Speed</td>
          						<td valign="top" align="center" width="15%"> Last Updated</td>
          						<td valign="top" align="center" width="25%"> Live Track</td>
								</tr>

								<!-- Display Admin User id here  Suresh--> 
									<c:forEach items="${fleetHomepageForm.fleetHomepages}" var="fleetHomepages" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,'row_hover');" onmouseout="mouse_event(this,'row1');">
							       			<td valign="top" align="left"  width="10%"  style="padding-left:30px;" align="center">
								          <c:choose>
								          <c:when test="${fleetHomepages.device_status eq 0}">
								          <img src="resources/images/Map_Markers/red_round_button.png" title="Not Responding" style="width:15px;height:15px;"/>
								          </c:when>
								          <c:when test="${fleetHomepages.device_status eq 1}">
								          <img src="resources/images/Map_Markers/green_round_button.png" title="Traceable" style="width:15px;height:15px;"/>
								          </c:when>
								          <c:otherwise>
								          <img src="resources/images/Map_Markers/yellow_round_button.jpg" title="No GPS Signal" style="width:15px;height:15px;"/>
								         
								          </c:otherwise>
								          </c:choose>
								          </td>
								          
								          
								           	<td valign="top" align="left"  width="15%">${fleetHomepages.vehicle_no}</td>
											<td valign="top" align="left" width="30%">${fleetHomepages.address}</td>
											<td valign="top" align="center" width="15%">${fleetHomepages.speed}</td>
											<td valign="top" align="center" width="15%">${fleetHomepages.date_time}</td>
											<td valign="top" align="center" width="25%">
											<a href="<c:out value="live_track?id=${fleetHomepages.device_imei_number}"/>"><img src="resources/images/live_track.png" style="width:20px;height:20px;"/>  Live Track</a>
											</td>
											
										
										</tr>
							    	</c:forEach>
						    	

								<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"></li>
                						<li class="text"></li>
                					</ul></div></td></tr>

								</table></div>

								<div style="clear: both;"></div>
								</div>
								
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						
<jsp:include page="footer.jsp"></jsp:include>