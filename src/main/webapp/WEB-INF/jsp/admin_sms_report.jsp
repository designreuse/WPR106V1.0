<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});

	jQuery("#startDate").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate1").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#endDate").on("dp.change",function (e) {
    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate1").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	
});
});//]]>  

</script>


   <!-- ######################################DDDL END HERE@############################################## -->
  <script id="script_orgid">
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
        $("#student_roll_id").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table class="margin_table" > 
     		<tr>
        		<td valign="top" align="left">
        		<div class="headings altheading">
			          <h2>Track SMS</h2>
			          <div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
			        </div>
               
<div style="display:none" id="div"><div class="searchpanel">
<form action="adminsmsreport" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
							
        				    <tr style="height:20px;">
							  <td valign="middle" align="left" class="input_txtlabel" width="15%">
				                  Organization Name:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                <select  name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option selected>-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname" varStatus="status">
        				        <option value="${orgname}" <c:if test="${orgname==org_name}"><c:out value="Selected"/></c:if>>${orgname}</option>
			                     </c:forEach>
			                      </select>
				              </td>
				              <td valign="middle" align="left" class="input_txtlabel" width="10%">
				                  Branch :</td>
				                  <td valign="middle" align="left" class="input_txt">
				                 <!-- <div id="info"> 
				                 	<select style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" onchange="doAjaxPost_student_roll_no()" >
							   <option value="">-- Select branch--</option>
							  </select>
        				       </div>  -->
        				       <span id="info">  
				                  	 	<c:choose>
							  	  <c:when test="${fn:length(branch_array) gt 0}">
				                 	<select  style="width:220px;margin-top:-4px;" id="bid" name="branch" >
				                 	<option selected>--Select Branch--</option>
							  		<c:forEach items="${branch_array}" var="orgReg" >
							  		<option value="${orgReg}" <c:if test="${orgReg==branch}"><c:out value="Selected"/></c:if>>${orgReg}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select style="width:220px;margin-top:-4px;" name="branch" id="bid"  >
							  		<option selected>-- Select branch--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
								</span>
        				       
				                  </td>
				                  
				                  <td align="left" valign="middle" width="15%">Student Roll No:</td>
							    <td align="left" valign="bottom">
							   <!--  <div id="info1"> 
				                 	<select style="width:220px;margin-top:-4px;" name="student_roll_no" id="student_roll_id" onblur="Validate1('bid')" >
							   <option value="">-- Select student--</option>
							  </select>
        				       </div> -->
        				       <span id="info1">  
				                  	 	<c:choose>
							  	  <c:when test="${fn:length(roll_array) gt 0}">
				                 	<select  style="width:220px;margin-top:-4px;" id="student_roll_id" name="student_roll_no" >
				                 	<option selected>--Select Roll No--</option>
							  		<c:forEach items="${roll_array}" var="roll" >
							  		<option value="${roll}" <c:if test="${roll==student_roll_no}"><c:out value="Selected"/></c:if>>${roll}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select style="width:220px;margin-top:-4px;" name="student_roll_no" id="student_roll_id"  >
							  		<option selected>-- Select Roll No--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
								</span>
        				        </td>
				                  </tr>
				                
				                <tr style="height:20px;">  
							   <td align="left" valign="middle" class="input_txtlabel" width="20%">From Date:</td>
							    <td align="left" valign="bottom" style="padding-top: 10px;">
							    <span class='input-group date' id='endDate1' >
							    <input type="text" id="fromdate" name="from_date" value="${sms_report.from_date}" width="-10%"/>
							   <span class="add-on" style="margin:0 0 0 0px;float:right">
							   <img src="resources/images/date.png" width="25" height="45"/>
        							</span></span>
							    </td>
							   
							    <td align="left" valign="middle" class="input_txtlabel" width="10%">To Date:</td>
							    <td align="left" valign="bottom" style="padding-top: 10px;">
							    <span class='input-group date' id='endDate' >
							    <input type="text" id="todate" value="${sms_report.to_date}" name="to_date">
							    <span class="add-on" style="margin:0 0 0 0px;float:right">
							   <img src="resources/images/date.png" width="25" height="45"/>
        							</span></span>
							    </td>
							    <td align="center" valign="middle"></td>
							  <td align="center" valign="bottom" width="30%">
							  <input type="submit" class="btn" value="Search" ></td>
							 </tr>
							 
							
							</table>
							</form>
						</div>
					</div>
						
			     
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="10%">Organization</td>
        						<td valign="top" align="left" width="10%">Branch</td>
								<td valign="top" align="left" width="10%">Student Roll No</td>		
									<td valign="top" align="left" width="10%">Mobile Number</td>
									<td valign="top" align="left" width="10%">Date/Time</td>					
					         		<td valign="top" align="left" width="10%">Status</td>
          								
        					</tr>
        					<c:forEach items="${reportForm.reports}" var="adminsmsreport" varStatus="status">
        				  
        					<tr class="row1">
        					<td valign="top" align="left" width="10%">${adminsmsreport.org_name}</td>
        					<td valign="top" align="left" width="10%">${adminsmsreport.branch}</td>
        					   	<td valign="top" align="left" width="10%">${adminsmsreport.student_roll_no }</td>					
					         	<td valign="top" align="left" width="10%">${adminsmsreport.mobile_number}</td>
          						<td valign="top" align="left" width="10%">${adminsmsreport.sms_trigger_time }</td>
          						<td valign="top" align="left" width="10%">${adminsmsreport.status }</td>
          							
        					</tr>
        					</c:forEach>
        					<tr>
        					<td valign="top" align="right" style="padding:20px;" colspan="6">
        					<form action="export_adminsmstrack" method="post">
        					<input type="submit" class="btn" value="Export to excel"/>
        				</form>
        					</td></tr>
        					
        					
        					  </table>
        					
        					
        					
        					
        					</td>
        					</tr>
        					</table>
        					</div>
        					</div>
        <script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/student_roll_no_ajax",  
		    data: "org_name=" + orgname,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info').html(response);
/* var select = document.getElementById("bid");
var option = document.createElement('option');
option.text = option.value = response;
select.add(option, 0); */
/* alert("shgjasgdjs"); */
   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
		<script type="text/javascript">
function doAjaxPost_student_roll_no() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	var branch = $('#bid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/student_roll_no",  
		    data: "org_name=" + orgname+"&branch="+branch,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info1').html(response);

   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
		<jsp:include page="footer.jsp"></jsp:include>
