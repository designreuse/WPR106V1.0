<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  <script type="text/javascript" src="resources/js/autoddl/magicsuggest-1.3.1.js"></script>
  <link rel="stylesheet" href="resources/js/autoddl/magicsuggest-1.3.1.css">
  <%-- 
    									 
										   <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
										  --%>
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
    </script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<form name="" action="" method="POST">
	<table class="margin_table">
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Device Informations
			          <span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			       
			        
			        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
 						 
				<tr>
				<td>	<div style="display:none" id="div">
					<div style="border:#ccc 2px solid;border-bottom-left-radius:10px;border-bottom-right-radius:10px;padding:15px; margin-bottom:15px;">
						<form action="find_bus_device" method="GET">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							  	<td align="right" valign="middle" width="10%" class="input_txtlabel">Org Name :
							  	</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms7" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Branch  :&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms8" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">IMEI No:&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							   <input id="ms9" style="width:200px;" type="text"/></td><tr/>
							   <tr>
							    <td align="right" valign="middle" width="10%">&nbsp;Sim No :&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms10" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Admin Ip:&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms11" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="8%">&nbsp;Created By :&nbsp;&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms12" style="width:200px;" type="text"/></td>
							    
							    <td align="right" valign="middle" width="20%">
							    <input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							 
							  </tr>
							</table>
							</form>
						</div></div>
						</td>
						</tr>
						</table>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
         						<td valign="top" align="left" width="10%">Device IMEI</td>
					         	<td valign="top" align="left" width="10%">Sim Card No</td>
					         	<td valign="top" align="left" width="15%">Device Status</td>
					         	<td valign="top" align="left" width="10%">Admin ip</td>
					         	<td valign="top" align="left" width="17%">Configuration Date</td>
          						<td valign="top" align="left" width="10%">Created by</td>          					
          						<td valign="top" align="left" width="25%">Action</td>
        					</tr>
        				</table>
						<div class="Panel_One_Inner">
						
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<c:if test="${fn:length(deviceRegistrationForm.deviceRegistrations) gt 0 }">
        					<c:forEach items="${deviceRegistrationForm.deviceRegistrations}" var="deviceRegistrations" varStatus="status">
        				       					<tr class="row1">
							       		<%-- <td valign="center" align="center" width="5%"><input type="checkbox" value="${deviceRegistrations.device_imei_no}" name="chkUser"></td> --%>
							       		<td valign="top" align="left"  width="10%">${deviceRegistrations.device_imei_number}</td>
					     		     	
					     		     	<td valign="top" align="left"  width="10%">${deviceRegistrations.sim_card_number}</td>
										<td valign="top" align="left" width="17%">
											
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
											
											<td valign="top" align="left" width="17%">${deviceRegistrations.adminip}</td>
											<td valign="top" align="left" width="10%">${deviceRegistrations.configuration_date}</td>
											<td valign="top" align="left" width="10%">${deviceRegistrations.create_user_id}</td>
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_bus_device?device_id=${deviceRegistrations.device_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_bus_device?device_id=${deviceRegistrations.device_id}"/>" onclick="return confirmation()">Remove</a>
									
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
        								<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
          						<td valign="top" align="right" width="100%">&#9660;</td>
        					</tr>
        				</table>
		
        				</div>
        				
        				</table></form></div></div>
				
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Device ?")
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
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

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>
    	
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
	 
<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
