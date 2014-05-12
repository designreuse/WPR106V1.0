<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Client Home</h2><div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>
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
						<div style="display:none" id="div"><div class="searchpanel">
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
							  <input type="submit" class="pressableButton blue" value="Search" ></td>
							 
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
          						<td valign="top" align="right" width="100%"><div class="report_table">
<ul id="tabs">
    <li><a href="#" name="tab1">Vehicle List</a></li>
    <li><a href="#" name="tab2">Report</a></li>
    <li><a href="#" name="tab3">Settings</a></li>
    <!-- <li><a href="#" name="tab4">Four</a></li>   -->  
</ul>

<div id="content"> 
    <div id="tab1">...</div>
    <div id="tab2">
    <table width="100%"cellpadding="0" cellspacing="0" border="0" class="">
    <tr><td align="center">
    <table  width="80%"cellpadding="0" cellspacing="0" border="0" class="">
    <tr><tr><td >From Date</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td>
    <td >From Time</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td></tr>
    
    <tr><td >To Date</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td>
    <td >To Time</td><td ><input type="text" class="input_txtbx_height1" id="inp_id" name="from_date" /></td></tr>
     <!-- <tr><td ><input type="button" class="submit_btn" value="Show"/></td><td ></td><td ></td></tr> -->
    </table></td></tr>
    <tr><td align="center"><br/>
    <table width="50%"cellpadding="2" cellspacing="0" border="0" class="">
    <tr><td><input type="button" class="submit_btn" value="Show"/></td><td><input type="button" class="submit_btn" value="Download"/></td>
    <td><input type="button" class="submit_btn" value="Print"/></td><td><input type="button" class="submit_btn" value="Email"/></td></tr>
    
    </table>
    </td></tr>
    <tr><td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="">
    <tr ><td align="left" width="30%"><div class="report_table_inner">
    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#ccc" >
    <tr><th class="report_side_table">Vehicle No</th><th class="report_side_table">Over Speed Count</th></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123689</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123654</td></tr>
    <tr><td align="center">Test no</td><td align="center">123689</td></tr>
    
    </table></div>
    </td>
    <td align="right" width="70%">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="report_table_inner_1">
    <tr><th class="report_side_table">Over Speeding Report</th></tr>
    <tr><td width="100%"> <img src="resources/images/Chart.jpg" width="100%" height="84%"/></td></tr>
    
    </table>
    </td></tr>
    
    </table>
    </td></tr>
    
    </table>
    
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
</script>