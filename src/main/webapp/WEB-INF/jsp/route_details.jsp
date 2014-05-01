<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>View AdminUser Details</title>
</head>
<body> 
	<form method="POST" action="">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	
        	<div class="headings altheading">
	              <h2 > Route Information</h2>
	       </div>
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  				
        			<tr class="row1">
        			 	        <td align="right" width="10%" colspan="2" class="input_txtlabel"><b>Route Id :</b></td>
                    <c:set value="${routeForm.routes[0]}" var="route_details"/>
                  <td align="left" width="80%" colspan="2"><b>${route_details.route_id}</b></td>
                  		    
					</tr>
									
        			<tr class="row2">
        				        <td align="center"  style="font-weight: bold;" width="25%" class="input_txtlabel"> Stop Id :</td>
                 		   		<td align="center"  style="font-weight: bold;" width="25%" class="input_txtlabel"> Stop Name:</td>
            	     		      <td align="center"  style="font-weight: bold;" width="25%" class="input_txtlabel"> Pick Up Time:</td>
               			        <td align="center"  style="font-weight: bold;" width="25%" class="input_txtlabel"> Drop Time :</td>
                    </tr>
                    <c:forEach items="${routeForm.routes}" var="route_details" varStatus="status">
	
                    <tr class="row1">
                  <td align="center" width="25%">${route_details.stop_id}</td>	
        				        
                  <td align="left" width="25%">${route_details.stop_name}</td>
				
                    
                  <td align="center" width="25%">${route_details.stop_pickup_time}</td>
				
                  <td align="center" width="25%">${route_details.stop_drop_time}</td>
					</tr>	
					
                 </c:forEach>
                 <tr>
                 
				 <td>&nbsp;&nbsp;</td>
				 <td align="left"><input type="button" class="submit_btn" value="Back" onclick="window.location.href='viewroute'"></td>
				 </tr>
               </table>
               
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				