<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
<!--   	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->

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
 <jsp:include page="header.jsp"></jsp:include> 


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table" style="height:900px">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			         <h2> Reports </h2>
                    
			        </div>
			    
			    
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	
	<tr>

		<td>
			
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%" class="order-table table">
							
        					
        				      <tr style="height:50px">
							     <td valign="middle" align="left" class="input_txtlabel" width="15%">
				                  <span class="err">*</span>Organization Name</td><td>:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                <select  name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname" varStatus="status">
        				        <option value="${orgname}" >${orgname}</option>
			                     </c:forEach>
			                      </select>
				              </td>
				              <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Branch </td><td>:</td>
				                  <td valign="middle" align="left" class="input_txt">
				                 <div id="info"> 
				                 	<select style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" disabled="disabled">
							   <option value="">-- Select branch--</option>
							  </select>
        				       </div> 
				                  </td>
				              
					       </tr>
							    
							    
							  <tr>
							    	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> From Date </td><td>:</td>
				                  
				                  <td valign="top" align="left" class="input_txt">
				                  	<span class='input-group date' id='endDate' >
				                  	<input type="text" class="org_input_txtbx_height1" id="fromdate"  onblur="toTitleCase('fdate')" value="${adminuser.firstname }" name="fromdate" />
				                  	<span class="add-on" style="margin:0 125px 0 0px;float:right">
									<img src="resources/images/date.png" width="25" height="45"/>
        							</span>
				                  	</span>
				                  	</td>
				                  	
				                  	
				                  	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> To Date </td><td>:</td>
				                  
				                  <td valign="top" align="left" class="input_txt">
				                  <span class='input-group date' id='endDate1' >
				                  	<input type="text" class="org_input_txtbx_height1" id="todate"  onblur="toTitleCase('tdate'')" value="${adminuser.firstname }" name="todate" />
				                  	 <span class="add-on" style="margin:0 125px 0 0px;float:right">
									<img src="resources/images/date.png" width="25" height="45"/>
        							</span></span>
				                  	</td>
				                  	
							   </tr>
						
						</table>
        				
        			
        				
        				</td>
        				</tr>
        				</table></td></tr>
        				</table>
        				</div></div>
        				
        				

<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_user_ajax",  
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



<jsp:include page="footer.jsp"></jsp:include>
