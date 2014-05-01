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
            '<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration">';
                cities[i0]='<c:out value="${orgRegistration.org_name}"></c:out>';
                i0=i0+1;
            '</c:forEach>';
            for(var i0=0;i0<cities.length;i0++) jsonData.push({id:i0,name:cities[i0],status:i0%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            alert(i1);
            '<c:forEach items="${orgregistrationform.orgregistration}" var="orgRegistration">';
                cities1[i1]='<c:out value="${orgRegistration.branch}"></c:out>';
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
            });

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
			          <h2>Admin   Home<span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			          
			        </div>
			       
    	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    	<tr>

<td>
<div style="display:none" id="div">
						
<div style="border:#ccc 2px solid; border-bottom-left-radius:10px;border-bottom-right-radius:10px;padding:15px; margin-bottom:15px; background-color:white;"> 
<form action="findorg" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							
							  <tr>
							    <td align="right" valign="middle" width="15%" class="input_txtlabel">&nbsp;Org Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms7" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Branch  &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms8" style="width:200px;" type="text"/></td>
							    
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Search" name="findorg"></td>
							
							  </tr>
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							
							</table>
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<!-- <td valign="middle" align="center" width="1%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="15%"> Organization Name</td>					         	
					         	<td valign="top" align="left" width="15%"> Branch Name</td>
          						<td valign="top" align="left" width="15%"> No.of Busses</td>
          						<td valign="top" align="left" width="15%"> Device Status</td>
          						<td valign="top" align="left" width="25%"> No.of Students</td>



								</tr></table><div class="Panel_One_Inner">
								<table>
								<!-- Display Admin Userd here  Suresh--> 
									<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,'row_hover');" onmouseout="mouse_event(this,'row1');">
								           	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.age}</td>
											
										
										</tr>
							    	</c:forEach>
						    	</table></div>
						    	<table>
								<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr>

								</table>

								
								
								
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</div></div>
<jsp:include page="footer.jsp"></jsp:include>
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
