<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>View BusDevice Details</title>
</head>
<body> 
	<form method="POST" action="">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	
        	<div class="headings altheading">
	              <h2> Bus and Device Information</h2>
	       </div>
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  				<c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="BusDeviceRegistration" varStatus="status">
        			
        			<tr class="row1">
        				        <td align="right" width="50%"> Organization ID :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.org_id}</td>
					</tr>	
					
					<tr class="row2">	  
							  <td align="right" width="30%"> Bus ID :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.bus_id}</td>
                  </tr>
                  
                  <tr class="row1">	 
							 <td align="right" width="30%"> Device ID :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.device_id}</td> 
                  </tr>
					
						<tr class="row2">	 
							 <td align="right" width="30%"> Bus Registration Number :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.bus_reg_id}</td> 
                  </tr>
					<tr class="row1">	 
							  <td align="right" width="30%"> Device IMEI Number :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.device_imei_number}</td>
                  </tr>
					
					<tr class="row2">	 
							  <td align="right" width="30%"> Device SIM Number :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.device_sim_number}</td>
                  </tr>	
                   <tr class="row1">	 
							  <td align="right" width="30%"> Driver Id :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.driver_id}</td>
                  </tr>
                  <tr class="row2">	 
							  <td align="right" width="30%"> Description :</td>
                    
                  <td align="left" width="70%">${BusDeviceRegistration.description}</td>
                  </tr>	
                   <tr class="row1">	 
							  <td align="right" width="30%"> Is Active :</td>
                    
                  <td align="left" width="70%">
                  <c:choose>
                  <c:when test="${BusDeviceRegistration.isactive==1}">
                  <c:out value="ON"></c:out>
                  </c:when>
                  <c:when test="${BusDeviceRegistration.isactive==0}">
		         <c:out value="OFF"></c:out>
				</c:when>
                  <c:otherwise>
                   <c:out value=""></c:out>
                  </c:otherwise>
                  </c:choose>
                  
                 </td>
                  </tr>
                  
					
                 </c:forEach>
                 <tr>
				 <td>&nbsp;&nbsp;</td>
				 <td align="left"><input type="button" class="submit_btn" value="Back" onclick="window.location.href='view_bus_device'"></td>
				 </tr>
               </table>
               
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				