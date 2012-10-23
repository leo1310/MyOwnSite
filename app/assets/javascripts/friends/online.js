$(document).ready( function (){
	var count = $('#online_users').val();

	if((count === '1')||(count === '21')||(count === '31')||(count === '41')||(count === '51')||(count === '61')||(count === '71')||(count === '81')||(count === '91')){
		$('#count_friends_online').before('У Вас '+count+' друг онлайн');
	}
	else if((count === '2')||(count === '3')||(count === '4')||(count === '22')||(count === '23')||(count === '24')||(count === '32')||(count === '33')||(count === '34')||(count === '42')||(count === '43')||(count === '44')||(count === '52')||(count === '53')||(count === '54')||(count === '62')||(count === '63')||(count === '64')){
		$('#count_friends_online').before('У Вас '+count+' другa онлайн');
	}
	else {
		$('#count_friends_online').before('У Вас '+count+' друзів онлайн');
	}
	
});