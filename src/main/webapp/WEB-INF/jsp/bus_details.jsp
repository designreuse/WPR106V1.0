<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>View Bus Details</title>
</head>
<body>
	<form method="POST" action="">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 align="center" >Bus Information<br></b></h2>
	       </div></div> 
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  				<c:forEach items="${busRegistrationForm.busregistration}" var="BusRegistration" varStatus="status">
        			<tr class="row1">
        				        <td> Bus Id :</td>
                    
                  <td>${BusRegistration.bus_id}</td>
					</tr>	
					<tr class="row2">	  
							  <td> GPS Id :</td>
                    
                  <td>${BusRegistration.gps_id}</td>
                  </tr>
						<tr class="row1">	 
							  <td> Driver Id :</td>
                    
                  <td>${BusRegistration.driver_id}</td>
                  </tr>
						<tr class="row2">	  
							  <td> Assistant Driver Id :</td>
                    
                  <td>${BusRegistration.asst_driver_id}</td>
                  </tr>
							<tr class="row1">  
							  <td> Start Time :</td>
                    
                  <td>${BusRegistration.start_time}</td>
                  </tr>
							  <tr class="row2">
							  <td> End Time :</td>
                    
                  <td>${BusRegistration.end_time}</td>
			</tr>				  
                 </c:forEach>
               </table>
               <table align="right">
				                  <tr>
				                   
				                    <td><input type="button" class="submit_btn" value="Back" onclick="window.location.href='viewbus'"></td>
				                    <td>&nbsp;&nbsp;</td>
				                    
				                  </tr>
				                  </table>
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				