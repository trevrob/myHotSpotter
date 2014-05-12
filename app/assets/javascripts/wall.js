//= require jquery

///////////////////////////////Notification/////////////////////////////////////////
$(document).ready(function()
{
	$(document).on('submit','.form-horizontal',function()
	{	
		var form = $(this);
		    $.post( form.attr('action'),
     		 form.serialize(),
     		 function(data){
     		 	$('#wall').prepend(data);
     		 });
		return false;
	});

	// for (var i=0; i < gon.hotspots.length; i++) 
	// {
	// 	var name = gon.hotspots[i].name;
	// 	var description = gon.hotspots[i].description;
	// 	var poster = gon.users[i];
	// 	var created_at = gon.hotspots[i].created_at;
	// 	$( "#wall" ).append( "<div id='post'><h4>" + name + "</h4>"
	// 		+ "<p>" + description + "</p>"
	// 		+ "<p><b>" + poster + "</b></p>"
	// 		+ "<p><i>" + created_at + "</i></p></div>" );
	// }

})

