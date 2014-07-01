<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" style="height:600px">
  				<tr>
    				<td align="left" valign="top" width="100%">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
    						<td width="25%" class="input_txt"></td>
				                  <td valign="middle" align="left" class="input_txt"  width="25%"><span class="err">*</span> Organization Name</td>
				                  <td width="0.5%">:</td><td valign="top" align="left" class="input_txt">
				                  	<select  onchange="doAjaxPost()" style="width:220px;"name="org_name" id="orgid">
							   <option selected value="">-- Select Organization--</option>
							    <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" <c:if test="${orgname_for_school==org_name}"><c:out value="Selected"/></c:if> >${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				               <br/><font color="Red" size="+1"><form:errors path="student.org_name"></form:errors></font></td>  
				                  <td valign="middle" align="left" class="input_txt" width="25%"><span class="err">*</span> Drop Point Address</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<!-- <div id="drop_address" style="height:8px;">
				                  	<select  name="drop_point_address" style="width:220px;"id="drop_location_id" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select Drop Location--</option>
				                  	</select>
				                  	</div> -->
				                  	 <span id="drop_address" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(drop_address_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="drop_location_id" name="drop_point_address" >
				                 	<option selected value="">--Select Drop Location--</option>
							  		<c:forEach items="${drop_address_array}" var="drop_addr" >
							  		<option value="${drop_addr}" <c:if test="${drop_addr==drop_point_address}"><c:out value="Selected"/></c:if>>${drop_addr}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="drop_point_address" id="drop_location_id" onblur="Validate1('bid')"  >
							    <option selected value="">-- Select Drop Location--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
				                  	
				                  	 <br/><font color="Red" size="+1"><form:errors path="student.drop_point_address"></form:errors></font></td>
				                    <td width="25%" class="input_txt"></td>
				               </tr>
				                
                        		<tr class="row2" rowspan="2">
                        		<td width="5%" class="input_txt"></td>
                        		<td valign="middle" align="left" class="input_txt" ><span class="err">*</span>Branch <br/>.</td>:</td><td width="0.5%">:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<!-- <div id="info" style="height:8px;">
				                  	<select  style="width:220px;"onchange="doAjaxPost1()" name="branch" id="bid" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select branch--</option>
				                  	</select>
				                  	</div> -->
				                  	 <span id="info" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(branch_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="bid" name="branch" onchange="doAjaxPost1()" >
				                 	<option selected>--Select branch--</option>
							  		<c:forEach items="${branch_array}" var="branch1" >
							  		<option value="${branch1}" <c:if test="${branch1==branch}"><c:out value="Selected"/></c:if>>${branch1}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" onchange="doAjaxPost1()" >
							    <option selected value="">-- Select branch--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
				                  	 <br/><font color="Red" size="+1"><form:errors path="student.branch"></form:errors></font></td>
				                  	 
				                 <td valign="middle" align="left" class="input_txt"><span class="err"></span> KG Drop </td><td width="0.5%">:</td>
				                  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<input type="checkbox"  id="inp_id" value="yes" name="kg_drop" <c:if test="${studentDetails.kg_drop=='yes'}"><c:out value="checked=checked"/></c:if> />
				                  	
				                  </td>
				                  <td width="15%" class="input_txt"></td>
				                </tr>

								 
								<tr class="row1">
								<td width="5%" class="input_txt"></td>
								<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Student Roll Number </td><td width="0.5%">:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="rollid" name="student_roll_no" oninput="validateAlpha4();" value="${studentDetails.student_roll_no}"/><br/>
				                  	 <br/><font color="Red" size="+1"><form:errors path="student.student_roll_no"></form:errors></font>
				                  </td>
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Name 1</td><td width="0.5%">:</td>
					                <td valign="top" align="left" class="input_txt">
					                <input type="text"  id="pname1" name="parent_name1" oninput="validateAlpha2();" onblur="toTitleCase2('pname1')" value="${studentDetails.parent_name1}"/>
					               <br/><font color="Red" size="+1"><form:errors path="student.parent_name1"></form:errors></font></td>
				                  
				                   <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                 <tr class="row2">
				                 <td width="5%" class="input_txt"></td>
				                        <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="fname" name="first_name" oninput="validateAlpha();" min="4" maxlength="32" onblur="toTitleCase('fname')" value="${studentDetails.first_name}"/>
				                  	 <br/><font color="Red" size="+1"><span id="fnameerror"><form:errors path="student.first_name"></form:errors></font></span></td>
				                     <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Parent Name 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="pname2" name="parent_name2" oninput="validateAlpha3();" onblur="toTitleCase3('pname2')" value="${studentDetails.parent_name2}" />
					          <br/><font color="Red" size="+1"><form:errors path="student.parent_name2"></form:errors></font></td>
					               	 	
					               	 	<td width="15%" class="input_txt"></td>			                					            	 
				                </tr>
				                <tr class="row1">
				                <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Last Name</td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text"  id="lname" name="last_name" min="4" maxlength="32" oninput="validateAlpha1();" onblur="toTitleCase1('lname')" value="${studentDetails.last_name}" />
				                  	  <br/><font color="Red" size="+1"><span id="lnameerror"><form:errors path="student.last_name"></form:errors></font></span></td>
				                
				         
				                
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Parent Mobile 1</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="mob1" name="parent_mobile1" oninput="validatenum();" min="10" maxlength="10" value="${studentDetails.parent_mobile1}" />
					          <br/><font color="Red" size="+1"><form:errors path="student.parent_mobile1"></form:errors></font>
					              </td>
					              <td width="15%" class="input_txt"></td>
				                </tr>
				                <tr class="row2">
				                
				                <td width="5%" class="input_txt"></td>
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Gender </td><td width="0.5%">:</td>
						            <td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            	<input type="radio" value="M" name="gender" checked <c:if test="${studentDetails.gender=='M'}"><c:out value="checked=checked"/></c:if>>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="F" name="gender" <c:if test="${studentDetails.gender=='F'}"><c:out value="checked=checked"/></c:if>>FeMale
						            	</td>
						            	
						       
				                 <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Mobile 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  name="parent_mobile2" id="mob2" oninput="validatenum1();" min="10" maxlength="10" value="${studentDetails.parent_mobile2}"/>
					         <br/><font color="Red" size="+1"><form:errors path="student.parent_mobile2"></form:errors></font>
					               </td>
					               <td width="15%" class="input_txt"></td>
				                </tr>
				                
				                <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Avail Transport Facility </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	 <input type="radio" name="transport_facility" value="yes" class="input_txt" checked <c:if test="${studentDetails.transport_facility=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;
					                <input type="radio" name="transport_facility" value="no" class="input_txt" <c:if test="${studentDetails.transport_facility=='no'}"><c:out value="checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				                  <!-- <br/><font color="Red" size="+1"><form:errors path="StudentRegistration.transport_facility"></form:errors></font> -->	
				                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Email 1</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="email1" name="parent_email1" oninput="validateemail1()" value="${studentDetails.parent_email1}" />
					         <br/><font color="Red" size="+1"><span id="eiderror"><form:errors path="student.parent_email1"></form:errors></font></span></td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Pickup Route No </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                    <div id="info1">
				                  	 <select style="width:220px;"name="pickup_route_no"  id="pickup_route_id" onchange="doAjaxPost_pickup_route_no()" >
					               <option  selected value="">--Select PickUp Route No--</option>
					              
			                  </select>
			                  </div> 
			                   
				                  <br/><font color="Red" size="+1"><form:errors path="student.pickup_route_no"></form:errors></font> 	</td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Parent Email 2</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					               <input type="text"  id="email2" name="parent_email2" oninput="validateemail2()" value="${studentDetails.parent_email2}" />
					        <br/><font color="Red" size="+1"><span id="eiderror1"><form:errors path="student.parent_email2"></form:errors></font></span></td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row1">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Pickup Point Address </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <!-- <div id="pickup_address" style="height:8px;">
				                  	 <select  name="pickup_point_address" style="width:220px;"id="pickup_location_id" onblur="Validate1('bid')" disabled="disabled">
							    <option value="Selected">-- Select PickUp Location--</option>
				                  	</select>
				                  	</div> -->
				                  	 <span id="pickup_address" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(pickup_address_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="pickup_location_id" name="pickup_point_address" >
				                 	<option selected value="">--Select Pickup Location--</option>
							  		<c:forEach items="${pickup_address_array}" var="pickup_addr" >
							  		<option value="${pickup_addr}" <c:if test="${pickup_addr==pickup_point_address}"><c:out value="Selected"/></c:if>>${pickup_addr}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="pickup_point_address" id="pickup_location_id" onblur="Validate1('bid')"  >
							    <option  selected value="">-- Select Pickup Location--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
				                  	 <br/><font color="Red" size="+1"><form:errors path="student.pickup_point_address"></form:errors></font>
				                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Class</td><td width="0.5%">:</td>
					               <td valign="middle" align="left" class="input_txt">
					              <%--  <div id="info3">
					                <select name="class_standard" id="class_standard_id"style="width:220px;" onchange="doAjaxPost_section()" disabled="disabled" >
					               <option value="" selected>--Select Class--</option>
					               <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.class_std}">${classSection.class_std}</option>
			                  </c:forEach> 
					               </select></div> --%>
					               <span id="info3" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(class_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="class_standard_id" name="class_standard" onchange="doAjaxPost_section()">
				                 	<option selected value="">--Select Class--</option>
							  		<c:forEach items="${class_array}" var="class_std" >
							  		<option value="${class_std}" <c:if test="${class_std==class_standard}"><c:out value="Selected"/></c:if>>${class_std}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="class_standard" id="class_standard_id" onblur="Validate1('bid')" onchange="doAjaxPost_section()" >
							    <option selected value="">-- Select Class--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
					               <br/><font color="Red" size="+1"><form:errors path="student.class_standard"></form:errors></font> </td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				                      <tr class="row2">
				                    <td width="5%" class="input_txt"></td>
				                <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Drop Route No </td><td width="0.5%">:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <span id="info2" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(drop_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="drop_route_id" name="drop_route_no" onchange="doAjaxPost_drop_route_no()">
				                 	<option selected value="">--Select Drop Route No--</option>
							  		<c:forEach items="${drop_array}" var="drop" >
							  		<option value="${drop}" <c:if test="${drop==drop_route_no}"><c:out value="Selected"/></c:if>>${drop}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="drop_route_no" id="drop_route_id" onblur="Validate1('bid')" onchange="doAjaxPost_drop_route_no()" >
							    <option selected value="">-- Select drop Route No--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
				                  	 <%-- <div id="info2"><select style="width:220px;" name="drop_route_no"  onchange="doAjaxPost_drop_route_no()" id="drop_route_id" disabled="disabled">
					               <option value="" selected>--Select Drop Route No--</option>
					                <c:forEach items="${route_no}" var="route_no" varStatus="status">
        				        <option value="${route_no}">${route_no}</option>
			                  </c:forEach> 
			                  
			                  </select> </div> --%>
			                   <br/><font color="Red" size="+1"><form:errors path="student.drop_route_no"></form:errors></font>
			                  </td>
				                  
				                    <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Section</td><td width="0.5%">:</td>
					               <td valign="top" align="left" class="input_txt">
					              <%-- <div id="info_section"> 
					              <select style="width:220px;"name="section" id="section_id" disabled="disabled">
					               <option value="" selected>--Select Section--</option>
					               <c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				        <option value="${classSection.section}">${classSection.section}</option>
			                  </c:forEach> 
					               </select></div> --%>
					                <span id="info_section" style="height:8px;" >
						            <c:choose>
						            <c:when test="${fn:length(section_array) gt 0}">
						            <select  style="width:220px;margin-top:-4px;" id="section_id" name="section" >
				                 	<option selected value="">--Select Section--</option>
							  		<c:forEach items="${section_array}" var="sec" >
							  		<option value="${sec}" <c:if test="${sec==section}"><c:out value="Selected"/></c:if>>${sec}</option>
							  		</c:forEach>
								    </select>
						            </c:when>
						            <c:otherwise>
						            <select   style="width:220px;margin-top:-4px;" name="section" id="section_id" onblur="Validate1('bid')" >
							    <option selected value="">-- Select section--</option>
							     </select>
						            </c:otherwise>
						            </c:choose>
						            </span>
					         <br/><font color="Red" size="+1"><form:errors path="student.section"></form:errors></font></td>
					               <td width="15%" class="input_txt"></td>
				                     </tr>
				               </table>
				                <table style="margin:0 0 0 30%;">
                <tr class="row1">
				              <td valign="top" align="left" colspan="3"></td>
                
                 <td valign="top">
                  <table cellpadding="0" cellspacing="0" border="0" >
                  <tr>
                  <td ><input type="submit" class="btn" value="Save" onclick="return validate('this')"></td>
                  <td> 
                 
                   <input type="button" onclick="window.location.href='studentregistration'" class="btn" value="Reset" >
                 
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
    
    <script>
    function validate()
    {
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
    }
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
        textInput = textInput.replace(/[^A-Za-z]/g, "");
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
        textInput = textInput.replace(/[^A-Za-z]/g, "");
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
    function validateAlpha4(){
        var textInput = document.getElementById("rollid").value;
        textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
        document.getElementById("rollid").value = textInput;
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