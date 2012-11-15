$(document).ready( function (){
	search_friends();
});

function search_friends(){
	$('#search').on('keyup', function(){
		var search = $(this).attr('value');
		var id = $('#user_id').attr('value');
		
		//console.log('*'+search+'*');
		$.ajax({ url: "/friends_search",   type: "GET", data: {search: search, id: id}});		
	});
}