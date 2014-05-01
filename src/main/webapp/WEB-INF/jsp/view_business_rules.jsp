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
            var i0=0;
            '<c:forEach items="${orgsearchbr.orgBusinessRules}" var="orgsearchbr1">';
                cities[i0]='<c:out value="${orgsearchbr1.org_name}"></c:out>';
                i0=i0+1;
            '</c:forEach>';
            for(var i0=0;i0<cities.length;i0++) jsonData.push({id:i0,name:cities[i0],status:i0%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            alert(i1);
            '<c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules">';
                cities1[i1]='<c:out value="${vieworgBusinessRules.branch}"></c:out>';
                i1=i1+1;
            '</c:forEach>';
            for(var i1=0;i1<cities1.length;i1++) jsonData1.push({id:i1,name:cities1[i1],status:i1%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            
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
            });             });
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
			          <h2>Business Rules Information<span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			    
						
<div style="display:none" id="div">
						<div style="border:#ccc 2px solid;  border-bottom-left-radius:10px;border-bottom-right-radius:10px; padding:15px; margin-bottom:15px; ">
						<form action="findbus" method="GET">
							 
							<table >
							  <tr>
							    <td align="left" valign="middle" width="10%">Org Name :</td>
							    <td align="left" valign="middle" width="10%"><input id="ms7" style="width:200px;" type="text"/></td>
							    <td align="left" valign="middle" width="8%">&nbsp;Branch:</td>
							     <td align="left" valign="middle" width="10%"><input id="ms8" style="width:200px;" type="text"/></td>
							    <td align="center" valign="middle" width="30%"><input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							</table>
							</form>
						</div></div>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
         						<td valign="top" align="left" width="1%">Organization</td>
					         	<td valign="top" align="left" width="2%">Branch</td>
					         	<td valign="top" align="left" width="2%">UseMap</td>
          						<td valign="top" align="left" width="12%">PickUp Start/end</td>          						
          						<td valign="top" align="left" width="11%">Drop Start/end</td>
          						<td valign="top" align="left" width="13%">KGDrop Start/end</td>
          						<td valign="top" align="left" width="9%">Speed Limit</td>
          						<td valign="top" align="left" width="9%">SMS Option</td>          						
          						<td valign="top" align="left" width="13%">Action</td>          						
        					</tr></table>
    	<div class="Panel_One_Inner">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) gt 0 }">
        					
        					<c:forEach items="${orgBusinessRuleForm.orgBusinessRules}" var="vieworgBusinessRules" varStatus="status">
        				       <tr class="row1">
        				       <td valign="top" align="left" width="10%">${vieworgBusinessRules.org_name}</td>
					         	<td valign="top" align="left" width="3%">${vieworgBusinessRules.branch}</td>
					         	<td valign="top" align="center" width="8%">${vieworgBusinessRules.google_map_traffic}</td>
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.pickup_start_time } &#47; ${vieworgBusinessRules.pickup_end_time }</td>          						
          						<td valign="top" align="center" width="13%">${vieworgBusinessRules.drop_start_time } &#47; ${vieworgBusinessRules.drop_end_time }</td>
          						<td valign="top" align="center" width="14%">${vieworgBusinessRules.kg_start_time } &#47; ${vieworgBusinessRules.kg_end_time }</td>
          						<td valign="top" align="center" width="15%">${vieworgBusinessRules.speed_limit }</td>
          						<td valign="top" align="left" width="2%">${vieworgBusinessRules.sms_options }</td> 
        				        <td valign="top" align="right" width="17%">
							    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_bus?bus_id=${BusRegistration.bus_id}"/>" style="padding-right:10px;">Edit</a>
							    <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_bus?bus_id=${BusRegistration.bus_id}}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
								</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(orgBusinessRuleForm.orgBusinessRules) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Users Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				</div>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660;</td>
          						
        					</tr></table>
        				
        				
        				</td>
        				</tr>
        				</table></form></div></div>

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
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
	 

<script type="text/javascript" src="js/ajaxpaging.js"></script>


<jsp:include page="footer.jsp"></jsp:include>
