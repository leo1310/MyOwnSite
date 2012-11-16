$(document).ready(function(){
	search_users();
	selectRegion();
	
});

function search_users(){
	$('#search').on('keyup', function(){
		var search = $(this).attr('value');		
		
		//console.log('*'+search+'*');
		$.ajax({ url: "/search_user",   type: "GET", data: {search: search}});		
	});
}

function selectRegion(){
	$('#country_name').on('change', function(){
		var country_id = $(this).find('option:selected').attr('id');

		$.ajax({ url: "/show_cities_country",   type: "GET", data: {country_id: country_id}});							

		setTimeout(function(){
			$('#city_name').on('change', function(){
				var city_id = $(this).find('option:selected').attr('id');
				
				if (city_id === undefined ){
					var capital_id = $(this).find('option:selected').attr('cid');
					console.log('Capital '+capital_id);
					$.ajax({ url: "/show_users_capital",   type: "GET", data: {capital_id: capital_id}});							
				}
				else if (city_id === '0'){
					console.log('Country '+country_id);
					$.ajax({ url: "/show_users_city",   type: "GET", data: {country_id: country_id}});
				}
				else{
					console.log('City '+city_id);
					$.ajax({ url: "/show_users_city",   type: "GET", data: {city_id: city_id}});
				}				
			});	
		}, 200);
	});	
}