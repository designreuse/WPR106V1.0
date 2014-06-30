<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<style type="text/css">
        /* body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #report { border-collapse:collapse;}
        #report h4 { margin:0px; padding:0px;}
        #report img { float:right;}
        
        #report th { background:#3bb9ff url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:0px 2px; text-align:left;}
        #report td { background:#eee none repeat-x scroll center left; color:#fff; padding:0px 2px; }
         */#report tr.odd td { background:#fff ;color:#666; cursor:pointer; }
        #report div.arrow { background:transparent url(resources/images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;float:right;}
        #report div.up { background-position:0px 0px;}
        #report ul { margin:10px 0 10px 40px; padding:0px;}
    </style>
    
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.click_row)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.click_row").dblclick(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script> 
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
      		
		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Route Information</h2>
			          <div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>
                        &nbsp;&nbsp;<a  href='viewroute' class="btn" >Back to View</a>
						</div>
			        </div>						
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
    	
<tr>

<td>
<div style="display:none" id="div"><div class="searchpanel">
<form action="findroute" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp; Organization Name &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e1"style="width:300px;" name="org_name">
							 	<option selected>--Select Organization--</option>     
							   <c:forEach items="${routeViewForm1.route_views}" var="route1" varStatus="status">
							    <option value="${route1.org_name}" <c:if test="${route1.org_name==org_name}"><c:out value="selected"></c:out> </c:if>   >${route1.org_name}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp; Branch &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e2"style="width:300px;" name="branch">
							 	<option selected>--Select Branch--</option>     
							   <c:forEach items="${routeViewForm1.route_views}" var="route1" varStatus="status">
							    <option value="${route1.branch}" <c:if test="${route1.branch==branch}"><c:out value="selected"></c:out> </c:if> >${route1.branch}</option>
							    </c:forEach>
							    </select></td>
							    
							  <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp;Bus Registration No &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select id="e3"style="width:300px;" name="vechicle_reg_no">
							 	<option selected>--Select Bus Reg No--</option>     
							   <c:forEach items="${routeViewForm1.route_views}" var="route1" varStatus="status">
							    <option value="${route1.bus_reg_no}" <c:if test="${route1.bus_reg_no==vechicle_reg_no}"><c:out value="selected"></c:out> </c:if> >${route1.bus_reg_no}</option>
							    </c:forEach>
							    </select></td>
							  
							  
							  </tr><tr><td><font color="#ccc">.</font></td></tr>
							  <tr>
							  <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp; Route No &nbsp;<br/><font color="#ccc">.</font></span><br/>
							    <select   id="e4" style="width:300px;" name="route_no">
							 	<option selected>--Select Route No--</option>     
							   <c:forEach items="${routeViewForm1.route_views}" var="route1" varStatus="status">
							  <option value="${route1.route_no}" <c:if test="${route1.route_no==route_no}"><c:out value="selected"></c:out> </c:if>  >${route1.route_no}</option>
							  </c:forEach>
							    </select></td>
							    
							    <td align="left" valign="middle" width="10%" class="input_txtlabel"><span style="line-height:8px;">&nbsp; Trip &nbsp;<br/><font color="#ccc">.</font></span><br/>
							  
							 <%--  <c:choose>
							  <c:when test="${trip==0}">
							  <select   id="e5"style="width:300px;" name="trip">
							 	<option selected>--Select Trip--</option>    
							 	  <option value="0" selected="selected">Pickup</option>
							 	  <option value="1">Drop</option>
							 	  <option value="2">KG Drop</option> 
							 </select>
							  </c:when>
							  <c:when test="${trip==1}">
							 <select id="e5"style="width:300px;" name="trip">
							 	<option selected>--Select Trip--</option>    
							 	  <option value="0" >Pickup</option>
							 	  <option value="1" selected="selected">Drop</option>
							 	  <option value="2">KG Drop</option> 
							 </select>
							  </c:when>
							  <c:when test="${trip==2}">
							  <select id="e5"style="width:300px;" name="trip">
							 	<option selected>--Select Trip--</option>    
							 	  <option value="0" >Pickup</option>
							 	  <option value="1">Drop</option>
							 	  <option value="2" selected="selected">KG Drop</option> 
							 </select>
							  </c:when>
							  <c:otherwise> --%>
							  <select id="e5"style="width:300px;" name="trip">
							 	<option selected >--Select Trip--</option>    
							 	  <option value="0" <c:if test="${route.trip=='0'}"><c:out value="selected"/></c:if>>Pickup</option>
							 	  <option value="1" <c:if test="${route.trip=='1'}"><c:out value="selected"/></c:if>>Drop</option>
							 	  <option value="2" <c:if test="${route.trip=='2'}"><c:out value="selected"/></c:if>>KG Drop</option> 
							 </select>
							  <%-- </c:otherwise>
							  </c:choose> --%>
							  
							   </td>
							    
							    
							    
							    <td align="right" valign="middle" width="20%"><br>
							    <input type="submit" class="btn" value="Search" ></td>
							    <td width="10%"><font color="#ccc" >.</font></td>
							 
							  </tr>
							</table>
							</form>
							</div></div>
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
							<tr class="title">
									<!-- 	<td valign="top" align="left" width="18%"> Bus Id</td> -->
					         	<td valign="top" align="left" width="20%"> 	Organization Name</td>
					         	<td valign="top" align="left" width="14%">Branch</td>
					       	 	<td valign="top" align="left" width="10%"> Bus Reg No</td>
					       	 	<td valign="top" align="left" width="10%"> RouteNo</td>
          						<td valign="top" align="left" width="7%"> Trip</td>
          						<td valign="top" align="left" width="9%"> No. of Stops</td>
          						<td valign="top" align="left" width="10%"> Action</td>
          						
          						
        					</tr></table>
							
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" id="report" style="width:1050px;table-layout: fixed;" class="order-table table">
							<!-- <tr><td colspan="7"style="overflow:hidden;width:1050px"></td></tr> -->
        					<c:if test="${fn:length(routeViewForm.route_views) gt 0 }">
        					<c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        					
        				       				 <tr class="click_row"> 
        				            		<td valign="middle" align="left"style="overflow:hidden; width:210px">${route.org_name}</td>
					     		     		<td valign="top" align="left" style="overflow:hidden;width:150px">${route.branch}</td> 
											<td valign="top" align="left" style="overflow:hidden;width:110px">${route.bus_reg_no}</td>
											<td valign="top" align="left" style="overflow:hidden;width:90px">${route.route_no}</td>
											<td valign="top" align="left" style="overflow:hidden;width:70px"><span style="line-space:20px;"><c:choose>
											<c:when test="${route.trip==0}">&nbsp;	<c:out value="Pick Up" ></c:out></c:when>
											<c:when test="${route.trip==1}">&nbsp;<c:out value="Drop" ></c:out></c:when><c:otherwise>
											&nbsp;<c:out value="KG Drop"></c:out>
											</c:otherwise>
											</c:choose></span>
											</td>
											<td valign="top" align="left"style="overflow:hidden; width:90px" title="${route.no_of_stops}">${route.no_of_stops}</td>
											
											<td valign="top" align="left" style="overflow:hidden;width:90px">	
											<a href="<c:out value="showfulldetails?route_no=${route.route_no}&org_name=${route.org_name}&branch=${route.branch}"/>">Stops</a>&nbsp;|&nbsp;&nbsp;
										    <a href="<c:out value="editroute?route_no=${route.route_no}&org_name=${route.org_name}&branch=${route.branch}&vechicle_reg_no=${route.bus_reg_no}"/>"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>|
											<a href="<c:out value="deleteroute?route_no=${route.route_no}&org_name=${route.org_name}&branch=${route.branch}&vechicle_reg_no=${route.bus_reg_no}"/>" onclick="return confirmation()"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
											</td>
								</tr>
								
							    	</c:forEach>
							    </c:if>
							    
							     <c:if test="${fn:length(routeViewForm.route_views) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" ><center><b>No Routes Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%"> &#9660;</td>
          						
          						
        					</tr></table>
        				</td>
        				</tr>
        				</table>
        			
					       				
     </div></div>				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Route ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>

