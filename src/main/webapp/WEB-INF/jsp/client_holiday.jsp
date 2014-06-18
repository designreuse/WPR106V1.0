<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 -->
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->

 <style>#div {display: none}
</style>

<script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
	 $(document).ready( function() {
		    var now = new Date();
		 
		    var day = ("0" + now.getDate()).slice(-2);
		    var month = ("0" + (now.getMonth() + 1)).slice(-2);

		    var today = now.getFullYear()+"/"+(month)+"/"+(day) ;


		   $('#datePickertest').val(today);
		    
		    
		});
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});

	jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate2').datetimepicker({ format: 'yyyy/MM/dd' ,pickTime: false});
    
	jQuery("#startDate").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate1").on("dp.change",function (e) {
    jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);});
    
	jQuery("#startDate").on("dp.change",function (e) {
	    jQuery('#endDate2').data("DateTimePicker").setMinDate(e.date);});
	
	jQuery("#endDate").on("dp.change",function (e) {
    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	jQuery("#endDate1").on("dp.change",function (e) {
	    jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);});

	
});
});//]]>  

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

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_class_ajax",  
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


<form action="client_insert_holiday" method="POST" onload="oneshow()">
<table class="margin_table">

      <tr>
      
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>Holiday Entry</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1"><td width="25%"></td>
				                  <td valign="middle" align="left" class="input_txt" width="14%" ><span class="err">*</span> Organization Name</td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select style="width:220px;"name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')" value="">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" <c:if test="${orgname_for_school==org_name}"><c:out value="Selected"/></c:if>>${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				                  	<br/><font color="Red" size="+1"><form:errors path="holidays.org_name"></form:errors></font>
				                  </td>
				               </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                        		<tr class="row2"><td width="25%"></td> 
                        		<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Branch<br/><span style="color:#f5f5f5;">.</span></td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	
				                  	 <div id="info"  >
				                  	 <span id="info">  
				                  	 	<c:choose>
							  	  <c:when test="${fn:length(branch_array) gt 0}">
				                 	<select  style="width:220px;margin-top:-4px;" id="bid" name="branch" >
				                 	<option value="">--Select Branch--</option>
							  		<c:forEach items="${branch_array}" var="orgReg" >
							  		<option value="${orgReg}" <c:if test="${orgReg==branch}"><c:out value="Selected"/></c:if>>${orgReg}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select style="width:220px;margin-top:-4px;" name="branch" id="bid"  >
							  		<option value="">-- Select branch--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
								</span>
							  <br/><font color="Red" size="+1"><form:errors path="holidays.branch"></form:errors></font>
        				       </div> 
				                  
				                  </td>
				                 
				                </tr></table>
				                
				                 <table cellpadding="0" cellspacing="0" border="0" width="100%" >
						 <tr class="row1"><td width="25%"></td>
				                <td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Number of Days </td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	
				                  	<label><input type="radio" name="group1" id="one" class="radio1" onclick="onecheck()" value="one"  <c:if test="${holidays.group1=='one'}"><c:out value="checked=checked"/></c:if>>Only One Day</label>
<label><input type="radio" name="group1" class="radio2" id="more" value="more" onclick="morecheck()"  <c:if test="${holidays.group1=='more'}"><c:out value="checked=checked"/></c:if>> More than One Day</label>



				                  	<br/><font color="Red" size="+1"><form:errors path="holidays.group1"></form:errors></font></td>
				                </tr></table>
				                <div id="oneday" style="display: none"><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                <tr class="row2"><td width="25%"></td>
				                
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Holiday Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<div class='input-group date' id='endDate' style="float:left;">
				                  	<input type="text" id="hdate" value="${holidays.holiday_date}"  name="holiday_date"/>
				                  	<span class="add-on" style="margin-top:-15px;">
									<img src="resources/images/date.png" width="24" height="35"/>
        							</span>
        							</div>
				                  	<br/><span id="requires" style="color: red;"></span>
				                  	</td>
				                    
				                     </tr></table></div>
				                     <div id="moreday" style="display: none"><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> From Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<div class='input-group date' id='endDate1' style="float:left;">
				                  	<input type="text" name="fromdate" id="fdate" value="${holidays.fromdate}"/>
				                  	<span class="add-on" style="margin-top:-15px;">
												<img src="resources/images/date.png" width="24" height="35"/>
        										</span>
				                  	</div>
				                  	<br/><span id="brequires" style="color: red;"></span>
				                  	</td>
				                    
				                     </tr></table><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                     <tr class="row1"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> To Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<div class='input-group date' id='endDate2' style="float:left;">
				                  	<input type="text" name="todate" id="tdate" value="${holidays.todate}"/>
				                  	<span class="add-on" style="margin-top:-15px;">
									<img src="resources/images/date.png" width="24" height="35"/>
        							</span>
				                  	</div>			                  	
				                  	<br/><span id="brequires1" style="color: red;"></span></td>
				                   
				                     </tr></table></div>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
				               <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Description</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  <textarea name="holiday_reason" class="textareanew">${holidays.holiday_reason}</textarea>		                  	<br/><font color="Red" size="+1"><form:errors path="holidays.holiday_reason"></form:errors></font></td>
				                    
				                     </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr class="row1" ><td width="25%"></td>
				              <td valign="top" align="left"></td>
                 <td width="1%"></td>
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Save"></td>
                  
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
</form>
</div></div>

<!-- <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->

<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
	$("#datepicker1").datepicker({ minDate: 0});
	$("#datepicker2").datepicker({ minDate: 0});
});
</script>
<script>
$('[type="radio"]').click(function () {
    $('.content').hide();
    $('.' + $(this).data("divclass")).show();
});
</script>
<script type="text/javascript">
function toggle3(value){
	 alert(value); 
	var e = document.getElementById('oneday');
	var e1=document.getElementById('moreday');
if(value=='show3')
	{
 e.style.display="block";
 e1.style.display="none";
	}
else
	{
 e.style.display="none";
 e1.style.display="block";
	}
}

</script>
<script>
function onecheck()
{
	alert("hi");
	document.getElementById("oneday").style.display="block";
	document.getElementById("moreday").style.display="none";
	alert("hello");
	}
	
function morecheck()
{
	alert("hiii");
	document.getElementById("oneday").style.display="none";
	document.getElementById("moreday").style.display="block";
	alert("hellooooooo");
	}
	
$(window).load(function(){

	alert("checking");
	if(document.getElementById("one").checked==true){
		alert("nbnbn");
		document.getElementById("oneday").style.display="block";
		document.getElementById("moreday").style.display="none";
		
		if(document.getElementById("hdate").value==""){
			document.getElementById("requires").innerHTML="Required Field Should not be Empty";
        }
		
	}
	
	else if(document.getElementById("more").checked==true)
		{
		alert("else");
		document.getElementById("oneday").style.display="none";
		document.getElementById("moreday").style.display="block";
		
		if(document.getElementById("fdate").value=="" && document.getElementById("tdate").value=="")
			{
			document.getElementById("brequires").innerHTML="Required Field Should not be Empty";
			document.getElementById("brequires1").innerHTML="Required Field Should not be Empty";
			}
		else if(document.getElementById("fdate").value==""){
			document.getElementById("brequires").innerHTML="Required Field Should not be Empty";
		}
		else if(document.getElementById("tdate").value==""){
			document.getElementById("brequires1").innerHTML="Required Field Should not be Empty";
		}
		
		}

});

</script>
<jsp:include page="footer.jsp"></jsp:include>