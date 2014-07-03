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
			          <h2>Stops Information</h2>
			          <div class="searchdiv">
						
                        &nbsp;&nbsp;<a  href='viewroute' class="btn" >Go Back</a>
						</div>
			      
			        </div>						
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<tr class="title">
									<!-- 	<td valign="top" align="left" width="18%"> Bus Id</td> -->
					         	
					       	 	<td valign="top" align="left" width="5%">RouteNo</td>
          						<td valign="top" align="left" width="5%">&nbsp;Trip</td>
					       	 	<td valign="top" align="left" width="5%"> Stop Id</td>
          						<td valign="top" align="left" width="26%">&nbsp;&nbsp;&nbsp;&nbsp;Stop Address</td>
          						<td valign="top" align="left" width="8%"> Bus Arrival Time</td>
          						
        					</tr></table>
							
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" id="report">
							<tr><td colspan="7" style="overflow:hidden;width:1050px"></td></tr>
        					<c:if test="${fn:length(routeViewForm.route_views) gt 0 }">
        					<c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        					
        				       				<tr class="row1">
        				            		<td valign="top" align="left" style="overflow:hidden;width:50px;height:30px;">&nbsp;${route.route_no}</td>
											<td valign="top" align="left" style="overflow:hidden;width:50px;height:30px;"><span style="line-space:20px;">
											&nbsp;&nbsp;&nbsp;<c:choose>
											<c:when test="${route.trip==0}">&nbsp;	<c:out value="Pick Up" ></c:out></c:when>
											<c:when test="${route.trip==1}">&nbsp;<c:out value="Drop" ></c:out></c:when><c:otherwise>
											&nbsp;<c:out value="KG Drop"></c:out>
											</c:otherwise>
											</c:choose></span>
											</td>
											<td valign="top" align="left" style="overflow:hidden; width:50px;height:30px;" title="${route.stop_id}">${route.stop_id}</td>
											<td valign="middle" align="left" style="overflow:hidden; width:280px;height:30px;">${route.bus_stop_address}</td>
					     		     		<td valign="top" align="left" style="overflow:hidden;width:80px;height:30px;">&nbsp;&nbsp;&nbsp;&nbsp;${route.bus_arrival_time}</td> 
								</tr>
								
							    	</c:forEach>
							    </c:if>
							    
							     <c:if test="${fn:length(routeViewForm.route_views) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" ><center><b>No Routes Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%"> &#9660;</td>
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table>
        			
					       				
     </div></div>				