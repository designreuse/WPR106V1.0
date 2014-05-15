<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script id="script_bid">
    $(document).ready(function() {
        $("#inp_id").select2();
    });
</script>
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">



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
				                  <td valign="middle" align="right" class="input_txt" width="40%" ><span class="err">*</span> Route :</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select  style="width:220px;" name="org_name" id="orgid"   onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <option value="Routes here" >Routes here</option>
			                  
			                 </select>
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.org_id"></form:errors></font>
				                  </td>
				               </tr>
				                
                        		<tr class="row1">
                        		<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span>Shift</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<div id="info" style="height:8px;" > 
				                  	 	<select  style="width:220px;"name="branch" id="bid"  disabled="disabled">
							    <option value="shift here">-- Shift here--</option>
							  </select>
        				       </div> 
				                  <font color="Red" size="+1"><form:errors path="ClassSection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr> 
						  <tr class="row2">
				                <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Trip :</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<select  style="width:220px;"id="inp_id" name="class_std" value="${class_section.class_std}">
				                  	<option value="Pickup">Pick up</option>
				                  	<option value="Drop">Drop</option>
				                  	<option value="KG Drop">KG Drop</option>
				                  	
				                  	</select>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.class_std"></form:errors></font></td>
				                </tr>
				                
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Section:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<textarea name="" class="textareanew" ></textarea>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="ClassSection.section"></form:errors></font></td>
				                    
				                     </tr>
				                     
				               
				                
                <tr class="row1" >
				              <td valign="top" align="left"></td>
                 
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Send"></td>
                  
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
<script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>
