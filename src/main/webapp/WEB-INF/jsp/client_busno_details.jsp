<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

<form name="" action="" method="POST">


	<table class="margin_table">			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Vehicle Information <span style="margin:0 0 0 70%;"><a href="javascript:history.back();" class="submit_btn12" >Go Back</a> </span> </h2>
			        </div>
			    

<div style="display:none" id="div">
						<h3>Search By</h3>
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px; ">
						<form action="findbus" method="GET">
							 
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr><td align="left" valign="middle" width="8%">
							   <td align="left" valign="middle" width="8%">&nbsp;Vehicle No:</td>
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;From Date:</td>
							    <td align="left" valign="middle" width="10%">
							     <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							      <td align="left" valign="middle" width="10%">&nbsp;&nbsp;&nbsp;To Date:</td>
							    <td align="left" valign="middle" width="10%">
							     <input type="text" name="driver_id" class="search_txtbx_height12"></td>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="submit_btn" value="View" name="find"></td>
							 
							  </tr>
							</table>
							</form>
						</div></div>
						<!-- <br/> -->
							<table >
						<tr align="right"><td width="70%"><a href="#" onclick="toggle(this,'div');return false"><img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></td><td><input type="submit" class="submit_btn" value="Show" name="find"></td>
						<td><input type="submit" class="submit_btn" value="Download" name="find"></td>
						<td><input type="submit" class="submit_btn" value="Print" name="find"></td>
					<td><input type="submit" class="submit_btn" value="Email" name="find"></td></tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<!-- <input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"> -->					
					         	<td valign="top" align="left" width="5%">Date</td>
          						<td valign="top" align="left" width="10%">Start Time</td>
          						<td valign="top" align="left" width="10%">End Time</td>
          						<td valign="top" align="left" width="5%">Duration</td>
          						<td valign="top" align="left" width="40%">Location</td>
          						<td valign="top" align="left" width="25%">Trip</td>
        					</tr>  </table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							 
        							<tr class="row1">
							       		<%-- <td align="center" width="15%"><input type="checkbox" value="${DriverRegistration.driver_id}" name="chkUser"></td>
					     		     	 --%><td valign="top" align="left"  width="10%"><a href="driver_details?driver_id=${DriverRegistration.driver_id}">${DriverRegistration.driver_id}</a></td>
											<td valign="top" align="left" width="15%">${DriverRegistration.driver_name}</td>
											<td valign="top" align="left" width="15%">${DriverRegistration.contact_no}</td>
												<td valign="top" align="left" width="15%">${DriverRegistration.license_type}</td>
											<td valign="top" align="left" width="25%">
										
										
											</td>
								</tr>
							    	
    
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
        					</tr>  </table>
        				</div>
        				
        				
        				</td>
        				</tr>
        				</table></form>	</div></div>        	
<script type="text/javascript">
function toggle(a,id){
var div=document.getElementById(id);
if(div.style.display=='none'){
div.style.display='block';
a.innerHTML='<img src="resources/images/search-red-icon.png" style="height:40px;width:70px;" title="Close Search"/>';
}
else{
div.style.display='none';
a.innerHTML='<img src="resources/images/search-blue-icon.png" style="height:40px;width:70px;" title="Open Search"/>';
}
}
</script>
	 

<script type="text/javascript" src="js/ajaxpaging.js"></script>


<jsp:include page="footer.jsp"></jsp:include>
