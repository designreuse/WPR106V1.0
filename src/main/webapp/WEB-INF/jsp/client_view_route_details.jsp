<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<style type="text/css">
        /* body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #report { border-collapse:collapse;}
        #report h4 { margin:0px; padding:0px;}
        #report img { float:right;}
        
        #report th { background:#3bb9ff url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:0px 2px; text-align:left;}
        #report td { background:#eee none repeat-x scroll center left; color:#fff; padding:0px 2px; }
         */#report tr.odd td { background:#fff ;color:#666; cursor:pointer; }
        #report div.arrow { background:transparent url(resources/images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;float:right;}
        #report div.up { background-position:0px 0px;}
        #report ul { margin:10px 0 10px 40px; padding:0px;}
    </style>
    
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.click_row)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.click_row").dblclick(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script> 
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Vehicle Route View<br/></h2>
			          <div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='clientviewroutedetails' class="btn" >Back to View</a>
						</div>	
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">

						<form action="clientfindroutedetails" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td><input type="hidden" value="organization" name="org_name" >
							  </td><td> <input type="hidden" value="branch" name="branch" ></td></tr>
							  <tr><td align="left" valign="middle" width="8%">
							  
							   <td align="left" valign="middle" width="8%">&nbsp;Route No:<br/>
							    <select   id="e3"style="width:250px;" name="route_no">
							 	<option selected> -- Select Route --</option>     
							    <c:forEach items="${routeViewForm1.route_views}" var="clientrouteview1" varStatus="status">
							    <option value="${clientrouteview1.route_no}" <c:if test="${route_no==clientrouteview1.route_no}"><c:out value="Selected"/></c:if>>${clientrouteview1.route_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">Stop details By:<br/>
							    <select   id="e2"style="width:250px;" name="trip">
							    <option selected> -- Select Trip --</option>   
							 	<option value="0" <c:if test="${route.trip=='0'}"><c:out value="selected"/></c:if>>Pickup</option>
							 	<option value="1" <c:if test="${route.trip=='1'}"><c:out value="selected"/></c:if>>Drop</option>
							 	<option value="2" <c:if test="${route.trip=='2'}"><c:out value="selected"/></c:if>>KG Drop</option>
							 	<!-- <option value="0">Pickup</option>
							   <option value="1">Drop</option>
							   <option value="2">KG Drop</option> -->
							    </select>
							  <td align="center" valign="middle" width="30%">
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
								<td valign="top" align="left" width="13%">Vechicle Reg No</td>					
					         	<td valign="top" align="left" width="10%">Route No</td>
          						<td valign="top" align="left" width="10%">Trip</td>
          						<td valign="top" align="left" width="10%">Number of Stops</td>
          						<td width="8%"></td>
          						
        					</tr>  </table>
						<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(routeViewForm.route_views) gt 0 }">
        					<c:forEach items="${routeViewForm.route_views}" var="clientrouteview" varStatus="status">
        				       		<tr class="row1">	
        				       				<td valign="top" align="left" width="13%">${clientrouteview.bus_reg_no}</td>						       		
											<td valign="top" align="left" width="10%">${clientrouteview.route_no}</td>
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
											<td valign="top" align="left" width="10%">${clientrouteview.no_of_stops}</td>
											<td valign="top" align="left" width="8%">
											 <a href="<c:out value="showfulldetailsclient?route_no=${clientrouteview.route_no}"/>" >Stops</a>
											
											</td>
								</tr>
								
								<tr class="row2">
								
								<c:forEach items="${routeViewForm2.route_views}" var="route" varStatus="status">
								
								<td valign="top" align="left" style="overflow:hidden;height:auto" colspan="7">
								
								<table>
								<tr>
								<td>
								<span>Stop ID:</span><span>${route.stop_id}</span></td><td><span>Bus Stop Address:</span><span>${route.bus_stop_address}</span></td><td><span>Bus Arrival Time:</span><span>${route.bus_arrival_time}</span>
								</td>
								</tr>
								</table>
								
								</td>
								
								</c:forEach>
								
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
 