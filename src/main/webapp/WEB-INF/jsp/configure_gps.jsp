<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="resources/js/jquery_ui.js"></script>
<script>
function doAjaxPost() {

		var id = $('#device_id').val();		
		$.ajax(
				{
				type : "POST",
			url : "/BusTrackingApp/getdevice_sim",
			data : "id=" + id,
			success : function(response) {
				// we have the response  
			
				$('#info').html(response);
				
				/*     $('#education').val(''); */
			},
			error : function(e) {
				
				alert('Error: ' + e);
			}
		});
		}


</script>



<form method="post" action="send_configure_message">

	<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
        		<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<c:if test="${status=='true'}">
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span></span> .</p>
          			</div>
          			</c:if>
          		</td>
      		</tr>
      		<tr>
        		<td valign="top" align="left">
	        		<div>
	            		<div class="headings altheading">
	              			<h2>Configure Device</h2>
	            		</div>
	            		<div class="contentbox">
	              			<table cellpadding="0" cellspacing="0" border="0" width="100%">
	              			 <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="30%">
				                  <span class="err">*</span>Select Device :</td>
				                  <td valign="top" align="left" class="input_txt1">
				                  <select id="device_id" class="org_input_cmbbx"   style="width:170px;" onchange="doAjaxPost()">
				                  <option value="" selected>Select Device</option>
<c:forEach items="${busDeviceRegistrationForm.busDeviceRegistrations}" var="BusDeviceRegistration">
<option>${BusDeviceRegistration.device_id}</option>
</c:forEach> </select>
<br/><span class="err">
</span></td>
				                </tr>
	              			
	                		    <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Device SIM Number  :</td>
				                  <td valign="top" align="left" class="input_txt1">
				                  <div id="info">
				                  
				                  </div>
				                 <span class="err"></span></td>
				                </tr>
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Message :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<textarea name="configure_message" class="input_txtarea_height1" style="width:170px;height:50px;" id="inp_configure_message"></textarea><br/><span class="err"></span>
				                  	</td>
				                </tr>
								
	                 			<tr class="row1">
	                  				<td valign="top" align="right">&nbsp;</td>
	                  				<td valign="top" align="left"><input type="submit" value="Send to Device" class="submit_btn1"></td>
	                			</tr>
	              			</table>
	            		</div>
	          		</div>
          		</td>
      		</tr>
		</table>
	</div>
</form>

<jsp:include page="footer.jsp"></jsp:include>