<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  
    <script id="script_bid">
    $(document).ready(function() {
        $("#drop_location_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#pickup_location_id").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#class_standard_id").select2();
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
        $("#pickup_route_id").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
	<form method="POST" action="update_student">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2> Edit Student Registration</h2>
	            </div>
            <div class="contentbox" style="height:700px;">
              <table cellpadding="0" cellspacing="0"  width="100%" border="0">
  				<tr>
    				<td align="left" valign="top" width="100%">
    				<c:set value="${studentRegistrationForm.studentregistration[0]}" var="student"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						
				                <tr class="row1">
    						<td width="5%"></td>
				                  <td valign="middle" align="right" class="input_txt" ><span class="err">*</span> Organization Name:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                 <input type="hidden" name="org_name" id="orgid" value="${student.org_name}"/>${student.org_name}
				                  <br/><font color="Red" size="+1"><form:errors path="studentRegistration.org_name"></form:errors></font></td>
				                  
				                  
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Point Address:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="drop_address" style="height:8px;"><select name="drop_point_address" id="drop_location_id" style="width:220px;" onblur="Validate1('bid')" onchange="doAjaxPost_drop_stop_id()">
							    	<c:forEach items="${drop_location}" var="drop_locations">
							    	<option value="${drop_locations}" <c:if test="${student.drop_point_address==drop_locations}"><c:out value="selected"></c:out></c:if> >${drop_locations}</option>
				                  	</c:forEach>
				                  	</select>
				                  	</div>
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.drop_point_address"></form:errors></font>
				                  	 <span id='drops_stop_id'>
				                  <input type="hidden" name='drop_stop_id' id='drop_stops_id' value="${student.drop_stop_id}">
				                  </span>
				                  	 </td>
				                  	
				                    <td width="15%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2" style="height:50px;">
                        		<td width="3%" class="input_txt"></td>
                        		<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Branch :</td>
				                  <td valign="bottom" align="left" class="input_txt">
				                  	<input type="hidden" name="branch" id="bid" value="${student.branch}"/>${student.branch}
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.branch"></form:errors></font></td>
				                  	
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span> KG Drop :</td>
				                  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="checkbox"  id="inp_id" name="kg_drop" value="${student.kg_drop}" />
				                  	
				                  </td>
				                  <td width="15%" class="input_txt"></td>
				                </tr>

								 
								<tr class="row1" style="height:50px;">
								<td width="3%" class="input_txt"></td>
								<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Student Roll Number:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                  	<input type="hidden" class="student_txtbx_height_right" id="inp_id" name="student_roll_no" value="${student.student_roll_no}"/>${student.student_roll_no} <br/>
				                  	 <br/><font color="Red" size="+1"><form:errors path="studentRegistration.student_roll_no"></form:errors></font></td>
				                
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Name 1:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text"  id="pname1" name="parent_name1" oninput="validateAlpha2();" onblur="toTitleCase2('pname1')" value="${student.parent_name1}"/>
					                <br/><font color="Red" size="+1"><span id="p1error"><form:errors path="studentRegistration.parent_name1"></form:errors></span></font></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2" style="height:50px;">
				                 <td width="3%" class="input_txt"></td>
				                        <td valign="middle" align="right" class="input_txt"><span class="err">*</span> First Name:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="fname" name="first_name" oninput="validateAlpha();" onblur="toTitleCase('fname')" value="${student.first_name}"/>
				                  	 <br/><font color="Red" size="+1"><span id="fnameerror"><form:errors path="studentRegistration.first_name"></form:errors></font></span></td>
				                     <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Name 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="pname2" name="parent_name2" oninput="validateAlpha3();" onblur="toTitleCase3('pname2')" value="${student.parent_name2}"/>
					         <br/><font color="Red" size="+1"><span id="p2error"><form:errors path="studentRegistration.parent_name2"></form:errors></span></font></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1" style="height:50px;">
				                <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Last Name:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="lname" name="last_name" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" value="${student.last_name}"/>
				                  	   <br/><font color="Red" size="+1"><span id="lnameerror"><form:errors path="studentRegistration.last_name"></form:errors></font></span></td>
				                
				         
				                
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Parent Mobile 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="mob1" name="parent_mobile1" oninput="validatenum();" min="10" maxlength="10" value="${student.parent_mobile1}" />
					         <br/><font color="Red" size="+1"><form:errors path="studentRegistration.parent_mobile1"></form:errors></font></td>
					              
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2" style="height:50px;">
				                
				                <td width="3%" class="input_txt"></td>
					            	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Gender :</td>
						            <td valign="middle" align="left" class="input_txt">
						             <c:choose>
					                <c:when test="${student.gender=='M'}">
					                <input type="radio" value="M" name="gender" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                <input type="radio" value="F" name="gender">FeMale
					                </c:when>
					                
					                <c:otherwise>
					                <input type="radio" value="M" name="gender">Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                <input type="radio" value="F" name="gender" checked>FeMale
					                
					                </c:otherwise>
					                </c:choose>
						            	
						            	</td>
						            	
						       
				                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Mobile 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  name="parent_mobile2" id="mob2" oninput="validatenum1();" min="10" maxlength="10" value="${student.parent_mobile2}"/>
					        <br/><font color="Red" size="+1"><span id="mob2error"></span><form:errors path="studentRegistration.parent_mobile2"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1" style="height:50px;">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Avail Transport Facility :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<c:choose>
				                  	<c:when test="${student.transport_facility=='yes'}">
				                  	<input type="radio" name="transport_facility" value="yes" class="input_txt" checked="checked">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt">No&nbsp;&nbsp;&nbsp;
				                  	</c:when>
				                  	<c:otherwise>
				                  	<input type="radio" name="transport_facility" value="yes" class="input_txt">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt"  checked="checked">No&nbsp;&nbsp;&nbsp;
				                  	</c:otherwise>
				                  	</c:choose>
				                  	 
				                  <!-- <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.transport_facility"></form:errors></font> -->	
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 1:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="email1" name="parent_email1" oninput="validateemail1()" value="${student.parent_email1}" />
					         <br/><font color="Red" size="+1"><span id="eiderror"><form:errors path="studentRegistration.parent_email1"></form:errors></font></span>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Route No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="info1"><select name="pickup_route_no" id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" style="width:220px;" value="${student.pickup_route_no}">
					              <c:forEach items="${route_no}" var="route_no" varStatus="status">
					               <option value="${route_no}"<c:if test="${student.pickup_route_no==route_no}"><c:out value="selected"></c:out></c:if> >${route_no}</option> 
			                  </c:forEach>
			                  </select>
			                  </div>
			                  <br/><font color="Red" size="+1"><form:errors path="studentRegistration.pickup_route_no"></form:errors></font>
				                  	</td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Parent Email 2:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="email2" name="parent_email2" oninput="validateemail2()" value="${student.parent_email2}"/>
					      <br/><font color="Red" size="+1"><span id="eiderror1"><form:errors path="studentRegistration.parent_email2"></form:errors></font></span>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Pickup Point Address :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <div id="pickup_address" style="height:8px;"><select name="pickup_point_address" id="pickup_location_id"  style="width:220px;" onblur="Validate1('bid')" onchange="doAjaxPost_pickup_stop_id()">
							    <c:forEach items="${pickup_location}" var="pickup_locations">
							    <option value="${pickup_locations}" <c:if test="${student.pickup_point_address==pickup_locations}"><c:out value="selected"></c:out></c:if> >${pickup_locations}</option>
				                  	</c:forEach>
				                  	</select>
				                  	</div>
				                  	<br/><font color="Red" size="+1"><form:errors path="studentRegistration.pickup_point_address"></form:errors></font>
				                  <span id='pickups_stop_id'>
				                  <input type="hidden" name='pickup_stop_id' id='pickup_stops_id' value="${student.pickup_stop_id}">
				                  </span>
				                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Class:</td>
					               <td valign="middle" align="left" class="input_txt">
					               <div id="info3"> <select name="class_standard" id="class_standard_id" style="width:220px;" onchange="doAjaxPost_section()"  >
					               <c:forEach items="${class_std}" var="class_std" varStatus="status">
					               <option value="${class_std}" <c:if test="${student.class_standard==class_std}"><c:out value="selected"></c:out></c:if> >${class_std}</option>
					              </c:forEach> 
					               </select></div>
					               <br/><font color="Red" size="+1"><form:errors path="studentRegistration.class_standard"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="3%" class="input_txt"></td>
				                <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Drop Route No :</td>
				                  	<td valign="middle" align="left" class="input_txt">
				                  	 <div id="info2"><select name="drop_route_no" style="width:220px;" onchange="doAjaxPost_drop_route_no()" id="drop_route_id">
					               <c:forEach items="${route_no}" var="route_no" varStatus="status">
					              <option value="${route_no}" <c:if test="${student.drop_route_no==route_no}"><c:out value="selected"></c:out></c:if> >${route_no}</option>
			                  </c:forEach>
			                  
			                  </select> </div>
			                  <br/><font color="Red" size="+1"><form:errors path="studentRegistration.drop_route_no"></form:errors></font>
			                  </td>
				                  
				                    <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Section:</td>
					               <td valign="middle" align="left" class="input_txt">
					              <div id="info_section"> <select name="section" id="section_id"  style="width:220px;" >
					               <c:forEach items="${studsection}" var="classSection" varStatus="status">
        				        <option value="${classSection}" <c:if test="${student.section==classSection}"><c:out value="selected"></c:out></c:if>  >${classSection}</option>
			                  </c:forEach>
					               </select></div>
					        <br/><font color="Red" size="+1"><form:errors path="studentRegistration.section"></form:errors></font>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				               
					                
                <tr class="row">
                <td valign="top" align="right"></td>
				               <td valign="top" align="right"></td>
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="btn" value="Save Changes" onclick="return validate('this')"></td>
               
                  <td valign="top" align="left"><input type="button" class="btn" onclick="window.location.href='viewstudent'"value="Cancel"></td></tr></table>
                  </td>
                 </table>
                 </td>
                 <td valign="top" align="left"></td>
                 </tr>
              </table></div>
         	</td>
  		</tr>
 	</table>
</form>
</div>
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
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
function doAjaxPost_pickup_stop_id() {  
	/* alert("hi"); */
	var pickup_route_no = $('#pickup_route_id').val();
	var pickup_point_address=$('#pickup_location_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/pickup_stop_id_ajax",  
		    data: "pickup_route_no="+pickup_route_no+"&pickup_point_address="+pickup_point_address,
		    success: function(response){  
		
$('#pickups_stop_id').html(response);

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
function doAjaxPost_drop_stop_id() {  
	/* alert("hi"); */
	var drop_route_no = $('#drop_route_id').val();
	var drop_point_address=$('#drop_location_id').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/drop_stop_id_ajax",  
		    data: "drop_route_no="+drop_route_no+"&drop_point_address="+drop_point_address,
		    success: function(response){  
		
$('#drops_stop_id').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>

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
		
		 
    <script>
      $(function() {
		$("#fname").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
    $(function() {
		$("#lname").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
    $(function() {
		$("#pname1").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
    $(function() {
		$("#pname2").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
    
    function validate()
    {
    	document.getElementById("fnameerror").innerHTML="";
    	document.getElementById("lnameerror").innerHTML="";
    	if(document.getElementById("fname").value.substring(0,1)==' ')
		{
		document.getElementById("fnameerror").innerHTML="Invalid Firstname";
		return false;
		}
    	if(document.getElementById("lname").value.substring(0,1)==' ')
		{
		document.getElementById("lnameerror").innerHTML="Invalid Lastname";
		return false;
		}
    	if(document.getElementById("pname1").value.substring(0,1)==' ')
		{
		document.getElementById("p1error").innerHTML="Invalid Parentname";
		return false;
		}
    	if(document.getElementById("pname2").value.substring(0,1)==' ')
		{
		document.getElementById("p2error").innerHTML="Invalid Parentname";
		return false;
		}
    	
    	if(document.getElementById("mob2").value!="")
		{
	if(document.getElementById("mob1").value==document.getElementById("mob2").value)
    {
    	document.getElementById("mob2error").innerHTML="Mobile number should not be the same<br/>";
    	
        return false;
    }
		}
    	
    	var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	    
		 if(document.getElementById("email1").value!="")
			{
		if(document.getElementById("email1").value.match(mail)==null)
	    {
	    	document.getElementById("eiderror").innerHTML="Invalid Email ID";
	    	
	        return false;
	    }
			}
		 if(document.getElementById("email2").value!="")
			{
		if(document.getElementById("email2").value.match(mail)==null)
	    {
	    	document.getElementById("eiderror1").innerHTML="Invalid Email ID";
	    	
	        return false;
	    }
			}
		 if(document.getElementById("email2").value!="")
			{
		if(document.getElementById("email2").value==document.getElementById("email1").value)
	    {
	    	document.getElementById("eiderror1").innerHTML="Email ID's should not be same";
	    	
	        return false;
	    }
			}
    }
    function validateAlpha(){
        var textInput = document.getElementById("fname").value;
        textInput = textInput.replace(/[^A-Za-z ]/g, "");
        document.getElementById("fname").value = textInput;
    }

    function toTitleCase(fname)
    {
    	
        str=document.getElementById(fname).value;
        str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
        document.getElementById(fname).value=str;
    	
    }

    function validateAlpha1(){
        var textInput = document.getElementById("lname").value;
        textInput = textInput.replace(/[^A-Za-z ]/g, "");
        document.getElementById("lname").value = textInput;
    }

    function toTitleCase1(lname)
    {
    	
        str=document.getElementById(lname).value;
        str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
        document.getElementById(lname).value=str;
    	
    }

    function validateAlpha2(){
        var textInput = document.getElementById("pname1").value;
        textInput = textInput.replace(/[^A-Za-z ]/g, "");
        document.getElementById("pname1").value = textInput;
    }

    function toTitleCase2(pname1)
    {
    	
        str=document.getElementById(pname1).value;
        str= str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
        document.getElementById(pname1).value=str;

    	}

    function validateAlpha3(){
        var textInput = document.getElementById("pname2").value;
        textInput = textInput.replace(/[^A-Za-z ]/g, "");
        document.getElementById("pname2").value = textInput;
    }

    function toTitleCase3(pname2)
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
    function validateemail1(){
        var textInput = document.getElementById("email1").value;
        textInput = textInput.replace(/[^A-Za-z0-9_@.]/g, "");
        document.getElementById("email1").value = textInput;
    }
    
    function validateemail2(){
        var textInput = document.getElementById("email2").value;
        textInput = textInput.replace(/[^A-Za-z0-9_@.]/g, "");
        document.getElementById("email2").value = textInput;
    }

    </script>

<jsp:include page="footer.jsp"></jsp:include>