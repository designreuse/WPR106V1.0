<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_bid">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#section_id").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#drop_route_id").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#class_standard_id").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#pickup_location_id").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#drop_location_id").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#pickup_route_id").select2();
    });
</script>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<form action="studentregistration" method="POST">
<table class="margin_table">
      
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>Student Registration</h2> 
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
  				<tr>
    				<td align="left" valign="top" width="100%">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
    						<td width="25%" class="input_txt"></td>
				                  <td valign="middle" align="left" class="input_txt"  width="25%"><span class="err">*</span> Organization Name</td>
				                  <td width="0.5%">:</td><td valign="top" align="left" class="input_txt">
				                  	<select  onchange="doAjaxPost()" style="width:220px;"name="org_name" id="orgid">
							   <option value="Selected">-- Select Organization--</option>
							    <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}">${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				                 
				                  <td valign="middle" align="left" class="input_txt" width="25%"><span class="err">*</span> Drop Point Address</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;">
				                  	<select  name="drop_point_address" style="width:220px;"id="drop_location_id" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select Drop Location--</option>
				                  	</select>
				                  	</div>
				                    <td width="25%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2" rowspan="2">
                        		<td width="5%" class="input_txt"></td>
                        		<td valign="middle" align="left" class="input_txt" ><span class="err">*</span>Branch <br/>.</td>:</td><td width="0.5%">:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<div id="info" style="height:8px;">
				                  	<select  style="width:220px;"onchange="doAjaxPost1()" name="branch" id="bid" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select branch--</option>
				                  	</select><br/>
				                  	</div>
				                  	</td>
				                 <td valign="middle" align="left" class="input_txt"><span class="err">*</span> KG Drop </td><td width="0.5%">:</td>
				                  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="checkbox"  id="inp_id" name="kg_drop" value="${studentDetails.pickup_location}" />
				                  	
				                  </td>
				                  <td width="15%" class="input_txt"></td>
				                </tr>

								 
								<tr class="row1">
								<td width="5%" class="input_txt"></td>
								<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Student Roll Number </td><td width="0.5%">:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="inp_id" name="student_roll_no" value="${studentDetails.student_roll_no}"/><br/>
				                  	<font color="Red" size="+1"><form:errors path="StudentRegistration.student_roll_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Name 1</td><td width="0.5%">:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text"  id="inp_id" name="parent_name1" value="${studentDetails.drop_route_no}"/>
					               <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_route_no"></form:errors></font> --></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2">
				                 <td width="5%" class="input_txt"></td>
				                        <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="inp_id" name="first_name" />
				                  	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.student_class"></form:errors></font></td>
				                     <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Parent Name 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_name2" />
					         <!--  <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.drop_location"></form:errors></font>--></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1">
				                <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Last Name</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="inp_id" name="last_name" />
				                  	      	<br/><font color="Red" size="+1"><form:errors path="StudentRegistration.section"></form:errors></font></td>
				                
				         
				                
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Parent Mobile 1</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_mobile1" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.father_name"></form:errors></font>
					              </td>
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2">
				                
				                <td width="5%" class="input_txt"></td>
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Gender </td><td width="0.5%">:</td>
						            <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            	<input type="radio" value="M" name="gender" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="F" name="gender">FeMale
						            	<font color="Red" size="+1"><form:errors path="StudentRegistration.name"></form:errors></font></td>
						            	
						       
				                 <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Mobile 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  name="parent_mobile2" id="inp_id"/>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.mobile_number"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Avail Transport Facility </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	 <input type="radio" name="transport_facility" value="yes" class="input_txt" checked="checked">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt">No&nbsp;&nbsp;&nbsp;
				                  <!-- <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.transport_facility"></form:errors></font> -->	
				                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Email 1</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_email1" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Pickup Route No </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info1">
				                  	 <select style="width:220px;"name="pickup_route_no"  id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" disabled="disabled">
					               <option value="" selected>--Select PickUp Route No--</option>
					               <%-- <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option> 
			                  </c:forEach>--%>
			                  </select>
			                  </div>
				                  	</td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Email 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="inp_id" name="parent_email2" />
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Pickup Point Address </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="pickup_address" style="height:8px;">
				                  	 <select  name="pickup_point_address" style="width:220px;"id="pickup_location_id" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select PickUp Location--</option>
				                  	</select>
				                  	</div>
				                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Class</td><td width="0.5%">:</td>
					               <td valign="middle" align="left" class="input_txt">
					               <div id="info3">
					                <select name="class_standard" id="class_standard_id"style="width:220px;" onchange="doAjaxPost_section()" disabled="disabled" >
					               <option value="" selected>--Select Class--</option>
					               <%-- <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.class_std}">${classSection.class_std}</option>
			                  </c:forEach> --%>
					               </select></div>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Drop Route No </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info2"><select style="width:220px;" name="drop_route_no"  onchange="doAjaxPost_drop_route_no()" id="drop_route_id" disabled="disabled">
					               <option value="" selected>--Select Drop Route No--</option>
					               <%-- <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option>
			                  </c:forEach> --%>
			                  
			                  </select> </div>
			                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Section</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					              <div id="info_section"> 
					              <select style="width:220px;"name="section" id="section_id" disabled="disabled">
					               <option value="" selected>--Select Section--</option>
					               <%-- <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.section}">${classSection.section}</option>
			                  </c:forEach> --%>
					               </select></div>
					         <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.email_id"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				               </table>
				                <table style="margin:0 0 0 30%;">
                <tr class="row1">
				              <td valign="top" align="left" colspan="3"></td>
                
                 <td valign="top">
                  <table cellpadding="0" cellspacing="0" border="0" >
                  <tr>
                  <td ><input type="submit" class="btn" value="Register" onclick=""></td>
                  <td> 
                 
                   <input type="reset" class="btn" value="Reset" >
                 
                  </td>
                  <td> 
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel">
                  </td>
                  
                  </tr>
                  </table></td>
                  
				              
				               </tr>
                 </table>
                 </td>
                 </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form></div></div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/stud_ajax",  
		    data: "org_name="+orgname,
		    success: function(response){  
		
$('#info').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
</script>

<!-- for getting route_no and class -->

<script type="text/javascript">
function doAjaxPost1() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	var branch=$('#bid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/stud_route_ajax",  
		    data: "org_name="+orgname+"&branch="+branch,
		    success: function(response){  
		var two_drop=response.split("<split>");
		    	
$('#info1').html(two_drop[0]);
$('#info2').html(two_drop[1]);
$('#info3').html(two_drop[2]);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
		
<!-- for getting section -->		

<script type="text/javascript">
function doAjaxPost_section() { 
	//alert("calling!!!");
	var orgname = $('#orgid').val();
	var branch=$('#bid').val();
	var classstandard=$('#class_standard_id').val();
	
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/stud_section_ajax",  
		    data: "org_name="+orgname+"&branch="+branch+"&class_standard="+classstandard,
		    success: function(response){
		    	
	$('#info_section').html(response);
	},  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		

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
		      $("#errmsg2").html("Kindly give numbers").show();
		             return false;
		 	 }
		   else{
		  	 $("#errmsg2").html("Kindly give numbers").fadeOut();
		  	 }
		 });
	
	}); 
	function validateemail(){
		
		var email=document.getElementByName(email_id).value;
		atpos=email.indexof("@");
		dotpos=email.lastindexof(".");
		if(atpos<1||(dotpos-atpos)<2)
			{
			$("errmsg3").html("Enter Correct Email").show();
			return false;
			}
		else{
			$("errmsg3").html("Enter Correct Email").fadeout();
		}
	}
	
</script>
<script type="text/javascript">
function validat(org_id){
	
	if (org_id.value == ' '){
	alert("You must select a Driver Id");
	setTimeout(function(){document.getElementById("inp_id_org").focus();}, 1);
	return false;
	}


	}


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
   
<jsp:include page="footer.jsp"></jsp:include>