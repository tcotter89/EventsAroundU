<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

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
    	<label class="header">Sign In</label><br /><br />
    	<label>Username:</label><input type="text"/><br/>
    	<label>Password:</label><input type="text"/><br /><br />
    	<a href="welcome.jsp"><button>Log In</button></a>
    	<a href="welcome.jsp"><button>Register</button></a>
    </div>
  </body>
</html>
