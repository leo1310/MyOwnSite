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
  $.ajax({ url: "/status_active",   type: "GET"});                 
	setInterval(function(){  		   
    /*console.log("writing dateTime");   */
		$.ajax({ url: "/status_active",   type: "GET"});					       
		
	},10000);  
});

