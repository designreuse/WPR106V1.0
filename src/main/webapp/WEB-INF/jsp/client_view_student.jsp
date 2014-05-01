<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>


<script type="text/javascript" src="js/ajaxpaging.js"></script>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Student View &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			          
                <a href="#join_form" id="join_pop" class="iconbutton star">
                <img src="resources/images/Chart.jpg" width="16px" height="12px"/>See Full Table</a></h2>
			        </div>
			        
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						
    <tr>
    <td>
						<div style="border:#ccc 2px solid; border-radius:5px;padding:15px; margin-bottom:0px;">
						<form action="finddriver" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  
							   <td align="left" valign="middle" width="8%">&nbsp;Roll No:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							    
							
							    
							    </tr>
							    <tr><td align="left" valign="middle" width="10%">Last Name:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parent Cell:1</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					
						</td>
						</tr>
					</table>
						
    						 <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
													
					         	<td valign="top" align="left" width="8%">Roll No</td>
          						<td valign="top" align="left" width="11%">First Name</td>
          						<td valign="top" align="left" width="10%">Last Name</td>
          						<td valign="top" align="left" width="1%">Gender</td>
          						<td valign="top" align="left" width="1%">Class</td>
          						<td valign="top" align="left" width="3%">Section</td>
          						<td valign="top" align="left" width="15%">Pick Route No</td>
          						<td valign="top" align="left" width="34%">Pick point address</td>
          						<td valign="top" align="left" width="10%">KG Drop</td>
          						<td valign="top" align="left" width="12%">Action</td> 
          						<!-- <td valign="top" align="left" width="25%">Live Track</td> -->
        					</tr>  </table>
        					<div class="Panel_One_Inner">
        					   			
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							 
							       		<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist" varStatus="status">
        				    
        					<tr class="row1">
							       		<%-- <td align="center" width="15%"><input type="checkbox" value="${studentlist.driver_id}" name="chkUser"></td> --%>
					     		     <td valign="top" align="left"  width="9%">${studentlist.student_roll_no}</td>
									 <td valign="top" align="left" width="10%">${studentlist.first_name}</td>
									 <td valign="top" align="left" width="10%">${studentlist.last_name}</td>
									 <td valign="top" align="left" width="6%">
									 <c:choose>
									 <c:when test="${studentlist.gender=='M'}">
									 <c:out value="Male"></c:out></c:when>
									 <c:when test="${studentlist.gender=='F'}">
									 <c:out value="FeMale"></c:out>
									 </c:when>
									 </c:choose>
									 </td>
									  <td valign="top" align="left" width="1%">${studentlist.class_standard}</td>
									 <td valign="top" align="center" width="10%">${studentlist.section}</td>
									 <td valign="top" align="left" width="14%">${studentlist.pickup_route_no}</td>
									 <td valign="top" align="left" width="34%">${studentlist.pickup_point_address}</td>
									 <td valign="top" align="left" width="10%">${studentlist.kg_drop}</td>
									 <td>
										<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="client_edit_student?student_roll_no=${studentlist.student_roll_no}"/>" style="padding-right:10px;">Edit</a>
										</td>
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
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
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
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
        					<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist1" varStatus="status">
        				       			<tr class="row1">
										<td valign="top" align="left" width="9%">${studentlist1.drop_route_no}</td>
										<td valign="top" align="left" width="24%">${studentlist1.drop_point_address}</td>
										<td valign="top" align="left" width="17%">${studentlist1.parent_name1}<span style="color:red;"> &#47;</span> ${studentlist1.parent_name2}</td>
										<%-- <td valign="top" align="left" width="12%">${studentlist1.parent_name2}</td> --%>
										<td valign="top" align="left" width="15%">${studentlist1.parent_mobile1}&#47;${studentlist1.parent_mobile2}</td>
										<%-- <td valign="top" align="left" width="12%">${studentlist1.parent_mobile2}</td> --%>
										<td valign="top" align="left" width="19%">${studentlist1.parent_email1}&#47;${studentlist1.parent_email2}</td>
										<%-- <td valign="top" align="left" width="12%">${studentlist1.parent_email2}</td> --%>
										
										</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(studentRegistrationForm.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Students Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							    	
        				
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
													
					         	<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>  </table>
        				</div>
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
            <p>Search will come here</p>
            <!-- <div>
                <label for="email">Login (Email)</label>
                <input type="text" id="email" value="" />
            </div>
            <div>
                <label for="pass">Password</label>
                <input type="password" id="pass" value="" />
            </div>
            <div>
                <label for="firstname">First name</label>
                <input type="text" id="firstname" value="" />
            </div>
            <div>
                <label for="lastname">Last name</label>
                <input type="text" id="lastname" value="" />
            </div>
            <input type="button" value="Sign Up" />&nbsp;&nbsp;&nbsp;or&nbsp;&nbsp;&nbsp;<a href="#login_form" id="login_pop">Log In</a>
 --><table cellpadding="0" cellspacing="0" border="0" width="100%">
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
							       		<%-- <td align="center" width="15%"><input type="checkbox" value="${studentlist.driver_id}" name="chkUser"></td> --%>
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
   