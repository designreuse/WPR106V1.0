<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
  	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>

   <!-- ######################################DDDL END HERE@############################################## -->
  <script id="script_orgid">
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

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			         <h2> Reports </h2>
                    
			        </div>
			    
			    
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	
	<tr>

		<td>
			<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;width:100%" class="order-table table">
							
        					
        				      <tr class="row1">
							     <td valign="middle" align="left" class="input_txtlabel" width="15%">
				                  <span class="err">*</span>Organization Name</td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                <select  name="org_name" style="width:220px;margin-top:-4px;" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname}" var="orgname" varStatus="status">
        				        <option value="${orgname}" >${orgname}</option>
			                     </c:forEach>
			                      </select>
				              </td>
					       </tr>
							    
							    
							  <tr class="row2">
							    	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Branch </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                 <div id="info"> 
				                 	<select style="width:220px;margin-top:-4px;" name="branch" id="bid" onblur="Validate1('bid')" disabled="disabled">
							   <option value="">-- Select branch--</option>
							  </select>
        				       </div> 
				                  </td>
							   </tr>
							  
							  <tr class="row1">
							  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> From Date </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="fdate"  onblur="toTitleCase('fdate')" value="${adminuser.firstname }" name="fromdate" />
				                  	<br/>
							  </tr>
							  
							  <tr class="row2">
							  <td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> To Date </td><td>:</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="org_input_txtbx_height1" id="tdate"  onblur="toTitleCase('tdate'')" value="${adminuser.firstname }" name="todate" />
				                  	<br/>
							  </tr>
        				</table></div>
        				
        			
        				
        				</td>
        				</tr>
        				</table></td></tr>
        				</table>
        				</div></div>
        				
        				




<jsp:include page="footer.jsp"></jsp:include>
