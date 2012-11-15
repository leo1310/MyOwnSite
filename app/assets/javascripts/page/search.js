$(document).ready(function(){
	search_users();
	
});

function search_users(){
	$('#search').on('keyup', function(){
		var search = $(this).attr('value');		
		
		//console.log('*'+search+'*');
		$.ajax({ url: "/search_user",   type: "GET", data: {search: search}});		
	});
}