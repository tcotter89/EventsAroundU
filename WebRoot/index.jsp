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
    		<s:textfield label="Username" name="username" />
    		<s:password label="Password" name="password" />
    		<s:textfield label="Email" name="useremail" />
    		<s:textfield label="Gender" name="usergender" />
    		<s:textfield label="Phone" name="userphone" />
    		<s:textfield label="Address" name="useraddr" />
    	<table>
           <tr>
           <td><s:submit value="Register"/></td>
           </tr>
        </table>
    	</s:form>
    </div>		
  </body>
</html>
