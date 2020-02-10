$(window).ready(function(){
   var next = $('#next');
   var back =$('#back');
   var images = $('.img-div');
   var size = images.length;
   var index = 0;
   
   if(size == 1){
	   next.hide();
	   back.hide();
   }
   images.addClass('d-none');
   function showImage(i){
       images.addClass('d-none');
       var image = images.eq(i);
       image.removeClass('d-none');
   }

   function switchImage(){
    if(index < (size-1)){
      index++;
    }else{
      index = 0;
    } 
    showImage(index);
   }
   showImage(index);
   setInterval(switchImage, 5000);
   back.click(function(){
       if(index <= 0){
           index = size-1;
           showImage(index);
       }else{
           index--;
           showImage(index);
       }
   });
   next.click(function(){
       if(index < (size-1)){
           index++;
           showImage(index);
       }else{
           index = 0;
           showImage(index);
       }
   });
});