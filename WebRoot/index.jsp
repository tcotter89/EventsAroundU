<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Events Around U</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Events Around U">
	<link rel="stylesheet" type="text/css" href="master.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  </head>
  
  <body> 
  	<div class="banner">
  		<label>Events Around U</label>
  	</div>
  	<br/>
    <div class="loginBox">
    	<s:form action="Login.action">
            <s:textfield label="Username" name="username" />
            <s:password label="Password" name="password" />
	        <table>
	         <tr>
       	   		<td><s:submit value="Log in"/></td>
	         </tr>
	        </table>
        </s:form>
    </div>
   
    <div class="registerBox">
	   	<s:form action="Register.action">
	   		<s:textfield id="txtUsername" label="Username" name="username" />
	   		<s:label id="lblErrUsername" cssClass="errorMsg"></s:label>
	   		<s:password id="txtPassword" label="Password" name="password" />
	   		<s:label id="lblErrPassword" cssClass="errorMsg"></s:label>
	   		<s:textfield id="txtName" label="Name" name="userrealname" />
	   		<s:label id="lblErrName" cssClass="errorMsg"></s:label>
	   		<s:textfield id="txtEmail" label="Email" name="useremail" />
	   		<s:select label="Gender" 
				headerKey="-1" headerValue="Select Gender"
				list="#{'0':'Male', '1':'Female'}" 
				name="usergender"
				id="ddlGender" 
				value="-1" />
	   		<s:label id="lblErrGender" cssClass="errorMsg"></s:label>
	   		<s:textfield id="txtPhone" label="Phone" name="userphone" />
	   		<s:textfield id="txtAddress" label="Address" name="useraddr" />
	   		<table>
		        <tr>
		       		<td><s:submit id="btnRegister" value="Register"/></td>
		        </tr>
	       </table>
	   	</s:form>
    </div>		
  </body>
<script type="text/javascript">
       $('#btnRegister').click(function () {
            var validinfo = true;
            //Username Validation
            if ($('#txtUsername').val() == "") {
                $('#lblErrUsername').html("Please Enter a Username");
                validinfo = false;
            }
            else if($('#txtUsername').val().length < 4){
                $('#lblErrUsername').html("Please Enter a Username that is at Least 4 Characters");
                validinfo = false;
            }
            else if ($('#txtUsername').val().length > 30) {
                $('#lblErrUsername').html("Please Enter a Username that is 30 Characters or Less");
                validinfo = false;
            }
            else {
                $('#lblErrUsername').html("");
            }
            //Password Validation
            if ($('#txtPassword').val() == "") {
                $('#lblErrPassword').html("Please Enter a Password");
                validinfo = false;
            }
            else if ($('#txtPassword').val().length < 4) {
                $('#lblErrPassword').html("Please Enter a Password that is at Least 4 Characters");
                validinfo = false;
            }
            else if ($('#txtPassword').val().length > 30) {
                $('#lblErrPassword').html("Please Enter a Password that is 30 Characters or Less");
                validinfo = false;
            }
            else {
                $('#lblErrPassword').html("");
            }
            //Name Validation
            if ($('#txtName').val() == "") {
                $('#lblErrName').html("Please Enter in Your Name");
                validinfo = false;
            }
            else if ($('#txtName').val().length > 10) {
                $('#lblErrName').html("Please Only Enter in the First 10 Letters of Your Name");
                validinfo = false;
            }
            else {
                $('#lblErrName').html("");
            }
            //Gender Validation
            if ($('#ddlGender').val() == "-1") {
                $('#lblErrGender').html("Please Select a Gender");
                validinfo = false;
            }
            else {
                $('#lblErrGender').html("");
            }
            
            return validinfo;
        });
</script>  
</html>