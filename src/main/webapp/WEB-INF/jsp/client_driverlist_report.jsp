<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
 	<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>


   


   <!-- ######################################DDDL END HERE@############################################## -->
  
 <jsp:include page="header.jsp"></jsp:include> 


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table" style="height:900px">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			         <h2> Reports </h2>
                    
			        </div>
			    
			    
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
			        <tr style="height:20px"> </tr>
    	
	<tr style="height:20px">
		
		<td>
				<table cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%" class="order-table table">
							
						
        					<tr style="height:20px">
							    	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span>Driver Name</td><td>:</td>
				                  
				                  <td valign="top" align="left" class="input_txt">
				                  	
				                  	<input type="text" class="org_input_txtbx_height1" id="fromdate"  onblur="toTitleCase('fdate')" value="${adminuser.firstname }" name="driver_name" />
				                  
				                  	</td>
				                  	
				                  	
				                  	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> Vehicle No </td><td>:</td>
				                   <td valign="top" align="left" class="input_txt">
				                  <input type="text" class="org_input_txtbx_height1" id="todate"  onblur="toTitleCase('tdate'')" value="${adminuser.firstname }" name="vechicle_reg_no" />
				                  </td>
				                  	
				                  	<td valign="middle" align="left" class="input_txtlabel">
				                  <span class="err">*</span> License No </td><td>:</td>
				                   <td valign="top" align="left" class="input_txt">
				                  <input type="text" class="org_input_txtbx_height1" id="todate"  onblur="toTitleCase('tdate'')" value="${adminuser.firstname }" name="vechicle_reg_no" />
				                  </td>
							   </tr>
						</table>
        				</td>
        				</tr>
        				 <tr style="height:20px"> </tr>
        				<tr style="height:20px">
        			<td>
        				<table width="40%" cellpadding="2" cellspacing="0" border="0" style="margin:0 0 0 61%;">
    <tr style="height:20px"><td><a href="" class="searchpressable showreport" >show</a></td>
    <td><a href="" class="searchpressable downloadreoprt">Download</a></td>
    <td><a href="javascript:void(processPrint());" class="searchpressable printreport" >Print</a></td>
    <td>
    <a href="" class="searchpressable mailreport" >Email</a></td></tr>
   
    </table> </td> </tr>
        				
        			<tr>
        			<td>
        			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="">
        			<tr><td><div class="report_table_innertop" id="printMe">
        			<table>
        			<tr>
        			
        			
        			</tr>
        			</table>
        			</div></td></tr>
        			</table>
        			</td>
        			</tr>	
        			</table></td></tr>
        				</table>
        				</div></div>
        				
        				

<script type="text/javascript">
function doAjaxPost() {  
	/* alert("hi"); */
	var orgname = $('#orgid').val();
	/* alert(orgname); */
	 $.ajax({  
		    type: "POST",  
		    url: "/BusTrackingApp/add_user_ajax",  
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

<script language="javascript">
    var gAutoPrint = true;

    function processPrint(){

    if (document.getElementById != null){
    var html = '<HTML>\n<HEAD>\n';
    if (document.getElementsByTagName != null){
    var headTags = document.getElementsByTagName("head");
    if (headTags.length > 0) html += headTags[0].innerHTML;
    }

    html += '\n</HE' + 'AD>\n<BODY>\n';
    var printReadyElem = document.getElementById("printMe");

    if (printReadyElem != null) html += printReadyElem.innerHTML;
    else{
    alert("Error, no contents.");
    return;
    }

    html += '\n</BO' + 'DY>\n</HT' + 'ML>';
    var printWin = window.open("","processPrint");
    printWin.document.open();
    printWin.document.write(html);
    printWin.document.close();

    if (gAutoPrint) printWin.print();
    } else alert("Browser not supported.");

    }
</script>

<jsp:include page="footer.jsp"></jsp:include>
