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


	<table class="margin_table">
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Class &amp; Section View<span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td><div style="display:none" id="div">
<div style="border:#ccc 2px solid; padding:15px;border-bottom-left-radius:10px;border-bottom-right-radius:10px; margin-bottom:15px; background-color:white;"> 
<form action="findorg" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="right" valign="middle" width="15%" class="input_txtlabel">&nbsp;Org Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms7" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Branch  &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms8" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Class  &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms9" style="width:200px;" type="text"/></td>
								</tr><tr>							   
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Section  &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms10" style="width:200px;" type="text"/></td>
							    
							    <td align="right" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Search" name="findorg"></td>

							  </tr>
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
							
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
         						<td valign="top" align="left" width="15%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="15%"> Branch </td>
          						<td valign="top" align="left" width="15%">Class</td>
          						<td valign="top" align="left" width="15%"> Section</td>
          						<td valign="top" align="left" width="25%">Operation</td>
          						
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<c:if test="${fn:length(classSectionForm.classSections) gt 0 }">
        					<c:forEach items="${classSectionForm.classSections}" var="classSection" varStatus="status">
        				       					<tr class="row1">
							       		
					     		     	<td valign="top" align="left" width="15%">${classSection.org_name}</td>					     		     
					     		     
											<td valign="top" align="left" width="15%">${classSection.branch}</td>
											<td valign="top" align="left" width="15%">${classSection.class_std}</td>
											<td valign="top" align="left" width="15%">${classSection.section}</td>
											
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editorg?org_id=${orgRegistration.org_id}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteorg?org_id=${orgRegistration.org_id}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							    <c:if test="${fn:length(classSectionForm.classSections) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Classes Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
          						<td valign="top" align="right" width="100%">&#9660</td>
          						
          						
        					</tr></table>
        				</div>
        				
        				</td>
        				</tr>
        				</table></div></div>
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the Organization ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
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
	 
<script language="javascript">

function selectall(field)
{
	
		//field.getElementByTagName('checkbox');
	var i;	
	if(document.grid.checkall.checked == true)
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
