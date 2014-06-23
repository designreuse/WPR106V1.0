<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
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
    <script id="script_e1">
    $(document).ready(function() {
        $("#pickup_route_id").select2();
    });
</script>
<script id="script_e1">
    $(document).ready(function() {
        $("#drop_route_id").select2();
    });
</script>
<script id="script_e1">
    $(document).ready(function() {
        $("#pickup_location_id").select2();
    });
</script>
<script id="script_e1">
    $(document).ready(function() {
        $("#drop_location_id").select2();
    });
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
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="student_roll_no" value="${student.student_roll_no}"/>${student.student_roll_no}
				                  	<br/><font color="Red" size="+1"><form:errors path="studentRegistration.student_roll_no"></form:errors></font>
				                  </td>
				                
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student First Name:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	 <input type="hidden" class="input_txtbx1" id="inp_id" name="first_name" value="${student.first_name}" />${student.first_name}
				                  	<br/><font color="Red" size="+1"><form:errors path="studentRegistration.first_name"></form:errors></font>
				                  </td>
				                  
				                </tr>
                        		<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Student Last Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" class="student_txtbx_height_right" id="inp_id" name="last_name" value="${student.last_name}"/>${student.last_name}
				                  	<br/><font color="Red" size="+1"><form:errors path="studentRegistration.last_name"></form:errors></font>
				                  </td>
				                  
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Pick Route No:</td>
						            <td valign="top" align="left" class="input_txt">
						            	<select name="pickup_route_no"  id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" style="width:220px">
					               <option selected>-- Select Pickup Route No--</option>
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}" <c:if test="${route_no==student.pickup_route_no}"><c:out value="selected"></c:out></c:if> >${route_no}</option>
			                  </c:forEach>
			                  </select>
						            	<br/><font color="Red" size="+1"><form:errors path="studentRegistration.pickup_route_no"></form:errors></font>
						            	
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pick Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<span id="pickup_address" style="height:8px;"><select  name="pickup_point_address" id="pickup_location_id" onblur="Validate1('bid')" style="width:220px">
						    	<option selected>-- Select Pickup Location--</option>
						    	
						    	<option value="${student.pickup_point_address}" selected>${student.pickup_point_address}</option>
						    	<%-- <c:forEach items="${pickup_route_location}" var="pickup_location">
						    	<option value="${student.pickup_point_address}" <c:if test="${pickup_location==student.pickup_point_address}"><c:out values="selected"></c:out></c:if> >${student.pickup_point_address}</option>
						    	</c:forEach>  --%>
				                  	</select>
				                  	</span>
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.pickup_point_address"></form:errors></font>
				                  </td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Route No:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <select name="drop_route_no"  onchange="doAjaxPost_drop_route_no()" id="drop_route_id" style="width:220px">
					               <option selected>-- Select Drop Route No--</option>
					              <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}"  <c:if test="${route_no==student.drop_route_no}"><c:out value="selected"></c:out></c:if>   >${route_no}</option>
			                  </c:forEach>
			                  </select>
				                  	 
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.drop_route_no"></form:errors></font>
				                  </td>
				                </tr>	
				                <tr class="row1">
				                 	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<span id="drop_address" style="height:8px;"><select  name="drop_point_address" id="drop_location_id" onblur="Validate1('bid')" style="width:220px">
							    <option selected>-- Select Drop Location --</option>
							    <option value="${student.drop_point_address}" selected>${student.drop_point_address}</option>
				                  	</select>
				                  	</span>
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.drop_point_address"></form:errors></font>
				                  </td>
				                </tr>
				                 <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian Name/Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text"  id="pname1" name="parent_name1"  oninput="validateAlpha();" onblur="toTitleCase('pname1')" value="${student.parent_name1}" />
					                <br/><font color="Red" size="+1"><form:errors path="studentRegistration.parent_name1"></form:errors></font></td>
					                
					              </tr>
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Name 2:</td>
					                <td valign="top" align="left" class="input_txt"><input type="text"  id="pname2" oninput="validateAlpha1();" onblur="toTitleCase1('pname2')" name="parent_name2" value="${student.parent_name2}" />
					                <br/><font color="Red" size="+1"><form:errors path="studentRegistration.parent_name2"></form:errors></font></td>
					             </tr>
					              			                
					             <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" id="mob1" name="parent_mobile1" oninput="validatenum();" value="${student.parent_mobile1}"/>
					             <br/>          
					               <font color="Red" size="+1"><form:errors path="studentRegistration.parent_mobile1"></form:errors></font>
					               <span id="mrequires" style="color: red;"></span>
					               </td>
					            </tr>
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Mobile 2:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" id="mob2" name="parent_mobile2" oninput="validatenum1();" value="${student.parent_mobile2}"/>
					             <br/>          
					               <font color="Red" size="+1"><form:errors path="studentRegistration.parent_mobile2"></form:errors></font>
					               <span id="mrequires1" style="color: red;"></span>
					               </td>
					              
				                </tr>
				                <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Guardian/Parent Email 1:</td>
					               <td valign="top" align="left" class="input_txt">
					              <input type="text" id="email1" name="parent_email1" value="${student.parent_email1}"/>
					             <br/>          
					               <font color="Red" size="+1"><form:errors path="studentRegistration.parent_email1"></form:errors></font>
					               
					               </td>
					              
				                </tr>
				                
				              	<tr class="row1">
					            	 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Guardian/Parent Email 2</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" id="email2" name="parent_email2" value="${student.parent_email2}"/>
				                  	 <br/>          
					               <font color="Red" size="+1"><form:errors path="studentRegistration.parent_email2"></form:errors></font>
				                  </td>
					            </tr>
					            <input type="hidden" name="class_standard"  value="${student.class_standard}"/>
				              <font color="Red" size="+1"><form:errors path="studentRegistration.class_standard"></form:errors></font>
				              <input type="hidden" name="section"  value="${student.section}"/>
				              <font color="Red" size="+1"><form:errors path="studentRegistration.section"></form:errors></font> 	
				              <input type="hidden" name="org_name"  value="${student.org_name}"/>
				             <font color="Red" size="+1"><form:errors path="studentRegistration.org_name"></form:errors></font>
				              <input type="hidden" name="branch"  value="${student.branch}"/>
				             <font color="Red" size="+1"><form:errors path="studentRegistration.branch"></form:errors></font>
                <tr class="row1">
                <td valign="top" align="right"></td>
				             
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="btn" value="Save Changes" onclick="return mobilecheck('this')"></td>
               
                  <td valign="top" align="left"><input type="button" class="btn" onclick="window.location.href='clientviewstudent'"value="Cancel"></td></tr></table>
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
		
