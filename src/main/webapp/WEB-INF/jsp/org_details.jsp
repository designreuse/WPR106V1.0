<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>View Organization Details</title>
</head>
<body>
	<form method="POST" action="">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	
        	<div class="headings altheading">
	              <h2 >Organization Information</h2>
	       </div>
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  				<c:forEach items="${orgregistrationform.orgregistration}" var="OrgRegistration" varStatus="status">
        			
        			<tr class="row1" >
        				        <td align="right" width="50%" class="input_txtlabel"> Registration Number :</td>
                    
                  <td align="left" width="70%">${OrgRegistration.registration_no}</td>
					</tr>	
					
					<tr class="row2" >	  
							  <td align="right" width="30%" class="input_txtlabel"> Organization Id :</td>
                    
                  <td align="left" width="70%">${OrgRegistration.org_id}</td>
                  </tr>
                  
                  <tr class="row1">	 
							  <td align="right" width="30%" class="input_txtlabel"> Organization Name :</td>
                    
                  <td align="left" width="70%">${OrgRegistration.org_name}</td>
                  </tr>
					
						<tr class="row2" >	 
							  <td align="right" width="30%" class="input_txtlabel"> Is Active :</td>
                    
                  <td align="left" width="70%">
                  <c:choose>
                  <c:when test="${OrgRegistration.is_active==1}">
                  <c:out value="YES"></c:out>
                  </c:when>
                  <c:when test="${OrgRegistration.is_active==0}">
                  <c:out value="NO"></c:out>
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
				  <td align="left"><input type="button" class="submit_btn" value="Back" onclick="window.location.href='vieworg'"></td>                  
				                  </tr>
               </table>
               
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				