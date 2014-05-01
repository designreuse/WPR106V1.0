<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
  <script type="text/javascript" src="resources/js/autoddl/jquery-1.8.3-min.js"></script>
  <script type="text/javascript" src="resources/js/autoddl/magicsuggest-1.3.1.js"></script>
  <link rel="stylesheet" href="resources/js/autoddl/magicsuggest-1.3.1.css">
  <%-- 
    									 
										   <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
										  --%>
     <script type="text/javascript">
        $(document).ready(function() {
            var jsonData = [];
            var cities=new Array();
            var i=0;
            '<c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">';
                cities[i]='<c:out value="${userorg_name.org_name}"></c:out>';
                i=i+1;
            '</c:forEach>';
            for(var i=0;i<cities.length;i++) jsonData.push({id:i,name:cities[i],status:i%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData1 = [];
            var cities1=new Array();
            var i1=0;
            alert(i1);
            '<c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name">';
                cities1[i1]='<c:out value="${userorg_name.branch}"></c:out>';
                i1=i1+1;
            '</c:forEach>';
            for(var i1=0;i1<cities1.length;i1++) jsonData1.push({id:i1,name:cities1[i1],status:i1%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});


            var jsonData2 = [];
            var cities2=new Array();
            var i2=0;
            
			
            '<c:forEach items="${adduserform.adduser}" var="addUser1" >';
                cities2[i2]='<c:out value="${addUser1.firstname}"></c:out>';
                i2=i2+1;
            '</c:forEach>';
            for(var i2=0;i2<cities2.length;i2++) jsonData2.push({id:i2,name:cities2[i2],status:i2%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData3 = [];
            var cities3=new Array();
            var i3=0;
            
			
            '<c:forEach items="${adduserform.adduser}" var="addUser1" >';
                cities3[i3]='<c:out value="${addUser1.lastname}"></c:out>';
                i3=i3+1;
            '</c:forEach>';
            for(var i3=0;i3<cities3.length;i3++) jsonData3.push({id:i3,name:cities3[i3],status:i3%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});

            var jsonData4 = [];
            var cities4=new Array();
            var i4=0;
            
			
            '<c:forEach items="${adduserform.adduser}" var="addUser1" >';
                cities4[i4]='<c:out value="${addUser1.email}"></c:out>';
                i4=i4+1;
            '</c:forEach>';
            for(var i4=0;i4<cities4.length;i4++) jsonData4.push({id:i4,name:cities4[i4],status:i4%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
			
            
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
            var ms11 = $('#ms11').magicSuggest({
                data: jsonData4,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            });
			

             });
    </script>
  
  <!-- ######################################DDDL END HERE@############################################## -->
  
 <jsp:include page="header.jsp"></jsp:include> 


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Admin User Information
			          <span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	
<tr>

<td>

<div style="display:none" id="div">
<div style="border:#ccc 2px solid; border-bottom-left-radius:10px;border-bottom-right-radius:10px; padding:15px; margin-bottom:20px; background-color:white;"> 
<form action="finduser" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="right" valign="middle" width="15%" class="input_txtlabel"> Org Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input id="ms7" style="width:200px;" type="text"/>
									<%-- <div class="ui-widget">
									  <select id="combobox" name="org_name">
    									<option value="">Select one...</option>
    									 <c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name" varStatus="status">
										   <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
										 </c:forEach>
  										</select></div>
							     --%>
							    <!-- <input type="text" name="org_id" class="search_txtbx_height12" > --></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp; Branch &nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <input id="ms8" style="width:200px;" type="text"/>
							    <!-- <input type="text" name="admin_id" class="search_txtbx_height12"> --></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;First Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%">
							    <!-- <input type="text" name="#" class="search_txtbx_height12"> -->
							     <input id="ms9" style="width:200px;" name="" type="text"/>
							    </td>
							    
							  </tr>
							  <tr >
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;Last Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><!-- <input type="text" name="#" class="search_txtbx_height12"> -->
							     <input id="ms10" style="width:200px;" type="text"/></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Email&nbsp; </td>
							    <td align="left" valign="middle" width="10%"><!-- <input type="text" name="#" class="search_txtbx_height12"> -->
							     <input id="ms11" style="width:200px;" type="text"/>
							    </td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel"> </td>
							    <td align="left" valign="middle" width="20%"><br/><input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="15%"> Organization</td>
         						<td valign="top" align="left" width="15%"> Branch</td>
         						<td valign="top" align="left" width="10%"> FirstName</td>
         						<td valign="top" align="left" width="10%"> LastName</td>
         						<td valign="top" align="left" width="15%"> Email</td>
					         	<td valign="top" align="left" width="10%"> UserName</td>
					         	<td valign="top" align="left" width="10%"> Password</td>
					        	<td valign="top" align="left" width="25%"> Action</td>
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							
        					<c:if test="${fn:length(adduserform.adduser) gt 0 }">
        					<c:forEach items="${adduserform.adduser}" var="addUser" varStatus="status">
        				       					<tr class="row1">
							         	    <td valign="top" align="left"  width="15%">${addUser.org_name}</td>
							         	    <td valign="top" align="left" width="15%">${addUser.branch}</td>
											<td valign="top" align="left" width="10%">${addUser.firstname}</td>
											<td valign="top" align="left" width="10%">${addUser.lastname}</td>
											<td valign="top" align="left" width="15%">${addUser.email}</td>
											<td valign="top" align="left"  width="10%">${addUser.username}</td>
											<td valign="top" align="left" width="10%">${addUser.password}</td>
											
											
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edituser?admin_reg_no=${addUser.username}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteuser?admin_id=${addUser.username}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(adduserform.adduser) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Users Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
					        	<td valign="top" align="right" width="101%"> &#9660;</td>
          						
        					</tr>
        					</table>
        			</div>
        				
        				</td>
        				</tr>
        				</table></div></div>
        				
        				
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the User ?");
	if (answer){
		return true;
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
	 

<jsp:include page="footer.jsp"></jsp:include>
 
 
<%-- 
  
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ###################################DDDL################################### -->
  
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
  <style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
    /* support: IE7 */
    *height: 1.7em;
    *top: 0.1em;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 0.3em;
  }
  </style>
  <script>
  (function( $ ) {
    $.widget( "custom.combobox", {
      _create: function() {
        this.wrapper = $( "<span>" )
          .addClass( "custom-combobox" )
          .insertAfter( this.element );
 
        this.element.hide();
        this._createAutocomplete();
        this._createShowAllButton();
      },
 
      _createAutocomplete: function() {
        var selected = this.element.children( ":selected" ),
          value = selected.val() ? selected.text() : "";
 
        this.input = $( "<input>" )
          .appendTo( this.wrapper )
          .val( value )
          .attr( "title", "" )
          .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
          .autocomplete({
            delay: 0,
            minLength: 0,
            source: $.proxy( this, "_source" )
          })
          .tooltip({
            tooltipClass: "ui-state-highlight"
          });
 
        this._on( this.input, {
          autocompleteselect: function( event, ui ) {
            ui.item.option.selected = true;
            this._trigger( "select", event, {
              item: ui.item.option
            });
          },
 
          autocompletechange: "_removeIfInvalid"
        });
      },
 
      _createShowAllButton: function() {
        var input = this.input,
          wasOpen = false;
 
        $( "<a>" )
          .attr( "tabIndex", -1 )
          .attr( "title", "Show All Items" )
          .tooltip()
          .appendTo( this.wrapper )
          .button({
            icons: {
              primary: ""
            },
            text: false
          })
          .removeClass( "ui-corner-all" )
          .addClass( "custom-combobox-toggle ui-corner-right" )
          .mousedown(function() {
            wasOpen = input.autocomplete( "widget" ).is( ":visible" );
          })
          .click(function() {
            input.focus();
 
            // Close if already visible
            if ( wasOpen ) {
              return;
            }
 
            // Pass empty string as value to search for, displaying all results
            input.autocomplete( "search", "" );
          });
      },
 
      _source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        response( this.element.children( "option" ).map(function() {
          var text = $( this ).text();
          if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
              label: text,
              value: text,
              option: this
            };
        }) );
      },
 
      _removeIfInvalid: function( event, ui ) {
 
        // Selected an item, nothing to do
        if ( ui.item ) {
          return;
        }
 
        // Search for a match (case-insensitive)
        var value = this.input.val(),
          valueLowerCase = value.toLowerCase(),
          valid = false;
        this.element.children( "option" ).each(function() {
          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
          }
        });
 
        // Found a match, nothing to do
        if ( valid ) {
          return;
        }
 
        // Remove invalid value
        this.input
          .val( "" )
          .attr( "title", value + " didn't match any item" )
          .tooltip( "open" );
        this.element.val( "" );
        this._delay(function() {
          this.input.tooltip( "close" ).attr( "title", "" );
        }, 2500 );
        this.input.data( "ui-autocomplete" ).term = "";
      },
 
      _destroy: function() {
        this.wrapper.remove();
        this.element.show();
      }
    });
  })( jQuery );
 
  $(function() {
    $( "#combobox" ).combobox();
    $( "#toggle" ).click(function() {
      $( "#combobox" ).toggle();
    });
  });
  </script>

  <!-- ######################################DDDL END HERE@############################################## -->
  
 <jsp:include page="header.jsp"></jsp:include> 


<div id="GPS_View_container">
    <div id="GPS_View_menu"><jsp:include page="admin_menu.jsp"></jsp:include></div>
    <div id="GPS_View_table">

	<table class="margin_table">
	<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2> Admin User Information
			          <span style="margin:3% 0 0 65%; padding:2px;">
			          <a href="#" onclick="toggle(this,'div');return false">
			          <img title="Open Search"src="resources/images/search-blue-icon.png" style="height:40px;width:70px;"/></a></span>
			          </h2>
			        </div>
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if> 
<tr>

<td>

<div style="display:none" id="div">
<div style="border:#ccc 2px solid; border-bottom-left-radius:10px;border-bottom-right-radius:10px; padding:15px; margin-bottom:20px; background-color:white;"> 
<form action="finduser" method="GET">
							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="right" valign="middle" width="15%" class="input_txtlabel"> Org Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%">
								 <div class="ui-widget">
									  <select id="combobox" name="org_name">
    									<option value="">Select one...</option>
    									 <c:forEach items="${orgRegistrationForm.orgregistration}" var="userorg_name" varStatus="status">
										   <option value="${userorg_name.org_name}">${userorg_name.org_name}</option>
										 </c:forEach>
  										</select></div> 
							    
							    <input type="text" name="org_id" class="search_txtbx_height12" ></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp; Branch &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="admin_id" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;First Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    
							  </tr>
							  <tr >
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">&nbsp;Last Name &nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel">Email&nbsp; </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="#" class="search_txtbx_height12"></td>
							    <td align="right" valign="middle" width="10%" class="input_txtlabel"> </td>
							    <td align="left" valign="middle" width="20%"><br/><input type="submit" class="submit_btn" value="Search" name="find"></td>
							 
							  </tr>
							
							</table>
							</form>
							</div></div>
							</td>
							</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="15%"> Organization</td>
         						<td valign="top" align="left" width="15%"> Branch</td>
         						<td valign="top" align="left" width="10%"> FirstName</td>
         						<td valign="top" align="left" width="10%"> LastName</td>
         						<td valign="top" align="left" width="15%"> Email</td>
					         	<td valign="top" align="left" width="10%"> UserName</td>
					         	<td valign="top" align="left" width="10%"> Password</td>
					        	<td valign="top" align="left" width="25%"> Action</td>
          						
        					</tr></table>
							<div class="Panel_One_Inner">
							
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							
        					<c:if test="${fn:length(adduserform.adduser) gt 0 }">
        					<c:forEach items="${adduserform.adduser}" var="addUser" varStatus="status">
        				       					<tr class="row1">
							         	    <td valign="top" align="left"  width="15%">${addUser.org_name}</td>
							         	    <td valign="top" align="left" width="15%">${addUser.branch}</td>
											<td valign="top" align="left" width="10%">${addUser.firstname}</td>
											<td valign="top" align="left" width="10%">${addUser.lastname}</td>
											<td valign="top" align="left" width="15%">${addUser.email}</td>
											<td valign="top" align="left"  width="10%">${addUser.username}</td>
											<td valign="top" align="left" width="10%">${addUser.password}</td>
											
											
											<td valign="top" align="left" width="25%">
										
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edituser?admin_reg_no=${addUser.username}"/>" style="padding-right:10px;">Edit</a>
												
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteuser?admin_id=${addUser.username}"/>" onclick="return confirmation()">Remove</a>
									
											</td>
								</tr>
							    	</c:forEach>
							    </c:if>
							     <c:if test="${fn:length(adduserform.adduser) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Users Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
        				</table>
        				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
					        	<td valign="top" align="right" width="101%"> &#9660;</td>
          						
        					</tr>
        					</table>
        			</div>
        				
        				</td>
        				</tr>
        				</table></div></div>
        				
        				
        				
<script>

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete the User ?");
	if (answer){
		return true;
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
	 

<jsp:include page="footer.jsp"></jsp:include>
 
  --%>