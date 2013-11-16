<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
  	<jsp:include page="heading.jsp"/>  
    <base href="<%=basePath%>">
    
    <title>EAU Profile</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="master.css">

  </head>
  
  <body>
    <div class="loginBox">
    	<s:form action="EditProfile.action">
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
		       		<td><s:submit id="btnEditProfile" value="EditProfile"/></td>
		        </tr>
	       </table>
        </s:form>
    </div>
  </body>
</html>
