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
	              <h2 > User Information</h2>
	       </div>
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  				<c:forEach items="${adduserform.adduser}" var="AddUser" varStatus="status">
        			<tr class="row1">
        				        <td align="right" width="50%" class="input_txtlabel"> Registration Number :</td>
                    
                  <td align="left" width="70%">${AddUser.admin_reg_no}</td>
					</tr>
        			<tr class="row1">
        				        <td align="right" width="50%" class="input_txtlabel"> Organization Id :</td>
                    
                  <td align="left" width="70%">${AddUser.org_id}</td>
					</tr>	
					
					<tr class="row2" >	  
							  <td align="right" width="30%" class="input_txtlabel"> Admin Id :</td>
                    
                  <td align="left" width="70%">${AddUser.admin_id}</td>
                  </tr>
                  
                  <tr class="row1">	 
							 <td align="right" width="30%" class="input_txtlabel"> Name :</td>
                    
                  <td align="left" width="70%">${AddUser.name}</td> 
                  </tr>
					
						<tr class="row2">	 
							 <td align="right" width="30%" class="input_txtlabel"> Password :</td>
                    
                  <td align="left" width="70%">${AddUser.password}</td> 
                  </tr>
					<tr class="row1">	 
							  <td align="right" width="30%" class="input_txtlabel"> User Type :</td>
                    
                  <td align="left" width="70%">
                  <c:choose>
                  <c:when test="${AddUser.user_access_control=='Normal'}">
                  <c:out value="Normal User"></c:out>
                  </c:when>
                  <c:when test="${AddUser.user_access_control=='Admin'}">
                  <c:out value="Admin User"></c:out>
                  </c:when>
                  <c:otherwise>
                  <c:out value=""></c:out>
                  </c:otherwise>
                  </c:choose>
                  
                  </td>
                  </tr>
					
					<tr class="row2">	 
							  <td align="right" width="30%" class="input_txtlabel"> Contact Number :</td>
                    
                  <td align="left" width="70%">${AddUser.contact_no}</td>
                  </tr>	
                   <tr class="row1">	 
							  <td align="right" width="30%" class="input_txtlabel"> Notification Email :</td>
                    
                  <td align="left" width="70%">${AddUser.notification_email}</td>
                  </tr>
					
                 </c:forEach>
                 <tr>
                 
				 <td>&nbsp;&nbsp;</td>
				 <td align="left"><input type="button" class="submit_btn" value="Back" onclick="window.location.href='viewuser'"></td>
				 </tr>
               </table>
               
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				