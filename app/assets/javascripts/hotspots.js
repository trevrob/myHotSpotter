//= require jquery
///////////////////////////////////MAP STUFF/////////////////////////////////////////////
var map;
var myCenter= new google.maps.LatLng(47.6089, -122.0422);
var LAT;
var LNG;

function initialize()
	{
		var mapProp = 
		{
			center:myCenter,
			zoom:8,
		};
		map = new google.maps.Map(document.getElementById("map_div"),mapProp);
	//////////////Double Click to add HotSpot Icon//////////////////////
		google.maps.event.addListener(map, 'dblclick', function(event) 
		{
			placeMarker(event.latLng);
			LAT = event.latLng.k;
			LNG = event.latLng.a;
		});
		drawMarkers();

	}
	////////////Show Hotspots on Load/////////////////
	function drawMarkers() {
		for (var i=0; i < gon.hotspots.length; i++) 
		{
			var pinImage = new google.maps.MarkerImage("http://www.googlemapsmarkers.com/v1/H/FF0000/FFFFFF/FFFFFF/");
			var latitude = gon.hotspots[i].latitude;
			var longitude = gon.hotspots[i].longitude;
			var myLatlng= new google.maps.LatLng(latitude, longitude);
			var name = gon.hotspots[i].name;
			var description = gon.hotspots[i].description;
			var poster = gon.users[i];
			var created_at = gon.hotspots[i].created_at;
			var marker = new google.maps.Marker({
				icon: pinImage,
			    position: myLatlng,
			    map: map,
			    info: "<div class='row' id='view_info'>"
						  + "<div class='col-md-12'><h3 id='view_name'>"+ name + "</h3></div>"
						  + "</div>"
						  + "<div class='row'>"
						  + "<div class='col-md-12'><p id='view_description'>" + description + "</p></div>"
						  + "</div>"
						  + "<div class='row'>"
						  + "<div class='col-md-12'><p id='view_poster'>~ " + poster + " ~</p></div>"
						  + "</div>"
						  + "<div class='row'>"
						  + "<div class='col-md-12'><p id='view_date'>" + created_at + "</p></div>"
						  + "</div>"
				});
			var infowindow = new google.maps.InfoWindow(
			{
				content: ""
			});

			google.maps.event.addListener(marker, 'mouseover', function() 
			{
				infowindow.setContent(this.info)
				infowindow.open(map,this);
	  		});
			
		};

	}
	///////////Add Hotspot ///////////////////
	function placeMarker(location) 
	{
		var pinImage = new google.maps.MarkerImage("http://www.googlemapsmarkers.com/v1/H/0A0A2A/FF0000/FF0000/");
		var marker = new google.maps.Marker(
		{
			position: location,
			icon: pinImage,
			draggable:true,
   			animation: google.maps.Animation.DROP,
			map: map,
		});
		//////////////////Info Window//////////////////////
		var infowindow = new google.maps.InfoWindow(
		{
			content: "<div id='new_hot_spot'><h4 style='text-align:center'><b><i>Enter New HotSpot</i></b></h4>"
			+ "<form class='form-horizontal' role='form' name='hotspot' enctype= 'multipart/form-data' method='post' action='create' >"
			+ "<input name='authenticity_token' value='<%= form_authenticity_token %>' type='hidden'><div class='form-group'>"
			+ "<input type='hidden' name='latitude' value='"+ location.k +"'><input type='hidden' name='longitude' value='"+ location.A +"'>"
			+ "<div class='col-sm-12'>"
			+ "<input type='text' class='form-control' name='hotspot_name' id='hotspot_name' placeholder='Name of HotSpot'></div></div>"
			+ "<div class='form-group'><div class='col-sm-12'><textarea name='hotspot_description' id='description' class='form-control' rows='6' placeholder='Enter description of HotSpot here...'>"
			+ "</textarea></div></div><div class='form-group'><div class='col-sm-12'><label for='upload'>Upload Picture</label>"
			+ "<input type='file' id='upload' name='pic' ></div></div><div class='form-group'><div class='col-sm-12'>"
			+ "<button type='submit' id='add_hotspot' class='tn btn-default'>Add HotSpot</button></div></div></form></div>" 
		});
		//////////////Double Click to remove Icon//////////////////////
  		google.maps.event.addListener(marker, 'dblclick', function(event) 
  		{
       		this.setMap(null);
        });

		infowindow.open(map,marker);
	}

	google.maps.event.addDomListener(window, 'load', initialize);

/////////////////////////////////////END OF MAP///////////////////////////////////////


