<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>Edit Bus Details</title>
</head>

<body>
	<form method="POST" action="updateorg">
<script language="Javascript" type="text/javascript">
 
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 45 && charCode < 47) || (charCode > 31 && charCode < 33))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
 
    </script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2>Edit Organization Information</h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${orgregistrationform.orgregistration[0]}" var="orgRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            <tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Registration Number :</td>
				                  <td valign="top" align="left" class="input_txt"><input type="hidden" name="registration_no" value=" ${orgRegistration.registration_no}">
				                 	  ${orgRegistration.registration_no}</td>
				                  
				                </tr>
				                 <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Organization Id :</td>
				                 <td valign="top" align="left" class="input_txt">
				                 <input type="text" class="org_input_txtbx_height1" type="hidden" id="inp_orgid_validate" name="org_id" value="${orgRegistration.org_id}"/>
 										
 				                  </td>
				                </tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Organization Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                	 <input type="text" class="org_input_txtbx_height1" id="inp_id" name="org_name" onkeypress="return onlyAlphabets(event,this);" value="${orgRegistration.org_name}"/>                 
								 </td>
				                </tr>
				                 <tr class="row1">
				                  <td valign="middle" align="right" class="input_txtlabel"><span class="err">*</span> Is Active :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  <%-- <input type="text" class="org_input_txtbx_height1" id="inp_id" name="is_active" value="${orgRegistration.is_active}"/> --%>

				                  
				                  <c:choose>
				                  <c:when test="${orgRegistration.is_active==1}">
				                  <input type="radio" name="is_active" value="1" checked="checked"/>Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0"/>No&nbsp;&nbsp;

				                  </c:when>
				                   <c:when test="${orgRegistration.is_active==0}">
				                  <input type="radio" name="is_active" value="1" />Yes&nbsp;&nbsp;
									<input type="radio" name="is_active" value="0" checked="checked"/>No&nbsp;&nbsp;
				                  </c:when>
				                  </c:choose>
				                  
				                  </td>
				                </tr>
				                
				          
				                  <tr class="row2">
				                   <td valign="middle" align="right" class="input_txt"><input id="inp_id" type="submit" class="submit_btn1" value="Update" ></td>
				                   
				                    
				                    <td valign="middle" align="left" class="input_txt"><input type="reset" class="submit_btn1" value="Cancel"  onclick="window.location.href='vieworg'"></td>
				                  </tr>
				                  </table>
				                 
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </body>
				          </html>				          