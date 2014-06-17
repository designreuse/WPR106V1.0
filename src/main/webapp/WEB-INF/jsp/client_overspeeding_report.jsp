<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script> -->
 <script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
  <script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
jQuery(function () {
    jQuery('#startDate').datetimepicker({ format: 'hh:mm' ,pickDate: false });
    jQuery('#endDate1').datetimepicker({ format: 'dd/MM/yyyy' ,pickTime: false});
    
    jQuery('#startDate1').datetimepicker({ format: 'hh:mm' ,pickDate: false });
	/* jQuery('#startDate1').datetimepicker({ format: 'dd/MM/yyyy',dateonly:true }); */
	jQuery('#endDate').datetimepicker({ format: 'dd/MM/yyyy' ,pickTime: false});

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

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Over Speeding Report Page</h2><!-- <div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div> -->
			        </div>
			        
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewdriver">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
    <tr>
    <td>
						<div style="display:none;height:700px;" id="div"><div class="searchpanel">
<form action="findadminhome" method="GET">
 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="30%">Vehicle Number:<br/>
							    <select   id="e1"style="width:250px;" name="org_name">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm.clienthome}" var="clienthome2" varStatus="status">
							    <option value="${clienthome2.vechicle_reg_no}">${clienthome2.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="70%">
							  <!-- <input type="submit" class="searchpressable" value="Search" ></td>
							  --><a href="submit();" class="searchpressable" >
                        Search
                        </a>
							  </tr>
							</table>
							</form>
						</div>
					</div>
						</td>
						</tr>
					</table>
					
							        					<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img src="resources/images/filter.png" width="25" height="27"title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>
					
        				
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr >
          						<td valign="top" align="right" width="100%"><div class="report_table" style="height:700px;">
<ul id="tabs">
    <li><a href="#" name="tab1">Vehicle List</a></li>
    <li><a href="#" name="tab2">Report</a></li>
    <li><a href="#" name="tab3">Settings</a></li>
    <!-- <li><a href="#" name="tab4">Four</a></li>   -->  
</ul>

<div id="content" style="height:800px;"> 

    <div id="tab1">...</div>
    <div id="tab2">
   <form method="get" action="overspeedreportsearch">
    <table width="100%"cellpadding="0" cellspacing="0" border="0" class="">
    
    <tr><td>
    <table width="80%"cellpadding="2" cellspacing="0" border="0" >
    <tr><%-- <td> Organization Name<br/>
							    <select  id="e4" style="width:250px;" name="">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm.clienthome}" var="clienthome2" varStatus="status">
							    <option value="${clienthome2.vechicle_reg_no}">${clienthome2.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td>Branch<br/><select  id="e2" style="width:250px;" name="">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm.clienthome}" var="clienthome2" varStatus="status">
							    <option value="${clienthome2.vechicle_reg_no}">${clienthome2.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td> --%>
    <td>Vehicle Number<br/><select id="e3" style="width:250px;" name="">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm.clienthome}" var="clienthome2" varStatus="status">
							    <option value="${clienthome2.vechicle_reg_no}">${clienthome2.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td><td></td></tr></table><br>
							     <table width="80%"cellpadding="2" cellspacing="0" border="0" ><tr>
    <td>Date From<br/><div class='input-group date' id='endDate' >
												<input type="text" id="timepicker2"	name="pickup_start_time"  style="height:24px;width:150px;float:left;"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="25"/>
        										</span>
					</div></td>
    <td>Time From<br/><div class='input-group date' id='startDate' >
												<input type="text" id="timepicker2"	name="pickup_start_time"  style="height:24px;width:150px;float:left;"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/clock.png" width="25" height="25"/>
        										</span>
					</div>	</td>
	<td>Date To<br/><div class='input-group date' id='endDate1' >
												<input type="text" id="timepicker2"	name="pickup_start_time" style="height:24px; width:150px;float:left;" />
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="45"/>
        										</span>
					</div></td>
	<td>Time To<br/><div class='input-group date' id='startDate1' >
												<input type="text" id="timepicker2"	name="pickup_start_time" style="height:24px;width:150px;float:left;" />
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/clock.png" width="25" height="25"/>
        										</span>
					</div>	</td>
					<td align="right"><input type="button" class="btn" value="Search"></td>
					</tr>
					
    </table><br/></td>
    </tr>
    <!-- <tr><td align="center">
    <table width="40%"cellpadding="2" cellspacing="0" border="0" style="margin:0 0 0 61%;">
    <tr><td><input type="button" class="btn" value="Search"></td>
    <td><input type="button" class="btn" value="Export to Excel"></td>
    <td><a href="javascript:void(processPrint());" class="searchpressable printreport" >Print</a></td>
    <td>
    <a href="" class="searchpressable mailreport" >Email</a></td>
    </tr>
    
    </table>
    </td></tr> -->
    </table>
    </form>
    <form method="get" action="overspeedreport">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
    <tr><td><br/>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td align="left" width="30%">
    <div class="report_table_innertop" id="printMe">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
    <tr><td class="report_side_table" align="center" width="48%">Vehicle Number</td><td  align="center" class="report_side_table" width="50%">Over Speed Count</td></tr></table>
    <div class="report_table_inner">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
   <c:forEach items="${reportForm.reports}" var="clientoverspeedreport">
    <tr><td align="center" width="48%">${clientoverspeedreport.vechicle_reg_no}</td><td align="center" width="50%">${clientoverspeedreport.over_speed_count}</td></tr>
    </c:forEach>
    
    </table></div></div>
    </td>
   <!--  <td align="right" width="70%"><br/>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="report_table_inner_1">
    <tr><th class="report_side_table">Over Speeding Report</th></tr>
  <tr><td style="width:100% ; height:300px;"> <img src="resources/images/Chart.jpg" style="width:100% ; height:300px;" /></td></tr>    
    </table> 
    </td> -->
    </tr>
    <tr><td align="right"><br>
    <table width="40%"cellpadding="2" cellspacing="0" border="0" style="margin:0 0 0 61%;">
    <tr>
    <td align="right"><input type="button" class="btn" value="Export to Excel"></td>
    <!-- <td><a href="javascript:void(processPrint());" class="searchpressable printreport" >Print</a></td>
    <td>
    <a href="" class="searchpressable mailreport" >Email</a></td> -->
    </tr>
    
    </table>
    </td></tr>
    
    </table>
    </td></tr></table></form>
    </div>
    <div id="tab3">...</div>
    <!-- <div id="tab4">...</div> -->

</div></div></td>
        					</tr> </table>
        				</td>
        				</tr>
        				</table></div></div>
        				
<jsp:include page="footer.jsp"></jsp:include>

<script>
$(document).ready(function() {
    $("#content").find("[id^='tab']").hide(); // Hide all content
    $("#tabs li:first").attr("id","current"); // Activate the first tab
    $("#content #tab1").fadeIn(); // Show first tab's content
    
    $('#tabs a').click(function(e) {
        e.preventDefault();
        if ($(this).closest("li").attr("id") == "current"){ //detection for current tab
         return;       
        }
        else{             
          $("#content").find("[id^='tab']").hide(); // Hide all content
          $("#tabs li").attr("id",""); //Reset id's
          $(this).parent().attr("id","current"); // Activate this
          $('#' + $(this).attr('name')).fadeIn(); // Show content for the current tab
        }
    });
});
</script><script language="javascript">
    var gAutoPrint = true;

    function processPrint(){

    if (document.getElementById != null){
    var html = '<HTML>\n<HEAD>\n';
    if (document.getElementsByTagName != null){
    var headTags = document.getElementsByTagName("head");
    if (headTags.length > 0) html += headTags[0].innerHTML;
    }

    html += '\n</HE' + 'AD>\n<BODY>\n';
    var printReadyElem = document.getElementById("printMe");

    if (printReadyElem != null) html += printReadyElem.innerHTML;
    else{
    alert("Error, no contents.");
    return;
    }

    html += '\n</BO' + 'DY>\n</HT' + 'ML>';
    var printWin = window.open("","processPrint");
    printWin.document.open();
    printWin.document.write(html);
    printWin.document.close();

    if (gAutoPrint) printWin.print();
    } else alert("Browser not supported.");

    }
</script>