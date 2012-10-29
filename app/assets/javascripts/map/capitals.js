$(document).ready( function (){
  getTitle('.capital_capcha');
  getTitle('.capital_capcha_right');
});

function getTitle(ul_class){
  $(''+ ul_class).find('li').find('a').on('click', function(){
    var title = $(this).text();
    $('#center > h2').text(title);    
  });
}