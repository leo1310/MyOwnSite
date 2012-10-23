	$(document).ready( function (){
		$('a.about').on('click', function( e ){		
			var href = $(this).attr('href');
			$('div#main').load(href + ' .containers');		
			e.preventDefault();		
		});

		$('#our_partners').on('click', function(){
			setTimeout(function(){
				$('#main > .containers > .partner').find('.describe').each(function(){ $(this).hide() });							
			}, 50);
			
			setTimeout(function(){
				console.log($('#company1'));
				$('#company1').bind('click', function(){					
					console.log('good');
				});			
			},1000);
		});		

	});
	/*(function() {	
		$('#main > .containers > .partner').find('#describe').each(function(){ $(this).hide() });		
		console.log($('#main > .containers > .partner'));

		$('.partner').find('#con').each(function(){
			$(this).bind('click', function(){					
	  			if ( $(this).next('#describe').is(':visible') ) {
					$(this).next('#describe').fadeOut(100,function(){$(this).hide()});			
				}
				else {
					$(this).next('#describe').each(function(){$(this).hide()});
					$(this).next('#describe').fadeIn(300,function(){$(this).show()});				
				}
	  	
	  	});	  
	});
	  
	})();*/