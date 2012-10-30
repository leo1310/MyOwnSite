$(document).ready( function (){
  getTitle('.city_capcha');
  getTitle('.city_capcha_right');
	$('#center').on('mousedown', function(event){
		if (document.getSelection()){
			var txt = document.getSelection();
			console.log(txt);
		}
		else{
			console.log('no good');			
		}
	});
});

function getTitle(ul_class){
  $(''+ ul_class).find('li').find('a').on('click', function(){
    var title = $(this).text();
    $('#center > h2').text(title);    
  });
}