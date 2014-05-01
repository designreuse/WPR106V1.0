<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<title>Edit Bus Details</title>
</head>
<body>
	<form method="POST" action="update_bus">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>
        <td valign="top" align="left">
        	<div> 
        	<div class="headings altheading">
	              <h2 align="center" >Editing Bus Information<br></b></h2>
	       </div></div> 
	       <div class="contentbox">
	        <c:set value="${busRegistrationForm.busregistration[0]}" var="BusRegistration"/>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                            <tr class="row2">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Bus Id :</td>
				                  <td valign="top" align="left" class="input_txt"><input type="hidden" name="bus_id" value=" ${BusRegistration.bus_id}">
				                 	  ${BusRegistration.bus_id}</td>
				                  
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>GPS Id :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="input_txtbx1" id="inp_id" name="gps_id" value="${BusRegistration.gps_id}"/>
				                  </td>
				                </tr>
				                 <tr class="row2">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Driver Id :</td>
				                  <td valign="top" align="left" class="input_txt">
				                 	 <input type="text" class="input_txtbx1" id="inp_id" value="${BusRegistration.driver_id}" name="driver_id" />
				                  </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Assistant Driver Id :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="input_txtbx1" id="inp_id" name="asst_driver_id" value="${BusRegistration.asst_driver_id}"/>
				                  </td>
				                </tr>
				                 <tr class="row2">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Start Time :</td>
				                  <td valign="top" align="left" class="input_txt">
				                 	 <input type="text" class="input_txtbx1" id="inp_id" value="${BusRegistration.start_time}" name="start_time" />
				                  </td>
				                </tr>
				                <tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>End Time :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="input_txtbx1" id="inp_id" name="end_time" value="${BusRegistration.end_time}"/>
				                  </td>
				                </tr>
				          </table>
				           <table align="right">
				                  <tr>
				                   <td><input type="submit" class="submit_btn" value="Update" ></td>
				                   <td>&nbsp;&nbsp;</td>
				                    
				                    <td><input type="reset" class="submit_btn" value="Cancel"  onclick="window.location.href='viewbus'"></td>
				                  </tr>
				                  </table>
				          </div>
				          </td>
				          </tr>
				          </table>
				          </form>
				          </body>
				          </html>				          