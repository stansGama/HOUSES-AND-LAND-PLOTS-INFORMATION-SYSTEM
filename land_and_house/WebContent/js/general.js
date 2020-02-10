$(window).ready(function(){
	
	











	/*Script for addproperty page start*/
	var landInfo = $('.land-info');
	var houseInfo = $('.house-info');
	var propertyType = $('#type');
	var next = $('#next-btn');
	var back = $('#back-btn');
	
	next.click(function(){
		
		if( $('option:selected').val() ==="land"){
			back.removeClass('d-none');
			next.addClass('d-none');
			$('input:submit').removeClass('d-none');
			$('.property-section,.location-section').addClass('d-none');
			landInfo.removeClass('d-none');
			if(!houseInfo.hasClass('d-none')){
				houseInfo.addClass('d-none');
			}
			
		}else if( $('option:selected').val() === "house"){
			back.removeClass('d-none');
			$('input:submit').removeClass('d-none');
			next.addClass('d-none');
			$('.property-section,.location-section').addClass('d-none');
			houseInfo.removeClass('d-none');
			if(!landInfo.hasClass('d-none')){
				landInfo.addClass('d-none');
			}
		}
	});
	
	back.click(function(){
		back.addClass('d-none');
		next.removeClass('d-none');
		houseInfo.addClass('d-none');
		landInfo.addClass('d-none');
		$('input:submit').addClass('d-none');
		$('.property-section,.location-section').removeClass('d-none');
	})
	

	/*Search button and advanced search script*/
	$('#search-btn').click(function(e){
		e.preventDefault();
		var target = $('#advance-search');
		if(target.is(':visible')){
			target.hide('slow');
		}else{
			target.show('slow');
		}
	});

	$('#property-type-search').change(function(e){
		if ($('#property-type-search').children('option:selected').val() ==="house") {
			$('#house-features-search').show('slow');
		}else if ($('#property-type-search').children('option:selected').val() ==="All") {
			$('#house-features-search').show('slow');
		} else{
			$('#house-features-search').hide('slow');
		}
		
	});
	
	
});