<script type="text/javascript">
function mobilecheck()
{
	if(document.getElementById("mob1").value!='' && document.getElementById("mob2").value!=''){
		document.getElementById("mrequires").innerHTML="";
		document.getElementById("mrequires1").innerHTML="";
		var phonenumber=document.getElementById("mob1").value;
		var phonenumber1=document.getElementById("mob2").value;
		if(phonenumber.length<10 && phonenumber1.length<10)
			{
			document.getElementById("mrequires").innerHTML="Invalid Mobile Number";
			document.getElementById("mrequires1").innerHTML="Invalid Mobile Number";
			return false;
			}
	} 
	
	if(document.getElementById("mob1").value!=''){
		document.getElementById("mrequires").innerHTML="";
		document.getElementById("mrequires1").innerHTML="";
		var phonenumber=document.getElementById("mob1").value;
		if(phonenumber.length<10)
			{
			document.getElementById("mrequires").innerHTML="Invalid Mobile Number";
			
			return false;
			}
	} 
	
	if(document.getElementById("mob2").value!=''){
		document.getElementById("mrequires").innerHTML="";
		document.getElementById("mrequires1").innerHTML="";
		var phonenumber1=document.getElementById("mob2").value;
		if(phonenumber1.length<10)
			{
			
			document.getElementById("mrequires1").innerHTML="Invalid Mobile Number";
			return false;
			}
	} 	
	
}

function validateAlpha(){
    var textInput = document.getElementById("pname1").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("pname1").value = textInput;
}

function toTitleCase(pname1)
{

    str=document.getElementById(pname1).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(pname1).value=str;
	
}

function validateAlpha1(){
    var textInput = document.getElementById("pname2").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("pname2").value = textInput;
}

function toTitleCase1(pname2)
{

    str=document.getElementById(pname2).value;
    str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    document.getElementById(pname2).value=str;
	
}

function validatenum(){
    var textInput = document.getElementById("mob1").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("mob1").value = textInput;
}

function validatenum1(){
    var textInput = document.getElementById("mob2").value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById("mob2").value = textInput;
}
</script>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<jsp:include page="footer.jsp"></jsp:include>    