/*$(window).unload( function () { alert("Bye now!"); } );*/
/*window.onbeforeunload = function (event) {
  var message = 'Sure you want to leave?';
  if (typeof event == 'undefined') {
    event = window.event;
  }
  if (event) {
    event.returnValue = message;
  }
  return window.location.protocol + " " +window.location.host;
}*/

$(document).ready( function (){	
	setInterval(function(){		   
    console.log("writing dateTime");   
		$.ajax({ url: "/pages/status_active",   type: "GET", data:{id: 1}});					       
		
	},10000);  
});

