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
<form action="updateclass" method="POST">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     
      <tr>
        <td valign="top" align="left">
        
	            <div class="headings altheading">
	              <h2>Edit Class Registration</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${classSectionForm.classSections[0]}" var="class_section"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Organization:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="org_name" class="org_input_cmbbx" value="${class_section.org_name}"/>${class_section.org_name}
				                  	
				                  	
				                  	<%-- <select class="org_input_cmbbx" name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="${class_section.org_name}" selected>${class_section.org_name}</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" >${orgname_for_school}</option>
			                  </c:forEach>
			                 </select> --%>
				                  </td>
				                  
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	 <input type="hidden" name="branch" class="org_input_cmbbx" value="${class_section.branch}"/>${class_section.branch}
				                  	 
				                  	<%--  <div id="info" style="height:7px; " > 	<select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="${class_section.branch}" selected>${class_section.branch}</option>
							  </select>
							  </div> --%>
				                  	<br/><font color="Red" size="+1"></font>
				                  </td>
				                  
				                </tr>
                        		

								 <tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Class:</td>
						            <td valign="top" align="left" class="input_txt">
						            	<input type="hidden" name="class_std" class="org_input_cmbbx" value="${class_section.class_std}"/>${class_section.class_std}
						            	<font color="Red" size="+1"></font></td>
						            	
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Section:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="section" class="org_input_cmbbx" value="${class_section.section}"/>${class_section.section}
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>Services:</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	 <select name="service" class="org_input_cmbbx" id="service_id">
					               <option value="${class_section.service}" selected>${class_section.service}</option>
					               <option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="Attendance" >None Of These</option>
        				        </select>
				                  	 
				                  	 <br/><font color="Red" size="+1"></font>
				                  </td>
				                
					           
				               
                <tr class="row1">
                <td valign="top" align="right"></td>
				             
				               <td valign="top" align="justify">
				               <table>
				             <tr> 
                 <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" ></td>
               
                  <td valign="top" align="left"><input type="button" class="submit_btn1" onclick="window.location.href='viewclass'"value="Cancel"></td></tr></table>
                  </td>
                 </table>
                 </td>
                 
                 </tr>
              </table></div>
         	</td>
  		</tr>
 	</table>
		</form>
</div></div>		  
        
 <script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_class_ajax",  
		    data: "org_name=" + orgname,
		    success: function(response){  
		    	
		    	
/* document.getElementById("branch").value=response; */
$('#info').html(response);
/* var select = document.getElementById("bid");
var option = document.createElement('option');
option.text = option.value = response;
select.add(option, 0); */
/* alert("shgjasgdjs"); */
   },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
</script>
        
        
        				
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
