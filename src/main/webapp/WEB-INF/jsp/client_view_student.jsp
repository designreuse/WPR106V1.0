
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
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
            
            $("#report tr.odd").dblclick(function(){
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
			          <h2>Student View 
			        <br/></h2>	<div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='clientviewstudent' class="btn" >Back to View</a>
						</div>			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">
<form action="findstudentsclient" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  
        				    <tr>
							  
							   <td align="left" valign="middle" width="8%">Roll No:<br/>
							    <select  id="e1"style="width:250px;" name="student_roll_no">
							 	<option selected>-- Select Roll No --</option>     
							    <c:forEach items="${studentRegistrationForm1.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.student_roll_no}" <c:if test="${student_roll_no==studentlist2.student_roll_no}"><c:out value="Selected"/></c:if>>${studentlist2.student_roll_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">First Name:<br/>
							    <select  id="e2"style="width:250px;" name="first_name">
							 	<option slected>-- Select First Name --</option>     
							    <c:forEach items="${studentRegistrationForm1.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.first_name}" <c:if test="${first_name==studentlist2.first_name}"><c:out value="Selected"/></c:if>>${studentlist2.first_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">Last Name:<br/>
							    <select  id="e3"style="width:250px;" name="last_name">
							 	<option selected>-- Select Last Name --</option>     
							    <c:forEach items="${studentRegistrationForm1.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.last_name}" <c:if test="${last_name==studentlist2.last_name}"><c:out value="Selected"/></c:if>>${studentlist2.last_name}</option>
							    </c:forEach>
							    </select></td>
							    </tr>
							    <tr>
							     <td align="left" valign="middle" width="10%">Parent Mobile No<br/>
							     <select  id="e4"style="width:250px;" name="parent_mobile1">
							 	<option selected>-- Select Mobile No -- </option>     
							    <c:forEach items="${studentRegistrationForm1.studentregistration}" var="studentlist2" varStatus="status">
							    <option value="${studentlist2.parent_mobile1}" <c:if test="${parent_mobile1==studentlist2.parent_mobile1}"><c:out value="Selected"/></c:if>>${studentlist2.parent_mobile1}</option>
							    </c:forEach>
							    </select></td>
							    <td align="center" valign="middle"></td>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="btn" value="Search" ></td>
							 
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
    						
        					   			
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" id="report" >
							<tr  class="headings altheading"> <td valign="top" align="left" width="8%" style="color:#000;font-size:medium;">Roll NO</td>
							<td valign="top" align="left" width="10%" style="color:#000;font-size:medium;">First Name</td>
							
							<td valign="top" align="left" width="8%" style="color:#000;font-size:medium;">Calss & Sec</td>
							<td valign="top" align="left" width="8%" style="color:#000;font-size:medium;">Pick RteNo</td>
							<td valign="top" align="left" width="15%" style="color:#000;font-size:medium;">PicK Address</td>
							<td valign="top" align="left" width="8%" style="color:#000;font-size:medium;">Drop RteNo</td>
							<td valign="top" align="left" width="15%" style="color:#000;font-size:medium;">Drop Address</td>
							<td valign="top" align="left" width="8%" style="color:#000;font-size:medium;">KG Drop</td>
							<td valign="top" align="left" width="10%" style="color:#000;font-size:medium;">Action</td>
          						 </tr>
							       		<c:if test="${fn:length(studentRegistrationForm.studentregistration) gt 0 }">
        					<c:forEach items="${studentRegistrationForm.studentregistration}" var="studentlist" varStatus="status">
        				    
        				    
        					<tr class="row1" >
							       	 <td valign="top" align="left"  width="8%" title="Student Roll Number">${studentlist.student_roll_no}</td>
									 <td valign="top" align="left" width="10%" title="First Name">${studentlist.first_name}</td>
									 
									 
									  <td valign="top" align="left" width="8%" title="Class & Section">${studentlist.class_standard}&amp;${studentlist.section}</td>
									 <%-- <td valign="top" align="center" width="7%">${studentlist.section}</td> --%>
									 <td valign="top" align="left" width="8%" title="Pickup Route Number">${studentlist.pickup_route_no}</td>
									 <td valign="top" align="left" width="30%" title="Pickup Point Address">${studentlist.pickup_point_address}</td>
									 <td valign="top" align="left" width="8%" title="Drop Route Number">	${studentlist.drop_route_no}		 </td>
									 <td valign="top" align="left" width="30%" title="Drop Point Address">${studentlist.drop_point_address}			 </td>
									 <td valign="top" align="left" width="8%" title="Kg Drop ">${studentlist.kg_drop}</td>
									 <td align="left">
										<div class="arrow" title="Double click to Show all Details"></div><a href="<c:out value="client_edit_student?student_roll_no=${studentlist.student_roll_no}&pickup_route_no=${studentlist.pickup_route_no}&drop_route_no=${studentlist.drop_route_no}"/>" title="Edit" ><img src="resources/images/edit-29.png" alt="Edit" width="20" height="15"/></a>
										</td>
								</tr>
							    	
							<tr class="row1">
										<td valign="top" align="left" colspan="4"><ul><li><span style="color:#000;">Student First Name:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.first_name}</span></li>
										<li><span style="color:#000;">Student Last Name:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.last_name}</span></li><li><span style="color:#000;">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<span style="color:#000;"><c:choose>
									 <c:when test="${studentlist.gender=='M'}">
									 <c:out value="Male"></c:out></c:when>
									 <c:when test="${studentlist.gender=='F'}">
									 <c:out value="FeMale"></c:out>
									 </c:when>
									 </c:choose></span></li><li><span style="color:#000;">Class & Section &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.class_standard}&amp;${studentlist.section}</span></li></ul></td>
										<td valign="top" align="left" colspan="6" ><ul><li><span style="color:#000;">Parents Name&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.parent_name1} &amp;${studentlist.parent_name2}</span></li><li>
										<span style="color:#000;">Parent Number:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.parent_mobile1} &amp;${studentlist.parent_mobile2} </span></li>
										<li><span style="color:#000;">Parents Email&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#000;">${studentlist.parent_email1}&amp;${studentlist.parent_email2}</span></li></ul></td>
										</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(studentRegistrationForm.studentregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Student Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				
        				 </table>
        				
        				
        				
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
