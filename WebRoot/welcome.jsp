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
    
    <title>Welcome To EAU</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Welcome">
	<link rel="stylesheet" type="text/css" href="master.css">

	<style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 70%;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
    var map;
	function initialize() {
  	var mapOptions = {
    	zoom: 18,
    	center: new google.maps.LatLng(32.732556, -97.113972),
    	mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
 	 map = new google.maps.Map(document.getElementById('map-canvas'),
      	mapOptions);
	}

	google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  
  <body>
    <div class="message">
    	Welcome User
    </div>
        <div id="map-canvas"></div>
   <s:form name="marker" action="AddMarker.action" />

   Description:<input type="text" id="markerinfo" name="markerinfo"/>

   <s:submit value="Submit" theme="simple"/>
  </body>
</html>
