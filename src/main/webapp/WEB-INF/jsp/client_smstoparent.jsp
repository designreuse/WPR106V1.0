<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_bid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#route").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#trip").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">



<form action="insert_class_section" method="POST">
<table class="margin_table">

      <tr>
      
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>SMS To Parents</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" >
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row2"><td valign="middle" align="right" class="input_txt" width="29%" ></td>
				                  <td valign="middle" align="left" class="input_txt" width="10%"><span class="err">*</span> Trip </td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select  style="width:220px;" name="trip" id="trip" value="${class_section.class_std}" onchange="doAjaxPost1()">
				                  	<option value="none" selected>--Select Trip--</option>
				                  	<option value="0">Pick up</option>
				                  	<option value="1">Drop</option>
				                  	<option value="2">KG Drop</option>
				                  	
				                  	</select>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.class_std"></form:errors></font></td> 
				               </tr>
				                
                        		<%-- <tr class="row1"><td valign="middle" align="right" class="input_txt" width="29%" ></td>
                        		<td valign="middle" align="left" class="input_txt" width="10%"><span class="err">*</span>Shift</td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	
							<select  style="width:220px;" name="shift" id="bid"   onblur="Validate('orgid')">
							    <option value="">-- Select Shift--</option>
        				        <option value="Routes here" >Shift here</option>
			                  
			                 </select>        				       
				                  <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr>  --%>
						  <tr class="row2"><td valign="middle" align="right" class="input_txt" width="29%" ></td>
						  <td valign="middle" align="left" class="input_txt" width="10%" ><span class="err">*</span> Route </td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                 <div id="info1">	<select  style="width:220px;" name="route" id="route"  ">
							    <option value="none" selected>-- Select Route--</option>
        				        <!-- <option value="Routes here" >Routes here</option> -->
			                  
			                 </select></div> 
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               
				                </tr>
				                
				                <tr class="row1"><td valign="middle" align="right" class="input_txt" width="29%" ></td>
					            	<td valign="middle" align="left" class="input_txt" width="10%"><span class="err">*</span> Message</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<textarea name="message" class="textareanew" ></textarea>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr>
				                     
				               
				                
                <tr class="row1" ><td valign="middle" align="right" class="input_txt" width="29%" ></td>
				              <td valign="top" align="left"></td><td width="1%"></td>
                 
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Send Message"></td>
                  
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
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
function doAjaxPost1() {  
/* 	 alert("hi");  */
	var shift = $('#trip').val();
	
	 /* alert(shift);  */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/trip_ajax",  
		    data: "trip="+shift,
		    success: function(response){  
		
		    	
		    	$('#info1').html(response);


   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
		</script>
