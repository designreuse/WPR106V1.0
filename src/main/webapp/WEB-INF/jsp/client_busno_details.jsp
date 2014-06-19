<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
 --><script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
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
 
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <table class="margin_table">			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Vehicle Information</h2><div class="searchdiv_client">
                        <a href="#" class="btn1" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='clientvechicledetails' class="btn1" >Go Back</a>
						<br/></div>
			          
			          
			        </div>
			    


<div style="display:none" id="div"><div class="searchpanel">
						<form action="searchvechicleinformation" method="GET">
							 
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							   <td align="left" valign="middle" width="20%">&nbsp;Vehicle No:<br/>
							    <select   id="e1"style="width:250px;" name="vechicle_reg_no">
							 	<option value="">Select None</option>     
							    <c:forEach items="${clientHomeForm1.clienthome}" var="clientvechicle" varStatus="status">
							    <option value="${clientvechicle.vechicle_reg_no}">${clientvechicle.vechicle_reg_no}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;From Date:<br/>
							    <span class='input-group date' id='endDate' >
												<input type="text" id="timepicker2"	name="from_date"  style="height:24px;width:150px;float:left;"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="25"/>
        										</span>
					</span></td>
							    
							      <td align="left" valign="middle" width="10%">&nbsp;&nbsp;To Date:<br/>
							      <span class='input-group date' id='endDate1' >
												<input type="text" id="timepicker2"	name="to_date"  style="height:24px;width:150px;float:left;"/>
												<span class="add-on" style="margin-top:0px;float:left">
												<img src="resources/images/date.png" width="25" height="25"/>
        										</span>
					</span></td>
							   <td align="center" valign="middle" width="10%">
							  <input type="submit" class="btn" value="Search" ></td>
							 
							  </tr>
							</table>
							</form>
						</div></div>
						
							<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img src="resources/images/filter.png" width="25" height="27"title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<!-- <input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"> -->					
					         	
					         	<!-- <td valign="top" align="left" width="5%">Date</td>
          						<td valign="top" align="left" width="10%">Start Time</td>
          						<td valign="top" align="left" width="10%">End Time</td>
          						<td valign="top" align="left" width="5%">Duration</td>
          						<td valign="top" align="left" width="40%">Location</td>
          						<td valign="top" align="left" width="25%">Trip</td> -->
          						<td valign="top" align="left" width="8%">Date</td>
          						<td valign="top" align="left" width="14%">Vehicle Reg No</td>
          						<td valign="top" align="left" width="10%">Route No</td>
          						<td valign="top" align="left" width="8%">Stop Id</td>
          						<td valign="top" align="left" width="34%">Location</td>
          						<td valign="top" align="left" width="8%">Trip</td>
          						<td valign="top" align="left" width="5%">Reached</td>
          						<td valign="top" align="left" width="15%">Message Send</td> 
          						 
          						
        					</tr>  </table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%"class="order-table table">
							 <c:forEach items="${clientHomeForm.clienthome}" var="clientvechicleinformation" varStatus="status">
        							<tr class="row1">
							       		
					     		     	 
											<td valign="top" align="left" width="8%">${clientvechicleinformation.last_message_send_pick}</td>
											<td valign="top" align="left" width="13%">${clientvechicleinformation.vechicle_reg_no}</td>
										   <td valign="top" align="left" width="10%">${clientvechicleinformation.route_no}</td>
          						           <td valign="top" align="left" width="8%">${clientvechicleinformation.stop_id}</td>
          						           <td valign="top" align="left" width="33%">${clientvechicleinformation.address}</td>
          						           <td valign="top" align="left" width="8%">
          						           <c:choose>
          						           <c:when test="${clientvechicleinformation.trip==0}">
          						           <c:out value="Pickup"></c:out>
          						           </c:when>
          						           <c:when test="${clientvechicleinformation.trip==1}">
          						           <c:out value="Drop"></c:out>
          						           </c:when>
          						           <c:when test="${clientvechicleinformation.trip==2}">
          						           <c:out value="KG Drop"></c:out>
          						           </c:when>
          						           </c:choose>
          						           </td>
          						           <td valign="top" align="left" width="8%">
          						           <c:choose>
          						           <c:when test="${clientvechicleinformation.reached==0}">
          						           <c:out value="No"></c:out>
          						           </c:when>
          						           <c:when test="${clientvechicleinformation.reached==1}">
          						           <c:out value="Yes"></c:out>
          						           </c:when>
          						           </c:choose>
          						           </td>
          						           <td valign="top" align="left" width="15%">${clientvechicleinformation.is_pick_message_send}</td> 
											
								</tr>
							    	</c:forEach>
    
        				</table>
        				
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
        					</tr>  </table>
        				
        				</td>
        				</tr>
        				</table></div></div>        	




<jsp:include page="footer.jsp"></jsp:include>
