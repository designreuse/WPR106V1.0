<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  <script type="text/javascript" src="resources/js/autoddl/magicsuggest-1.3.1.js"></script>
  <link rel="stylesheet" href="resources/js/autoddl/magicsuggest-1.3.1.css">
   <script type="text/javascript">
        $(document).ready(function() {
            var jsonData = [];
            var cities=new Array();
            var i0=0;
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities[i0]='<c:out value="${classSection.org_name}"></c:out>';
                i0=i0+1;
            '</c:forEach>';
            for(var i0=0;i0<cities.length;i0++) jsonData.push({id:i0,name:cities[i0],status:i0%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            alert(i1);
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities1[i1]='<c:out value="${classSection.branch}"></c:out>';
                i1=i1+1;
            '</c:forEach>';
            for(var i1=0;i1<cities1.length;i1++) jsonData1.push({id:i1,name:cities1[i1],status:i1%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});


            var jsonData2 = [];
            var cities2=new Array();
            var i2=0;
            
			
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities2[i2]='<c:out value="${classSection.class_std}"></c:out>';
                i2=i2+1;
            '</c:forEach>';
            for(var i2=0;i2<cities2.length;i2++) jsonData2.push({id:i2,name:cities2[i2],status:i2%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData3 = [];
            var cities3=new Array();
            var i3=0;
            
			
            '<c:forEach items="${classSectionForm.classSections}" var="classSection">';
                cities3[i3]='<c:out value="${classSection.section}"></c:out>';
               
                i3=i3+1;
            '</c:forEach>';
            
            for(var i3=0;i3<cities3.length;i3++) jsonData3.push({id:i3,name:cities3[i3],status:i3%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

/* 
            var jsonData4 = [];
            var cities4=new Array();
            var i4=0;
            
			
            '<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration">';
                cities4[i4]='<c:out value="${orgRegistration.branch}"></c:out>';
                i4=i4+1;
           
                '</c:forEach>';            
            for(var i4=0;i4<cities4.length;i4++) jsonData4.push({id:i4,name:cities4[i4],status:i4%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
			
 */            
            var ms7 = $('#ms7').magicSuggest({
                data: jsonData,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
            var ms8 = $('#ms8').magicSuggest({
                data: jsonData1,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
            var ms9 = $('#ms9').magicSuggest({
                data: jsonData2,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });

            var ms10 = $('#ms10').magicSuggest({
                data: jsonData3,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
/*             var ms11 = $('#ms11').magicSuggest({
                data: jsonData4,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
			
 */
             });
    </script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
	<form method="POST" action="update_bus">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 align="center" >Editing Bus Information<br></b></h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${busRegistrationForm.busregistration[0]}" var="BusRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span>Organization Name:</td>
				                  <td valign="top" align="left" class="input_txt" >
				                  <input type="hidden" name="org_name" class="org_input_cmbbx" value="${BusRegistration.org_name}"/>${BusRegistration.org_name}
				                  	 
				                  	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>

								 <tr class="row1">
						         	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Branch :</td>
						            <td valign="top" align="left" class="input_txt">
						      		<input type="hidden" name="branch" class="org_input_cmbbx" value="${BusRegistration.branch}"/>${BusRegistration.branch}
						            	
						            	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row2">
				                	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Bus Registration No :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                 	<input type="hidden" name="vechicle_reg_no" class="org_input_cmbbx" value="${BusRegistration.vechicle_reg_no}"/>${BusRegistration.vechicle_reg_no}
				                  	
				                  	<br/><font color="Red" size="+1"></font></td>
				                </tr> 
								<tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Device IMEI No : </td>
				                  	<td valign="top" align="left" class="input_txt"><select class="org_input_cmbbx" name="device_imei_number" id="imei" onblur="Validate2('imei')">
							    <option value="${BusRegistration.device_imei_number}" selected>${BusRegistration.device_imei_number}</option>
							     <c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceregistration" varStatus="status">
        				        <option value="${deviceregistration.device_imei_number}">${deviceregistration.device_imei_number}</option>
			                  </c:forEach>
			                  </select>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver Name :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="driver_id" name="driver_name" value="${BusRegistration.driver_name}" /></br><font color="Red" size="+1"></font></td>
				                </tr>
				                <tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="licence_id" name="driver_licence_no" value="${BusRegistration.driver_licence_no}"/>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row2">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Driver License Expiry Date :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="datepicker" name="driver_licence_exp_date" value="${BusRegistration.driver_licence_exp_date}"/></br><font color="Red" size="+1"></font></td>
				                </tr> 
				                <tr class="row1">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> Route No : </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="org_input_txtbx_height1" id="imei" name="route_no" value="${BusRegistration.route_no}"/>
				                  <%-- 	<select class="org_input_cmbbx" name="route_no" id="imei" onblur="Validate2('imei')">
							    <option value="" selected>-- Select Route No--</option>
							     <c:forEach items="${routeViewForm.route_views}" var="route" varStatus="status">
        				        <option value="${route.route_no}">${route.route_no}</option>
			                  </c:forEach>
			                  </select> --%>
				                  	</br><font color="Red" size="+1"></font></td>
				                </tr>	
				          </table>
				           <table width="100%">
				                  <tr>
				                   <td width="50%" align="right"><input type="submit" class="submit_btn" value="Update" ></td>
				                   <td>&nbsp;&nbsp;</td>
				                    
				                    <td><input type="reset" class="submit_btn" value="Cancel"  onclick="window.location.href='viewbus'"></td>
				                  </tr>
				                  </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </div>
				          </div>
				          				
				          <jsp:include page="footer.jsp"></jsp:include>
				          
				         <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">


<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});


</script>         