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
<script id="script_bid">
    $(document).ready(function() {
        $("#inp_id1").select2();
    });
</script>
<script id="script_bid">
    $(document).ready(function() {
        $("#service").select2();
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
	               <h2>Class and Section</h2> 
	               
	            </div>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    				
    						<table cellpadding="0" cellspacing="0" border="0" width="100%" >
    						<tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="40%" ><span class="err">*</span> Organization :</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<select  style="width:220px;" name="org_name" id="orgid"  onchange="doAjaxPost()" onblur="Validate('orgid')">
							    <option value="">-- Select Organization--</option>
        				        <c:forEach items="${orgname_for_school}" var="orgname_for_school" varStatus="status">
        				        <option value="${orgname_for_school}" <c:if test="${orgname_for_school==org_name}"><c:out value="selected"></c:out></c:if>   >${orgname_for_school}</option>
			                  </c:forEach>
			                 </select>
				                  	<br/><font color="Red" size="+1"><form:errors path="classsection.org_name"></form:errors></font>
				                  </td>
				               </tr>
				                
                        		<tr class="row1">
                        		<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Branch:</td>
				                  <td valign="top" align="left" class="input_txt" width="60%">
				                  	<span id="info" style="height:8px;" > 
				                  	 	<c:choose>
				                  	 	<c:when test="${fn:length(branch_array) gt 0}">
				                  	 	<select  style="width:220px;"name="branch" id="bid" onblur="Validate1('bid')" >
							             <c:forEach items="${branch_array}" var="branch1" >
							  		      <option value="${branch1}" <c:if test="${branch1==branch}"><c:out value="Selected"/></c:if>>${branch1}</option>
							  		     </c:forEach>
							            </select>
				                  	 	</c:when>
				                  	 	<c:otherwise>
				                  	 	<select  style="width:220px;"name="branch" id="bid" onblur="Validate1('bid')" >
							             <option value="">-- Select branch--</option>
							            </select>
				                  	 	</c:otherwise>
				                  	 	</c:choose>
				                  	</span> 
				                  <br/><font color="Red" size="+1"><form:errors path="classsection.branch"></form:errors></font>
				                  </td>
				                 
				                </tr> 
						  <tr class="row2">
				                <td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Class :</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  
				                  	<select  style="width:220px;"id="inp_id" name="class_std" value="${class_section.class_std}">
				                  	<option value="">-- Select Class --</option>
				                  	<option value="PreKG" <c:if test="${classSection.class_std=='PreKG'}"><c:out value="selected"/></c:if>>Pre-KG</option>
				                  	<option value="UKG" <c:if test="${classSection.class_std=='UKG'}"><c:out value="selected"/></c:if>>UKG</option>
				                  	<option value="LKG" <c:if test="${classSection.class_std=='LKG'}"><c:out value="selected"/></c:if>>LKG</option>
				                  	<option value="1" <c:if test="${classSection.class_std=='1'}"><c:out value="selected"/></c:if>>1</option>
				                  	<option value="2" <c:if test="${classSection.class_std=='2'}"><c:out value="selected"/></c:if>>2</option>
				                  	<option value="3" <c:if test="${classSection.class_std=='3'}"><c:out value="selected"/></c:if>>3</option>
				                  	<option value="4" <c:if test="${classSection.class_std=='4'}"><c:out value="selected"/></c:if>>4</option>
				                  	<option value="5" <c:if test="${classSection.class_std=='5'}"><c:out value="selected"/></c:if>>5</option>
				                  	<option value="6" <c:if test="${classSection.class_std=='6'}"><c:out value="selected"/></c:if>>6</option>
				                  	<option value="7" <c:if test="${classSection.class_std=='7'}"><c:out value="selected"/></c:if>>7</option>
				                  	<option value="8" <c:if test="${classSection.class_std=='8'}"><c:out value="selected"/></c:if>>8</option>
				                  	<option value="9" <c:if test="${classSection.class_std=='9'}"><c:out value="selected"/></c:if>>9</option>
				                  	<option value="10" <c:if test="${classSection.class_std=='10'}"><c:out value="selected"/></c:if>>10</option>
				                  	<option value="11" <c:if test="${classSection.class_std=='11'}"><c:out value="selected"/></c:if>>11</option>
				                  	<option value="12" <c:if test="${classSection.class_std=='12'}"><c:out value="selected"/></c:if>>12</option>
				                  	</select>
				                  	
				                  	
				                  	
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="classsection.class_std"></form:errors></font></td>
				                </tr>
				                
				                <tr class="row1">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Section:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<c:choose>
				                  	<c:when test="${section=='A'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A" selected="selected">A</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='B'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B" selected="selected">B</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='C'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C" selected="selected">C</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='D'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B" >B</option>
				                  	<option value="C">C</option>
				                  	<option value="D" selected="selected">D</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='E'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E" selected="selected">E</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='F'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F" selected="selected">F</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='G'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F">F</option>
				                  	<option value="G" selected="selected">G</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='H'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F">F</option>
				                  	<option value="G">G</option>
				                  	<option value="H" selected="selected">H</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='I'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B" >B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F">F</option>
				                  	<option value="G">G</option>
				                  	<option value="H">H</option>
				                  	<option value="I" selected="selected">I</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='J'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="A">A</option>
				                  	<option value="B">B</option>
				                  	<option value="C">C</option>
				                  	<option value="D">D</option>
				                  	<option value="E">E</option>
				                  	<option value="F">F</option>
				                  	<option value="G">G</option>
				                  	<option value="H">H</option>
				                  	<option value="I">I</option>
				                  	<option value="J" selected="selected">J</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='K'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="K" selected="selected">K</option>
				                  	<option value="L" >L</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='L'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="L" selected="selected">L</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='M'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="M" selected="selected">M</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='N'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="N" selected="selected">N</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='O'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="O" selected="selected">O</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='P'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="P" selected="selected">P</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='Q'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="Q" selected="selected">Q</option>
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
				                  	</c:when>
				                  	<c:when test="${section=='R'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="O" >O</option>
				                  	<option value="P">P</option>
				                  	<option value="Q">Q</option>
				                  	<option value="R" selected="selected">R</option>
				                  	<option value="S">S</option>
				                  	<option value="T">T</option>
				                  	<option value="U">U</option>
				                  	<option value="V">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='S'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="S" selected="selected">S</option>
				                  	<option value="T">T</option>
				                  	<option value="U">U</option>
				                  	<option value="V">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='T'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="T" selected="selected">T</option>
				                  	<option value="U">U</option>
				                  	<option value="V">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='U'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="U" selected="selected">U</option>
				                  	<option value="V">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='V'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="V" selected="selected">V</option>
				                  	<option value="W">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='W'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="W" selected="selected">W</option>
				                  	<option value="X">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='X'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="X" selected="selected">X</option>
				                  	<option value="Y">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='Y'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="Y" selected="selected">Y</option>
				                  	<option value="Z">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${section=='Z'}">
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
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
				                  	<option value="Z" selected="selected">Z</option>
				                  	</select>
				                  	</c:when>
				                  	<c:otherwise>
				                  	<select  style="width:220px;"id="inp_id1" name="section" value="${class_section.section}">
				                  	<option value="">-- Select Section --</option>
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
				                  	</c:otherwise>
				                  	</c:choose>
				                  	
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="classsection.section"></form:errors></font></td>
				                    
				                     </tr>
				                     <tr class="row2">
					            	<td valign="middle" align="right" class="input_txt" width="40%"><span class="err">*</span> Services:</td>
				                  	<td valign="top" align="left" class="input_txt" width="60%">
				                  	<c:choose>
				                  	<c:when test="${service=='Attendance'}">
				                  	<select name="service" style="width:220px;"id="service">
				                  	
				                  	<option value="Attendance" selected="selected">Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="None" >None Of These</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${service=='Tracking'}">
				                  	<select name="service" style="width:220px;"id="service">
				                  	<option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" selected="selected">Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="None" >None Of These</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${service=='Both'}">
				                  	<select name="service" style="width:220px;"id="service">
				                  	
				                  	<option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" selected="selected">Both</option>
				                  	<option value="None" >None Of These</option>
				                  	</select>
				                  	</c:when>
				                  	<c:when test="${service=='None'}">
				                  	<select name="service" style="width:220px;"id="service">
				                  	
				                  	<option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="None" selected="selected" >None Of These</option>
				                  	</select>
				                  	</c:when>
				                  	<c:otherwise>
				                  	<select name="service" style="width:220px;"id="service">
				                  	<option value="">--Select Service--</option>
				                  	<option value="Attendance" >Attendance</option>
				                  	<option value="Tracking" >Tracking</option>
				                  	<option value="Both" >Both</option>
				                  	<option value="None" >None Of These</option>
				                  	</select>
				                  	</c:otherwise>
				                  	</c:choose>
				                  	
				                  	<br/><font color="Red" size="+1"><form:errors path="classsection.service"></form:errors></font></td>
				                    
				                     </tr>
				               
				                
                <tr class="row1" >
				              <td valign="top" align="left"></td>
                 
                  <td valign="top" align="justify">
                  <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                  <td><input type="submit" class="btn" value="Save"></td>
                  <td><input type="reset" class="btn" value="Reset" onclick="window.location.href='addclass'"></td> 
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
