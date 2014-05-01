<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
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
	               <h2>Class and Section</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%" ><span class="err">*</span> Organization :</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select class="org_input_cmbbx" name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" >${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               </tr>
				                
                        		<tr class="row2">
                        		<td valign="middle" align="right" class="input_txt" "><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	
				                  	 <div id="info" style="height:8px; " > 	<select class="org_input_cmbbx" name="branch" id="bid" onblur="Validate1('bid')">
							    <option value="">-- Select branch--</option>
							  </select>
        				       </div> 
				                  <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr> 
						  <tr class="row1">
				                <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Class :</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select class="org_input_cmbbx" id="inp_id" name="class_std" value="${class_section.class_std}">
				                  	<option value="PreKG">Pre-KG</option>
				                  	<option value="UKG">UKG</option>
				                  	<option value="LKG">LKG</option>
				                  	<option value="1">1</option>
				                  	<option value="2">2</option>
				                  	<option value="3">3</option>
				                  	<option value="4">4</option>
				                  	<option value="5">5</option>
				                  	<option value="6">6</option>
				                  	<option value="7">7</option>
				                  	<option value="8">8</option>
				                  	<option value="9">9</option>
				                  	<option value="10">10</option>
				                  	<option value="11">11</option>
				                  	<option value="12">12</option>
				                  	</select>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.class_std"></form:errors></font></td>
				                </tr>
				                
				                <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Section:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select class="org_input_cmbbx" id="inp_id" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F">F</option>
				                  	<option value="G">G</option>
				                  	<option value="H">H</option>
				                  	<option value="I">I</option>
				                  	<option value="J">J</option>
				                  	<option value="K">K</option>
				                  	<option value="L">L</option>
				                  	<option value="M">M</option>
				                  	<option value="N">N</option>
				                  	<option value="O">O</option>
				                  	<option value="P">P</option>
				                  	<option value="Q">Q</option>
				                  	<option value="R">R</option>
				                  	<option value="S">S</option>
				                  	<option value="T">T</option>
				                  	<option value="U">U</option>
				                  	<option value="V">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr>
				                     <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Services:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select name="service" class="org_input_cmbbx">
				                  	<option value="" selected>--Select Service--</option>
				                  	<option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="Attendance" >None Of These</option>
				                  	</select>				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr>
				               
				                
                <tr class="row1" >
				              <td valign="top" align="left"></td>
                 
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="submit_btn" value="Register"></td>
                  
                  <td> 
                   <input type="button" class="submit_btn " onclick="window.location.href='welcome'" value="Cancel">
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
<script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.4.3.min.js'></script>