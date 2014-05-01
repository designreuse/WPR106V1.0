<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>View Student Details</title>
</head>
<body> 
	<form method="POST" action="">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	
        	<div class="headings altheading">
	              <h2 > Student Information</h2>
	       </div>
	       
	        <div class="contentbox">
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				
  	<c:forEach items="${studentregistrationform.studentregistration}" var="StudentRegistration" varStatus="status">
        			
        		
        			<tr class="row2">
        	      <td align="right"class="input_txtlabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Registration Number :</td>
                  <td align="left">${StudentRegistration.student_reg_no}</td>
					
				  <td align="left"  class="input_txtlabel" > Father/Gaurdian Name :&nbsp;&nbsp;&nbsp;${StudentRegistration.father_name}</td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
					</tr>	
        			<tr class="row1">
        	      <td align="right"  class="input_txtlabel"> Organization Id :</td>
                  <td align="left">${StudentRegistration.org_id}</td>
                  <td align="left"  class="input_txtlabel" > Contact Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; 
                  ${StudentRegistration.mobile_number}</td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
					</tr>	
					
					<tr class="row2" >	  
							  <td align="right"  class="input_txtlabel"> Student Roll Number :</td>
                    
                  <td align="left" >${StudentRegistration.student_roll_no}</td>
                  <td align="left"  class="input_txtlabel" >  E-mail Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                  ${StudentRegistration.email_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                  
                  <tr class="row1">	 
							 <td align="right"  class="input_txtlabel"> Name :</td>
                    
                  <td align="left" >${StudentRegistration.name}</td> 
                   <td align="left"  class="input_txtlabel" >  PickUp Bus Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                   ${StudentRegistration.pickup_bus_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
					
				  <tr class="row2">	 
					<td align="right"  class="input_txtlabel"> class :</td>
                  <td align="left" >${StudentRegistration.student_class}</td>
                  <td align="left"  class="input_txtlabel" >  Drop Bus Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                  ${StudentRegistration.drop_bus_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                  
					<tr class="row1">	 
							  <td align="right"  class="input_txtlabel"> Section :</td>
                    
                  <td align="left" >${StudentRegistration.section}</td>
                  <td align="left"  class="input_txtlabel" > PickUp Route Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                  ${StudentRegistration.pickup_route_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                  
					<tr class="row2">	 
				  <td align="right"  class="input_txtlabel"> Age :</td>
                  <td align="left"  >${StudentRegistration.age}</td>
                  <td align="left"  class="input_txtlabel" > Drop Route Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                  ${StudentRegistration.drop_route_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>	 
                   <tr class="row1">	 
				  <td align="right"   class="input_txtlabel"> Gender :</td>
                  <td align="left"  >${StudentRegistration.gender}</td>
                  <td align="left"  class="input_txtlabel" > PickUp Stop Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
                  ${StudentRegistration.pickup_stop_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                                 
                  <tr class="row2">	 
				  <td align="right"   class="input_txtlabel"> Blood Group :</td>
                  <td align="left"  >${StudentRegistration.blood_group}</td>
                  <td align="left"  class="input_txtlabel" >Drop stop Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; 
                  ${StudentRegistration.drop_stop_id}</td>
                  <td align="right"  class="input_txtlabel"></td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                  <tr class="row1">	 
							  <td align="right"   class="input_txtlabel"> Address :</td>
                    
                  <td align="left"  >${StudentRegistration.address}</td>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
                  </tr>
                 
         </c:forEach>
                  <tr>
                  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
				  <td align="left">
				  <input type="button" class="submit_btn" value="Back" onclick="window.location.href='viewstudent'"></td>
				  <td align="right">&nbsp;&nbsp;</td>
				  <td align="right"  class="input_txtlabel"></td>
				  <td align="left"></td>
				  
				  </tr>
               </table>
               
               </div>
               </td>
               </tr>
               </table>
               </form>
               </body>
               </html>
                 
                  
  				