<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<script type='text/javascript' src='http://code.jquery.com/jquery-1.10.1.js'></script> 
   <script type='text/javascript' src="resources/js/bootstrap-datetimepicker.min.js"></script>
  <script type='text/javascript' src="resources/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
 
<!-- DropDown Scripts -->
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
        $("#route_id").select2();
    });
</script>


<!-- Date Picker -->

	<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.4.3.min.js'></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.ui.timepicker.js" />"></script>
	<link href="<c:url value="/resources/css/timepicker_css.css" />"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	 $(document).ready(function() {
		 $('#timepicker').timepicker();
     });
	
	</script> 
	
 <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
  

  
  <script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   
      <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-lightness/jquery-ui.css">
    
  

    
      <script type='text/javascript' src="https://rawgithub.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
    
	
	<script type="text/javascript">
function doAjaxPost() {  
	var orgname = $('#orgid').val();
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/route_reg_ajax",  
		    data: "org_name=" + orgname,
		    success: function(response){  
			$('#info').html(response);
  },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
		
		<script type="text/javascript">
		function doRemovestop(value) {  
			
		var stoplist=document.getElementById("stop_list").innerHTML;
		alert(stoplist.count("Remove"));
		if(stoplist.count("Remove")==1) {
        alert("Should have atleast one stop");
		return false;
		} 
	
			
			
			/* alert(orgname); */
			 $.ajax({  
				    type: "POST",  
				    url: "/BusTrackingApp/edit_remove_populate_stops",  
				    data: "id="+value,
				    
				    success: function(response){  
				
		            $('#stop_list').html(response);
		          
		            $('#stop_info').html(response);

		   },  
				    error: function(e){  
				      alert('Error: ' + e);  
				    }  
				  });  
				}  
		function doUpdateStops() {  
			
			var stop_address = $('#stop_address_info').val();
			var stop_pick=$('#stop_pick_info').val();
			var stop_time=$('#timepicker').val();
			var editID=$('#editid').val();
			var stop_address = $('#stop_address_info').val();

			var stop_pick=$('#stop_pick_info').val();
			var stop_time=$('#timepicker').val();
			if(stop_address=='' || stop_pick=='' || stop_time=='' || stop_address=='Stop Location')
				{
				alert("Check all the fields");
				return false;
				}
			$.ajax({  
				    type: "POST",  
				    url: "/BusTrackingApp/update_stop",  
				    data: "stop_address_info="+stop_address+"&stop_pick_info="+stop_pick+"&stop_time_info="+stop_time+"&id="+editID,
				    
				    success: function(response){  
				
		            $('#stop_list').html(response);
		            $('#stop_info').html("");
		           
		   },  
				    error: function(e){  
				      alert('Error: ' + e);  
				    }  
				  });  
				}  
		</script>
		
		<script type="text/javascript">
		function validation()
		{
			var stoplist=document.getElementById("stop_list").innerHTML;
		var count = stoplist.match(/Remove/g);
		if(count.length>2) {
        alert("Should have atleast one stop");
		return false;
		} 
		}
$(window).load(
function doCollectStops() {
	var orgname = $('#org_name').val();
	var branch = $('#branch').val();
	var route_no= $('#route_no').val();
	
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/edit_populate_stops",  
		    data: "org_name=" + orgname +"&branch="+branch+"&route_no="+route_no,
		    success: function(response){  
			$('#stop_list').html(response);
  },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		);
		</script>
		
		<script type="text/javascript">
		function doRemovestop(value) {
		var stoplist=document.getElementById("stop_list").innerHTML;
		var count = stoplist.match(/Remove/g);
		if(count.length==2) {
        alert("Should have atleast one stop");
		return false;
		} 
		
		/* alert(orgname); */
		 $.ajax({  
			    type: "POST",  
			    url: "/BusTrackingApp/edit_remove_populate_stops",  
			    data: "id="+value,
			    
			    success: function(response){  
			
	            $('#stop_list').html(response);

	   },  
			    error: function(e){  
			      alert('Error: ' + e);  
			    }  
			  });  
			}  
		
		function doEditstop(value) {  
			 $.ajax({  
				    type: "POST",  
				    url: "/BusTrackingApp/edit_change_populate_stops",  
				    data: "id="+value,
				    
				    success: function(response){  
				
		            $('#stop_info').html(response);
		            $('#timepicker').timepicker();
		        	var autocomplete_stop = new google.maps.places.Autocomplete(document.getElementById("stop_address_info"));
		        	

		   },  
				    error: function(e){  
				      alert('Error: ' + e);  
				    }  
				  });  
		} 
		</script>
		
		
<style>
#map-canvas {
	height: 100%;
	width: 90%;
	margin: 0px auto;
	padding: 40px;
	align:center;
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}

* {
	font-family: Arial;
}

h2 {
	padding: 0 0 5px 5px;
}

h2 a {
	color: #224f99;
}

a {
	color: #999;
	text-decoration: none;
}

a:hover {
	color: #802727;
}

p {
	padding: 0 0 5px 0;
}

</style>

<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
    <form action="update_route_stop" method="POST" >
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 >Edit Route Information</h2>
	       </div></div> 
	       <div class="contentbox">
	      
	        <c:set value="${routeForm.route_views[0]}" var="route"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                 <tr class="row1"><td width="20%"></td>
								<td valign="middle" align="left" class="input_txt" width="15%"><span
									class="err">*</span> Organization Name :</td>
								<td valign="top" align="left" class="input_txt" width="70%">

								<input type="hidden" name="org_name" id="org_name" class="org_input_cmbbx" value="${route.org_name}"/>${route.org_name}
								</td>
							</tr>
							<tr class="row2"><td width="20%"></td>
								<td valign="middle" align="left" class="input_txt" width="10%"><span
									class="err">*</span> Branch :</td>
								<td valign="top" align="left" class="input_txt" width="10%"">
					  			<input type="hidden" name="branch" id="branch" class="org_input_cmbbx" value="${route.branch}"/>${route.branch}
								<br />
								</td>
							</tr>
							<tr class="row1"><td width="20%"></td>
								<td valign="middle" align="left" class="input_txt" width="10%"><span
									class="err">*</span> Route No :</td>
								<td valign="top" align="left" class="input_txt" width="10%"" >
								<input type="hidden" name="route_no" id="route_no" class="org_input_cmbbx" value="${route.route_no}"/>${route.route_no}
								
								
								</td>
							</tr>
						<tr class='row2' style='margin-top:20px;'><td width="20%"></td>
						<td valign="middle" align="left" class="input_txt" width="10%"><span
									class="err"></span><!-- <a href="#" id="addScnt" style="padding:3px;border:2px inset #9fb7cd;border-radius:5px;text-decoration:none;"> Add Bus Stops :</a> --><input type="hidden" id="number_of_stops" name="number_of_stops" onload=""></td>
								<%-- <c:forEach items="${routeForm.route_views}" var="route"> --%>
							
						<td align='left'>
		                 <span id="stop_info"></span>						 
								</td></tr>
						
							<tr class="row2"><td width="20%"></td>
							<td valign="middle" align="right" class="input_txt" width="10%"><span
									class="err">*</span><!-- <a href="#" id="addScnt" style="padding:3px;border:2px inset #9fb7cd;border-radius:5px;text-decoration:none;"> Add Bus Stops :</a> -->Stops<input type="hidden" id="number_of_stops" name="number_of_stops" onload=""></td>
								<%-- <c:forEach items="${routeForm.route_views}" var="route"> --%>
								<td valign="middle" align="left" class="input_txt" id="p_scents" >
								<!-- <div id="p_scents" style="height:auto;overflow:auto;"></div> -->
								 <span id="stop_list"></span>							 
								
								</td> 
								</tr>
								
							
							<tr class="roww"><td width="20%"></td>
                <td valign="top" align="right"></td>
				             
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="btn" value="Save Changes"  onclick="return validation()"></td>
               
                  <td valign="top" align="left"><input type="button" class="btn" onclick="window.location.href='viewroute'"value="Cancel"></td></tr></table>
                  </td>
                 </table></div>
                 </td>
                 
                 </tr>
							
				                  </table></form>
				          </div>
				          </div>
				         	
				          
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript">

function initialize() {
	
	//This example adds a search box to a map, using the Google Place Autocomplete
	//feature. People can enter geographical searches. The search box will return a
	//pick list containing a mix of places and predicted search terms.

	
	
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
							

<jsp:include page="footer.jsp"></jsp:include>