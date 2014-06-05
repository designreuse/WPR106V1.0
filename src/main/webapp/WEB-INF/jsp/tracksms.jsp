<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
<style type="text/css">
        body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #report { border-collapse:collapse;}
        #report h4 { margin:0px; padding:0px;}
        #report img { float:right;}
        #report ul { margin:10px 0 10px 40px; padding:0px;}
        #report th { background:#3bb9ff url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:0px 2px; text-align:left;}
        #report td { background:#eee none repeat-x scroll center left; color:#fff; padding:0px 2px; }
        #report tr.odd td { background:#fff ;color:#666; cursor:pointer; }
        #report div.arrow { background:transparent url(resources/images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;}
        #report div.up { background-position:0px 0px;}
        
    </style>
    
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").dblclick(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script> 
<jsp:include page="header.jsp"></jsp:include>
<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"> 
      		
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>TRACK SMS
			        <br/></h2>	<div class="searchdiv">
                        <a href="#" class="searchpressable" onclick="toggle(this,'div');return false">
                          Open Search
                        </a></div>			        </div>
                        
<div style="display:none" id="div"><div class="searchpanel">
<form action="clientsmstrack" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  
        				    <tr>
							  
							   <td align="left" valign="middle" width="8%">From Date:<br/>
							    <input type="text" class="org_input_txtbx_height1"  id="fromdate" name="from_date"   value="${organisation.org_name}"/></td>
							    <td align="left" valign="middle" width="10%">To Date:<br/>
							    <input type="text" class="org_input_txtbx_height1"  id="todate" name="to_date"   value="${organisation.org_name}"/></td>
							   
							    <td align="center" valign="middle"></td>
							  <td align="center" valign="middle" width="30%">
							  <input type="submit" class="btn" value="Search" ></td>
							 
							  </tr>
							</table>
							</form>
						</div>
					</div>
						
						<div style="display:none" id="divfilter">
							<div id="filter_box">

	<div class="wrapperFilter">
		<img class="btn" width="25" height="27" title="Search" align="center"/>
	<input type="text" id="search" name="search" placeholder="Enter Text To Filter" class="light-table-filter" data-table="order-table" placeholder="Filter"/>
	</div>
</div></div>                        
                        
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="13%">Date</td>					
					         	<td valign="top" align="left" width="10%">Mobile Number</td>
          						<td valign="top" align="left" width="8%">Status</td>
          						
          						
        					</tr>  </table>
        					</td>
        					</tr>
        					</table>
        					</div>
        					</div>
        					
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
			    

