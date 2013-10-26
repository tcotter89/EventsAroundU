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

  		var marker = new google.maps.Marker({
      	position: location,
      	map: map
      	//title:username
  		});
  		marker.set("editing", false);
    

    var htmlBox = document.createElement("div");
    //htmlBox.innerHTML = options.html || "";
    htmlBox.style.width = "300px";
    htmlBox.style.height = "100px";
    

    var textBox = document.createElement("textarea");
    //textBox.innerText = options.html || "";
    textBox.style.width = "300px";
    textBox.style.height = "100px";
    textBox.style.display = "none";
    

    var container = document.createElement("div");
    container.style.position = "relative";
    container.appendChild(htmlBox);
    container.appendChild(textBox);
    

    var editBtn = document.createElement("button");
    editBtn.innerText = "Edit";
    container.appendChild(editBtn);
    

    var infoWnd = new google.maps.InfoWindow({
      content : container
    });
    

    google.maps.event.addListener(marker, "click", function() {
      infoWnd.open(marker.getMap(), marker);
    });
    

    google.maps.event.addDomListener(editBtn, "click", function() {
      marker.set("editing", !marker.editing);
    });
    

    google.maps.event.addListener(marker, "editing_changed", function(){
      textBox.style.display = this.editing ? "block" : "none";
      htmlBox.style.display = this.editing ? "none" : "block";
    });
    

    google.maps.event.addDomListener(textBox, "change", function(){
      htmlBox.innerHTML = textBox.value;
      marker.set("html", textBox.value);
    });
    return marker;
  		map.setCenter(location); 
  	  google.maps.event.addListener(marker, "html_changed", function(){
      console.log(this.html);
    });
  		}


		google.maps.event.addDomListener(window, 'load', initialize);

    </script>
	
  </head>
  
  <body>
    <div class="message">
    	Welcome User
    </div>
    <div id="map_canvas" style="width:100%; height:100%">
    </div>	
    <br />

  </body>
</html>
