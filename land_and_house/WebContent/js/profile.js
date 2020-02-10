$(window).ready(function(){
	var editButton = $('.edit');
	var cancel =$('.cancel');

	editButton.click(function(e){
		e.preventDefault();
		var target = $(this).attr('id');
		var target = $("*[aria-labelledby="+target+"]");
		if(target.is(':visible')){
			target.hide("slow");
		}else{
			target.show("slow");
		}
	});

	cancel.click(function(e){
		e.preventDefault();
		$(this).parents('tr').hide('slow');
	});

});