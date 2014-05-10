<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    
    <form action="client_update_student" method="POST">
<script language="Javascript" type="text/javascript">
 
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 45 && charCode < 47) || (charCode > 31 && charCode < 33))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
 
    </script>
<script type="text/javascript">
$(document).ready(function () {
	//called when key is pressed in textbox
	$("#inp_age").keypress(function (e) {	
	   //if the letter is not digit then display error and don't type anything
	   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
		   {
	      //display error message
	      $("#errmsg1").html("Kindly give numbers").show();
	             return false;
	 	 }
	   else{
	  	 $("#errmsg1").html("Kindly give numbers").fadeOut();
	  	 }
	 });
	
	$("#inp_contact_no").keypress(function (e) {	
		   //if the letter is not digit then display error and don't type anything
		   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
			   {
		      //display error message
		      $("#errmsg1").html("Kindly give numbers").show();
		             return false;
		 	 }
		   else{
		  	 $("#errmsg1").html("Kindly give numbers").fadeOut();
		  	 }
		 });
	
	}); 
</script>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2>Edit Student Registration</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${studentregistrationform.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student Roll No:</td>
				                  <td valign="top" align="left" class="input_txt"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="hidden" name="student_roll_no" value="${student.student_roll_no}"/>${student.student_roll_no}
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student First Name:</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	 <input type="hidden" class="input_txtbx1" id="inp_id" name="student_first_name" value="${student.first_name}" />${student.first_name}
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  
				                </tr>
                        		<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student Last Name :</td>
				                  <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="hidden" class="student_txtbx_height_right" id="inp_id" name="student_last_name" value="${student.last_name}"/>${student.last_name}
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Pick Route No:</td>
						            <td valign="top" align="left" class="input_txt">
						            	<select name="pickup_route_no" class="student_txtbx_height_right_ddl" id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()">
					               <option value="${student.pickup_route_no}">${student.pickup_route_no}</option>
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}" selected>${route_no}</option>
			                  </c:forEach>
			                  </select>
						            	<font color="Red" size="+1"></font></td>
						            	
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pick Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="pickup_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="pickup_point_address" id="pickup_location_id" onblur="Validate1('bid')">
						    	<option value="${student.pickup_point_address}" selected>${student.pickup_point_address}</option>
				                  	</select>
				                  	</div>
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Route No:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <select name="drop_route_no" class="student_txtbx_height_right_ddl" onchange="doAjaxPost_drop_route_no()" id="drop_route_id">
					               <option value="${student.drop_route_no}">${student.drop_route_no}</option>
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}" selected>${route_no}</option>
			                  </c:forEach>
			                  </select>
				                  	 
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>	
				                <tr class="row1">
				                 	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;"><select class="student_txtbx_height_right_ddl" name="drop_point_address" id="drop_location_id" onblur="Validate1('bid')">
							    <option value="${student.drop_point_address}" selected>${student.drop_point_address}</option>
				                  	</select>
				                  	</div>
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr>
				                 <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian Name/Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name1" value="${student.parent_name1}" />
					                <br/><font color="Red" size="+1"></font></td>
					                
					              </tr>
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Name 2:</td>
					                <td valign="top" align="left" class="input_txt"><input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_name2" value="${student.parent_name2}" />
					                <br/><font color="Red" size="+1"></font></td>
					             </tr>
					              			                
					             <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_mobile1" value="${student.parent_mobile1}"/>
					             <br/>          
					               <font color="Red" size="+1"></font>
					               </td>
					            </tr>
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Mobile 2:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_mobile2" value="${student.parent_mobile2}"/>
					             <br/>          
					               <font color="Red" size="+1"></font>
					               
					               </td>
					              
				                </tr>
				                <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Email 1:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email1" value="${student.parent_email1}"/>
					             <br/>          
					               <font color="Red" size="+1"></font>
					               
					               </td>
					              
				                </tr>
				                
				              	<tr class="row1">
					            	 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Guardian/Parent Email 2</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="student_txtbx_height_right" id="inp_id" name="parent_email2" value="${student.parent_email2}"/>
				                  	
				                  </td>
					            </tr>
					           
				               
                <tr class="row1">
                <td valign="top" align="right"></td>
				             
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" ></td>
               
                  <td valign="top" align="left"><input type="button" class="submit_btn1" onclick="window.location.href='clientviewstudent'"value="Cancel"></td></tr></table>
                  </td>
                 </table>
                 </td>
                 
                 </tr>
              </table></div>
         	</td>
  		</tr>
 	</table>
</form>
    
</div></div>

<script type="text/javascript">
function doAjaxPost_pickup_route_no() {  
	/* alert("hi"); */
	var pickup_route_no = $('#pickup_route_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/pickup_route_no_ajax",  
		    data: "pickup_route_no="+pickup_route_no,
		    success: function(response){  
		
$('#pickup_address').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
		
<script type="text/javascript">
function doAjaxPost_drop_route_no() {  
	/* alert("hi"); */
	var drop_route_no = $('#drop_route_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/drop_route_no_ajax",  
		    data: "drop_route_no="+drop_route_no,
		    success: function(response){  
		
$('#drop_address').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<jsp:include page="footer.jsp"></jsp:include>    