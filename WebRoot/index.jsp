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
	
	   		<s:textfield id="Username" label="Username" name="username" />
	   		<s:label id="UsernameError" cssClass="errorMsg"></s:label>
	   		<s:password id="Password" label="Password" name="password" />
	   		<s:label id="PasswordError" cssClass="errorMsg"></s:label>
	   		<s:textfield id="Name" label="Name" name="userrealname" />
	   		<s:label id="NameError" cssClass="errorMsg"></s:label>
	   		<s:textfield label="Email" name="useremail" />
	   		<s:textfield label="Gender" name="usergender" />
	   		<s:textfield label="Phone" name="userphone" />
	   		<s:textfield label="Address" name="useraddr" />
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
            if ($('#Username').val() == "") {
                $('#UsernameError').html("Please Enter a Username");
                validinfo = false;
            }
            else if($('#Username').val().length < 4){
                $('#UsernameError').html("Please Enter a Username that is at Least 4 Characters");
                validinfo = false;
            }
            else if ($('#Username').val().length > 30) {
                $('#UsernameError').html("Please Enter a Username that is 30 Characters or Less");
                validinfo = false;
            }
            else {
                $('#UsernameError').html("");
            }
            //Password Validation
            if ($('#Password').val() == "") {
                $('#PasswordError').html("Please Enter a Password");
                validinfo = false;
            }
            else if ($('#Password').val().length < 4) {
                $('#PasswordError').html("Please Enter a Password that is at Least 4 Characters");
                validinfo = false;
            }
            else if ($('#Password').val().length > 30) {
                $('#PasswordError').html("Please Enter a Password that is 30 Characters or Less");
                validinfo = false;
            }
            else {
                $('#PasswordError').html("");
            }
            //Name Validation
            if ($('#Name').val() == "") {
                $('#NameError').html("Please Enter in Your Name");
                validinfo = false;
            }
            else if ($('#Name').val().length > 10) {
                $('#NameError').html("Please Only Enter in the First 10 Letters of Your Name");
                validinfo = false;
            }
            else {
                $('#NameError').html("");
            }
            return validinfo;
        });
</script>  
</html>