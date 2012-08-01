$(document).ready(function() {
	var arr = ["National Traditions Of Each Country","Structure Of The Planet", "Mountains, Rivers, Plains and Sea", "The World Of Geographic"];    	

var i = 0;
change_title(arr, i);
slideshow("baner", 10000);
slideshow("baner2", 11000);
slideshow("baner3", 12000);
});

function change_title(arr, i){	
	setInterval(function(){								
		$('#title > h1').text(arr[i])
		if(i<4){
			i ++;
		}
		else{
			i = 0;
		}
		console.log(i);		
	},12000);
}

function slideshow(str, time){
	var sliderUL = $('div#'+str).css('overflow','hidden').children('ul'),
		imgs = sliderUL.find('img'),
		imgWidth = imgs[0].width,  //600
		imgsLen = imgs.length, //4
		count = 1,
		totalImgsWidth = imgsLen * imgWidth; //2400	

		setInterval(function(){						
			loc = imgWidth; //600		

			if(count < 5){							
				count++
			} 
			else if(count === imgsLen){
				count = 1;
				loc = 0;
			}
			transition(sliderUL, loc);					
		},time);
}

function transition(container, loc){
		var unit;

		if(loc !== 0){
			unit = '-='
		}
		container.animate({
			'margin-left': unit ? (unit + loc) : loc
		})
}