<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1"/></label></p>
	          		</div>
				</td>
			</tr>
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Device Failure Log</h2>
			        </div>
			        
			        <div class="contentbox">

						<form name="grid"  action="viewbus" method="POST">
    	
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="center" align="center" width="15%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
         						<td valign="top" align="left" width="10%">Failure No</td>
					         	<td valign="top" align="left" width="10%">Device ID</td>
					         	<td valign="top" align="left" width="10%">Status</td>
          						<td valign="top" align="left" width="10%">Date & Time</td>
        					</tr>
        					
        					<c:forEach items="${deviceFailForm.deviceFails}" var="BusRegistration" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="center" align="center" width="15%"><input type="checkbox" value="${BusRegistration.failure_no}" name="chkUser"></td>
							       		<td valign="top" align="left"  width="10%">${BusRegistration.failure_no}</td>
					     		     	<td valign="top" align="left"  width="10%">${BusRegistration.device_id}</td>
					     		     	
											<td valign="top" align="left" width="17%">${BusRegistration.device_fail_status}</td>
											<td valign="top" align="left" width="17%">${BusRegistration.date}</td>
									
								</tr>
							    	</c:forEach>
							    	
							 
        				</table>
        				</form>
        				</div>
        				</td>
        				</tr>
        				</table>
        				</div>
        				
        				
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Device ?")
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

<jsp:include page="footer.jsp"></jsp:include>
