<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("sessUserName", request.getParameter("username"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
  	<jsp:include page="heading.jsp"/> 
    <base href="<%=basePath%>">
    
    <title>Welcome To EAU</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Welcome">
	<link rel="stylesheet" type="text/css" href="master.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
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
      var judgePoint = 0;
      
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
       if(judgePoint == 0){
       	addMarker(event.latLng, map);
    	document.getElementById('latlnginfo').value=event.latLng;
    	judgePoint = 1;
       }
    	
  		});      
  		      
      }
      function addMarker(location, map) {
  		var marker = new google.maps.Marker({
      	position: location,
      	map: map,
      	title:$('#hdnUsername').val()
  		});
  		document.getElementById('username').value=$('#hdnUsername').val();
  		///var title = ${username}.toString();
  		//marker.setTitle("test1");
  		marker.set("editing", false);
    

	    var htmlBox = document.createElement("div");
	    //htmlBox.innerHTML = options.html || "";
	    htmlBox.style.width = "300px";
	    htmlBox.style.height = "100px";
	    
	    var inputBox = document.createElement("input");
	    inputBox.style.width = "300px";
	    inputBox.style.display = "none";
	    //inputBox.text = marker.getTitle();
	
	    var textBox = document.createElement("textarea");
	    //textBox.innerText = options.html || "";
	    textBox.style.width = "300px";
	    textBox.style.height = "100px";
	    textBox.style.display = "none";
	    
	
	    var container = document.createElement("div");
	    container.style.position = "relative";
	    container.appendChild(htmlBox);
	    container.appendChild(inputBox);
	    container.appendChild(textBox);
	    
	
	    var editBtn = document.createElement("button");
	    editBtn.innerText = "Edit";
	    container.appendChild(editBtn);
	    
		var editBtn1 = document.createElement("button");
	    editBtn1.innerText = "Remove";
	    container.appendChild(editBtn1);

	    

	    
	    var infoWnd = new google.maps.InfoWindow({
	      content : container
	    });
	    
	
	    google.maps.event.addListener(marker, "click", function() {
	      infoWnd.open(marker.getMap(), marker);
	    });
	    
	
	    google.maps.event.addDomListener(editBtn, "click", function() {
	      marker.set("editing", !marker.editing);
	    });
	    
	    google.maps.event.addDomListener(editBtn1, "click", function() {
	     removeMarker(marker);
	     judgePoint = 0;
  		 //marker.setMap(null);
        });
        
	
	    google.maps.event.addListener(marker, "editing_changed", function(){ 
	      inputBox.style.display = this.editing ? "block" : "none";
	      textBox.style.display = this.editing ? "block" : "none";
	      htmlBox.style.display = this.editing ? "none" : "block";
	    });
	    
	    google.maps.event.addDomListener(inputBox, "change", function() {
	      marker.setTitle(inputBox.value);
	      document.getElementById('title').value=inputBox.value;
	    });
	
	    google.maps.event.addDomListener(textBox, "change", function(){
	      htmlBox.innerHTML = textBox.value;
	      marker.set("html", textBox.value);
	      document.getElementById('html').value=textBox.value; 
	    });
	    return marker;
	  		map.setCenter(location); 
	  	  google.maps.event.addListener(marker, "html_changed", function(){
	      console.log(this.html);
	    });
  		}
  		
  		function removeMarker(marker){
  		marker.setMap(null);
  		document.getElementById('html').value="";
  		document.getElementById('latlnginfo').value="";
  		document.getElementById('title').value="";
  		document.getElementById('username').value="";
  		}
  		
        //Show create time 
        //document.write(Date())
        
		
		
		google.maps.event.addDomListener(window, 'load', initialize);
	
	</script>
  </head>
  
  <body>
    <div class="message">
    	Welcome ${username}
    </div>
   <input type="hidden" id="hdnUsername" value="${username}" />
    <div id="map_canvas" style="width:100%; height:100%">
    </div>	
    <br />
        <s:form name="marker" action="AddMarker.action" >
		Lat & Lng: <input type="text" id="latlnginfo" name="latlnginfo"/>
		Title: <input type="text" id="title" name="title"/>
		Description: <input type="text" id="html" name="html"/>
		Username: <input type="text" id="username" name="username"/>
			 <tr>
       	   		<td><s:submit value="Log in"/></td>
	         </tr>
		</s:form>

  </body>
</html>
