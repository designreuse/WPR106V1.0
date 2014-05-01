<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Driver List</h2>
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
						<div style="border:#ccc 2px solid; border-radius:5px;padding:15px; margin-bottom:0px;">
						<form action="finddriver" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							   <td align="left" valign="middle" width="8%">&nbsp;Driver Name:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle No:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;License No:</td>
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
													
					         	<td valign="top" align="left" width="15%">Driver Name</td>
          						<td valign="top" align="left" width="15%">Vehicle No</td>
          						<td valign="top" align="left" width="20%">Driver License No</td>
          						<td valign="top" align="left" width="15%">Driver License Expiry Date</td>
          						
          						
        					</tr>  </table>
						<form name="grid"  action="viewdriver" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<c:if test="${fn:length(busRegistrationForm.busregistration) gt 0 }">
        					<c:forEach items="${busRegistrationForm.busregistration}" var="DriverRegistration" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left"  width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.vechicle_reg_no}</td>
											<td valign="top" align="left" width="20%">${DriverRegistration.driver_licence_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.driver_licence_exp_date}</td>
											
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(busRegistrationForm.busregistration) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Drivers Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</form>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">

          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr>  </table>
        				
        				</td>
        				</tr>
        				</table></div></div>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
 