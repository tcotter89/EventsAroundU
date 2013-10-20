<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loadedUsername = session.getAttribute("username").toString();
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
	
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 80%; margin: 0; padding: 0 }
      #map_canvas { height: 80% }
	</style>
    <script type="text/javascript"
       src="https://maps.google.com/maps/api/js?sensor=false&language=en">
    </script>
    <script type="text/javascript">
      function initialize() {
      var startlatlng=new google.maps.LatLng(32.732556, -97.113972);
        var mapOptions = {
          center: startlatlng,
          zoom: 18,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
            
        google.maps.event.addListener(map, 'click', function(event) {
       // alert(event.latLng);
    	addMarker(event.latLng, map);
  		});
            
      }
      function addMarker(location, map) {
      alert("1");
  		var marker = new google.maps.Marker({
      	position: location,
      	map: map
      	//title:username
  		});
  		map.setCenter(location);
  		
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
    </script>
	
  </head>
  
  <body>
    <div class="message">
    	Welcome ${username}
    </div>
    <div id="map_canvas" style="width:100%; height:100%">
    </div>
    <br />

  </body>
</html>