<script language="javascript">

function selectall(field)
{

	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}
</script>
  		 
<jsp:include page="footer.jsp"></jsp:include>

        <script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript">
//This example adds a search box to a map, using the Google Place Autocomplete
//feature. People can enter geographical searches. The search box will return a
//pick list containing a mix of places and predicted search terms.
$(function() {
	
        var scntDiv = $('#p_scents');
        var i = $('#p_scents p').size();
        var j=0;
        $('#addScnt').live('load', function() {
        	//alert(i);
        	$('<p style="border:solid 1px grey;padding:5px;margin-top:5px;width:400px;background-color:#E5E5E5;"><label for="p_scnts"><input type="text"  size="20" class="input_txtbx_height" id="stop_info_'+i+'" name="stop['+i+']" value="" placeholder="Stop Location" /></label><br/><br/><input type="radio"  name="stop_pick['+i+']" id="stop_pick_'+i+'" value="0" checked>Pick up<input type="radio"  name="stop_pick['+i+']" value="1" id="stop_drop_'+i+'">Drop<input type="radio"  name="stop_pick['+i+']" value="2" id="stop_both_'+i+'">KG Drop<br/><br/><input type="text" name="particular_stop_pickup_time['+i+']" id="datepicker" placeholder="Bus Arrival time" class="input_txtbx_height" style="width=100px; value=""/><br/><br/>&nbsp;&nbsp;&nbsp;<a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);
        	document.getElementById("number_of_stops").value=i;
        	var autocomplete_stop = new google.maps.places.Autocomplete(document.getElementById("stop_info_"+i));
            i++;
            return false;
    });
    
    $('#remScnt').live('click', function() { 
               $(this).parents('p').remove();
                    i--;
           
		});
});

function initialize() {

	var autocomplete_stop_address = new  google.maps.places.Autocomplete(document.getElementById('stop_address'));
	var autocomplete_route_stop = new google.maps.places.Autocomplete(document.getElementById('route_stop'));
	
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>

<script type="text/javascript">

$( "#dialog" ).dialog({ autoOpen: false });
$( "#join_form" ).click(function() {
  $( "#dialog" ).dialog( "open" );
});
</script>

							