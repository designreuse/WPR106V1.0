<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style>#div {display: none}
</style>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

<script id="script_bid">
    $(document).ready(function() {
        $("#orgid").select2();
    });
</script>

<script id="script_bid">
    $(document).ready(function() {
        $("#bid").select2();
    });
</script>

<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
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


<form action="insert_class_section" method="POST">
<table class="margin_table">

      <tr>
      
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	               <h2>Holiday Entry</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row1"><td width="25%"></td>
				                  <td valign="middle" align="left" class="input_txt" width="14%" ><span class="err">*</span> Organization Name</td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select  style="width:220px;"name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" >${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                        		<tr class="row2"><td width="25%"></td> 
                        		<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Branch<br/><span style="color:#f5f5f5;">.</span></td><td width="1%">:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	
				                  	 <div id="info" style="height:8px; " > 
				                  	 	<select  style="width:220px;"name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="">-- Select branch--</option>
							  </select>
        				       </div> 
				                  <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr></table> <table cellpadding="0" cellspacing="0" border="0" width="100%" >
						 <tr class="row1"><td width="25%"></td>
				                <td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Number of Days </td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	
				                  	<label><input type="radio" name="group1" class="radio1" data-divclass="div1">Only One Day</label>
<label><input type="radio" name="group1" class="radio2" data-divclass="div2"> More than One Day</label>



				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.class_std"></form:errors></font></td>
				                </tr></table>
				                <div id="div" class="div1 content"><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Holiday Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<input type="text" value="" id="datepicker"name="fromdate"/>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table></div>
				                     <div id="div" class="div2 content"><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> From Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<input type="text" value="" id="datepicker"name="fromdate"/>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table><table cellpadding="0" cellspacing="0" border="0" width="100%" >
				                     <tr class="row1"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> To Date</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<input type="text" value="" id="datepicker1"name="todate"/>			                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table></div>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
				               <tr class="row2"><td width="25%"></td>
					            	<td valign="middle" align="left" class="input_txt" width="14%"><span class="err">*</span> Description</td><td width="1%">:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  <textarea name="description" class="textareanew"></textarea>		                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr></table>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr class="row1" ><td width="25%"></td>
				              <td valign="top" align="left"></td>
                 <td width="1%"></td>
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Register"></td>
                  
                  <td> 
                   <input type="button" class="btn" onclick="window.location.href='welcome'" value="Cancel">
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
 	</table>
</form>
</div></div>

<!-- <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->

<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
	$("#datepicker1").datepicker({ minDate: 0});
	
});
</script>
<script>
$('[type="radio"]').click(function () {
    $('.content').hide();
    $('.' + $(this).data("divclass")).show();
});
</script>
<jsp:include page="footer.jsp"></jsp:include>