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
	              <h2>Edit Holidays</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0"  width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				<c:set value="${holidaysForm.holidays[0]}" var="holidays"></c:set>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1"><td width="25%"></td>
				                  <td valign="middle" align="left" class="input_txt" width="14%" ><span class="err">*</span> Organization Name</td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                 <input type="hidden" name="org_name" class="org_input_cmbbx" value="${holidays.org_name}"/>${holidays.org_name}
				                 
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                        		<tr class="row2"><td width="25%"></td> 
                        		<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Branch<br/><span style="color:#f5f5f5;">.</span></td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  <input type="hidden" name="branch" class="org_input_cmbbx" value="${holidays.branch}"/>${holidays.branch}
				                   <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr></table> 
				                <div id="div" class="div1 content"><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Holiday Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<input type="text" value="" id="datepicker" value="${holidays.holiday_date}" name="holiday_date" />
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table></div>
				                   
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
				               <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Description</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%" >
				                  <textarea name="holiday_reason" class="textareanew">${holidays.holiday_reason}</textarea><br/>
				                  <font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr class="row1" ><td width="25%"></td>
				              <td valign="top" align="left"></td>
                 <td width="1%"></td>
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Save Changes"></td>
                  
                  <td> 
                   <input type="button" class="btn" onclick="window.location.href='holidayviewadmin'" value="Cancel">
                  </td>
                  
                  </tr>
                  </table></td>                
				              
				               </tr>
                 </table>
                 </td>
                 </tr>
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
