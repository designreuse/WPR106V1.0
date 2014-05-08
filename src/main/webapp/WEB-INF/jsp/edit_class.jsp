<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

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

				                  </td>
				                  
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	 <input type="hidden" name="branch" class="org_input_cmbbx" value="${class_section.branch}"/>${class_section.branch}
				                  	
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
