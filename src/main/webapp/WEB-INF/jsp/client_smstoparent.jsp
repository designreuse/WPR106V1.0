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
        $("#route_id").select2();
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



<form action="sms_to_parent" method="POST">
<table class="margin_table">

<%-- <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewdriver">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  --%>
      <tr>
      
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>SMS To Parents</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" >
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Trip </td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="50%">
				                  	<select  style="width:220px;" name="trip" id="trip"  onchange="doAjaxPost1()">
				                  	<option value="">--Select Trip--</option>
				                  	<option value="0" <c:if test="${smsparent.trip=='0'}"><c:out value="selected"/></c:if>>Pick up</option>
				                  	<option value="1" <c:if test="${smsparent.trip=='1'}"><c:out value="selected"/></c:if>>Drop</option>
				                  	<option value="2" <c:if test="${smsparent.trip=='2'}"><c:out value="selected"/></c:if>>KG Drop</option>
				                  	
				                  	</select>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="smsparent.trip"></form:errors></font></td> 
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
						  <tr class="row2">
						  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Route </td><td width="1%">:</td>
				                  <td valign="middle" align="left" class="input_txt" width="50%">
				                <!--  <span id="info1">	<select  style="width:220px;" name="route" id="route_id" >
							    <option value="" >-- Select Route--</option>
			                 </select></span>  -->
			                  <span id="info1">  
				                  <c:choose>
							  	  <c:when test="${fn:length(route_array) gt 0}">
				                 	<select style="width:220px;margin-top:-4px;" name="route" id="route_id">
				                 	<option selected value="">--Select Route--</option>
							  		<c:forEach items="${route_array}" var="routes" >
							  		<option value="${routes}" <c:if test="${routes==route}"><c:out value="Selected"/></c:if>>${routes}</option>
							  		</c:forEach>
								    </select>
								 </c:when>
								 <c:otherwise>
									 <select style="width:220px;margin-top:-4px;" name="route" id="route_id"  >
							  		<option selected value="">-- Select Route--</option>
								    </select>
								 </c:otherwise>
								</c:choose>	
								</span>
			                 
				                  	<br/><font color="Red" size="+1"><form:errors path="smsparent.route"></form:errors></font>
				                  </td>
				               
				                </tr>
				                
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="50%">
				                  	<textarea name="message" class="textareanew" >${smsparent.message}</textarea>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="smsparent.message"></form:errors></font></td>
				                    
				                     </tr>
				                     
				               
				                
                <tr class="row1" >
				  
                  <td colspan="3" valign="middle" align="center" class="input_txt" width="30%"><input type="submit" class="btn" value="Send Message">&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel">
                  </td>
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
