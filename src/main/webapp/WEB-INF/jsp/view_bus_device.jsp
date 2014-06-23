<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<%-- 
  <script type="text/javascript" src="resources/js/autoddl/magicsuggest-1.3.1.js"></script>
  <link rel="stylesheet" href="resources/js/autoddl/magicsuggest-1.3.1.css">
  
    									 
										   <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
										 
     <script type="text/javascript">
        $(document).ready(function() {
            var jsonData = [];
            var cities=new Array();
            var i=0;
            '<c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">';
                cities[i]='<c:out value="${userorg_name.org_name}"></c:out>';
                i=i+1;
            '</c:forEach>';
            for(var i=0;i<cities.length;i++) jsonData.push({id:i,name:cities[i],status:i%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            
            '<c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">';
                cities1[i1]='<c:out value="${userorg_name.branch}"></c:out>';
                i1=i1+1;
            '</c:forEach>';
            for(var i1=0;i1<cities1.length;i1++) jsonData1.push({id:i1,name:cities1[i1],status:i1%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});


            var jsonData2 = [];
            var cities2=new Array();
            var i2=0;
            
			
            '<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" >';
                cities2[i2]='<c:out value="${deviceRegistrations.device_imei_number}"></c:out>';
                i2=i2+1;
            '</c:forEach>';
            for(var i2=0;i2<cities2.length;i2++) jsonData2.push({id:i2,name:cities2[i2],status:i2%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData3 = [];
            var cities3=new Array();
            var i3=0;
            
			
            '<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" >';
                cities3[i3]='<c:out value="${deviceRegistrations.sim_card_number}"></c:out>';
                i3=i3+1;
            '</c:forEach>';
            for(var i3=0;i3<cities3.length;i3++) jsonData3.push({id:i3,name:cities3[i3],status:i3%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData4 = [];
            var cities4=new Array();
            var i4=0;
            
			
            '<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" >';
                cities4[i4]='<c:out value="${deviceRegistrations.adminip}"></c:out>';
                i4=i4+1;
            '</c:forEach>';
            for(var i4=0;i4<cities4.length;i4++) jsonData4.push({id:i4,name:cities4[i4],status:i4%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
			
            var jsonData5 = [];
            var cities5=new Array();
            var i5=0;
            
			
            '<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" >';
                cities5[i5]='<c:out value="${deviceRegistrations.create_user_id}"></c:out>';
                i5=i5+1;
            '</c:forEach>';
            for(var i5=0;i5<cities5.length;i5++) jsonData5.push({id:i5,name:cities5[i5],status:i5%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
			
                        
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
            var ms11 = $('#ms11').magicSuggest({
                data: jsonData4,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
            var ms12 = $('#ms12').magicSuggest({
                data: jsonData5,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });

             });
    </script> --%>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Device Informations<br/></h2><div class="searchdiv">
                        <a href="#" class="btn" onclick="toggle(this,'div');return false">
                          Open Search
                        </a>&nbsp;&nbsp;<a  href='view_devices' class="btn" >Back to View</a>
						</div>
			          
			          
			        </div>
			       
<div style="display:none" id="div"><div class="searchpanel">
			        
			        		<form action="find_devicesadmin" method="GET">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  	<%-- <td align="left" valign="middle" width="10%" class="input_txtlabel">Org Name :
							  	<select name="org_name" id="e1"style="width:250px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">
							    <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
							    </c:forEach>
							    </select>
							  	</td>
							    <!-- <td align="left" valign="middle" width="10%">
							    <input id="ms7" style="width:200px;" type="text"/>
							    </td> -->
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Branch  :
							    <select name="branch" id="e2"style="width:250px;">
							    <option value="">Select None</option>
							    <c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">
							    <option value="${userorg_name.branch}">${userorg_name.branch}</option>
							    </c:forEach>
							    </select></td> --%>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">IMEI No:<br/>
							    <select name="device_imei_number" id="e3"style="width:250px;">
							    <option selected>--Select IMEI No--</option>
							    <c:forEach items="${deviceRegistrationForm1.deviceRegistrations}" var="deviceRegistrations1" varStatus="status">
							    <option value="${deviceRegistrations1.device_imei_number}"<c:if test="${deviceRegistrations1.device_imei_number==device_imei_number}"><c:out value="selected"></c:out></c:if>>${deviceRegistrations1.device_imei_number}</option>
							    </c:forEach>
							    </select></td>
							   
							    <td align="left" valign="middle" width="10%">&nbsp;Sim No :&nbsp;<br/>
							    <select name="sim_card_number" id="e4"style="width:250px;">
							    <option selected>--Select Sim No--</option>
							    <c:forEach items="${deviceRegistrationForm1.deviceRegistrations}" var="deviceRegistrations1" varStatus="status">
							    <option value="${deviceRegistrations1.sim_card_number}" <c:if test="${deviceRegistrations1.sim_card_number==sim_card_number}"><c:out value="selected"></c:out></c:if>>${deviceRegistrations1.sim_card_number}</option>
							    </c:forEach>
							    </select></td>
							    <td align="left" valign="middle" width="10%" class="input_txtlabel">Admin Ip:&nbsp;<br/>
							    <select name="adminip" id="e5"style="width:250px;">
							    <option selected>--Select Admin IP--</option>
							    <c:forEach items="${deviceRegistrationForm1.deviceRegistrations}" var="deviceRegistrations1" varStatus="status">
							    <option value="${deviceRegistrations1.adminip}"<c:if test="${deviceRegistrations1.adminip==adminip}"><c:out value="selected"></c:out></c:if>>${deviceRegistrations1.adminip}</option>
							    </c:forEach>
							    </select></td></tr><tr>
							    <td align="left" valign="middle" width="8%">&nbsp;Created By :&nbsp;&nbsp;&nbsp;<br/>
							    <select name="create_user_id" id="e6"style="width:250px;">
							    <option selected>--Select User--</option>
							    <c:forEach items="${deviceRegistrationForm1.deviceRegistrations}" var="deviceRegistrations1" varStatus="status">
							    <option value="${deviceRegistrations1.create_user_id}" <c:if test="${deviceRegistrations1.create_user_id==create_user_id}"><c:out value="selected"></c:out></c:if>>${deviceRegistrations1.create_user_id}</option>
							    </c:forEach>
							    </select></td>
							    
							    <td align="center" valign="middle" width="20%">
							    <input type="submit" class="btn" value="Search"></td>
							 
							 
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
								
         						<td valign="top" align="left" width="15%">Device IMEI</td>
					         	<td valign="top" align="left" width="12%">Sim Card No</td>
					         	
					         	<td valign="top" align="left" width="16.6%">Admin ip</td>
					         	<td valign="top" align="left" width="20%">Configuration Date</td>
          						<td valign="top" align="left" width="10%">Created by</td>  
          						<td valign="top" align="left" width="13%">Device Status</td>        					
          						<td valign="top" align="left" width="21%">Action</td>
        					</tr>
        				</table>
						<div class="Panel_One_Inner">
						
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="order-table table">
							<c:if test="${fn:length(deviceRegistrationForm.deviceRegistrations) gt 0 }">
        					<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" varStatus="status">
        				       					<tr class="row1">
							       		<%-- <td valign="center" align="center" width="5%"><input type="checkbox" value="${deviceRegistrations.device_imei_no}" name="chkUser"></td> --%>
							       		<td valign="top" align="left"  width="14%">${deviceRegistrations.device_imei_number}</td>
					     		     	
					     		     	<td valign="top" align="left"  width="12%">${deviceRegistrations.sim_card_number}</td>
										
											
											<td valign="top" align="left" width="16.6%">${deviceRegistrations.adminip}</td>
											<td valign="top" align="left" width="18%">${deviceRegistrations.configuration_date}</td>
											<td valign="top" align="left" width="10%">${deviceRegistrations.create_user_id}</td>
											<td valign="top" align="left" width="10%">
											
											 <c:choose>
											<c:when test="${deviceRegistrations.device_status==1}">
											<c:out value="ON"></c:out>
											</c:when>
											<c:when test="${deviceRegistrations.device_status==0}">
											<c:out value="OFF"></c:out>
											</c:when>
											<c:otherwise>
											<c:out value=""></c:out>
											</c:otherwise>
											</c:choose> 
											
											</td>
											<td valign="top" align="left" width="15%">
										
												<a href="<c:out value="edit_device?device_imei_number=${deviceRegistrations.device_imei_number}"/>" style="padding-right:10px;"><img src="resources/images/edit-29.png" width="20"height="18"alt="Edit" title="Edit"/></a>
												
											<a href="<c:out value="delete_device?device_imei_number=${deviceRegistrations.device_imei_number}"/>" onclick="return confirmation()"><img src="resources/images/del.png" alt="Delete" width="20"height="18" title="Delete"/></a>
									
											</td>
								</tr>
							    	</c:forEach>
							    	</c:if>
							    <c:if test="${fn:length(deviceRegistrationForm.deviceRegistrations) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Devices Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        								
		
        				</div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
          						<td valign="top" align="right" width="100%">&#9660;</td>
        					</tr>
        				</table></td>
						</tr>
						</table>
        			</div></div>

<jsp:include page="footer.jsp"></jsp:include>
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Device ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
