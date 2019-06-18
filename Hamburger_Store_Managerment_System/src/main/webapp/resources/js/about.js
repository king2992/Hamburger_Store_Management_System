
$(document).on("click","#button",function(){
	$('.memberContainer').fadeOut(); 
/*	$('.mainContainer').css('display','block');
	$('.mainContainer').css('opacity','1');*/
	var typingBool = false;

    var typingIdx=0;

    var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다 

    typingTxt=typingTxt.split(""); // 한글자씩 자른다. 

  
if(typingBool==false){ // 타이핑이 진행되지 않았다면 
       typingBool=true; 
       
       var tyInt = setInterval(typing,100);// 반복동작
}     
     function typing(){ 
       if(typingIdx<typingTxt.length){ // 타이핑될 텍스트 길이만큼 반복 
       
         $(".typing").append(typingTxt[typingIdx]);
           
           // 한글자씩 이어준다. 
         typingIdx++; 
       } else{ 
         clearInterval(tyInt); //끝나면 반복종료 
       } 
     }

 var typingBool2 = false;

    var typingIdx2=0;

    var typingTxt2 = $(".typing-txt2").text(); // 타이핑될 텍스트를 가져온다 

    typingTxt2=typingTxt2.split(""); // 한글자씩 자른다. 

  
if(typingBool2==false){ // 타이핑이 진행되지 않았다면 
       typingBool2=true; 
       
       var tyInt2 = setInterval(typing2,100);// 반복동작
}     
     function typing2(){ 
       if(typingIdx2<typingTxt2.length){ // 타이핑될 텍스트 길이만큼 반복 
       
         $(".typing2").append(typingTxt2[typingIdx2]);
           
           // 한글자씩 이어준다. 
         typingIdx2++; 
       } else{ 
         clearInterval(tyInt2); //끝나면 반복종료 
       } 
     };
});




           $(document).ready(function() {
    $(window).scroll( function(){
        $('.slideinleft').each( function(i){
            
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element ){
                $(this).animate({'margin-left':'250px'},1000);
                /*$(this).css('animation-name','slide');*/
            }
            
        }); 
      
    });
});
           $(document).ready(function() {
    $(window).scroll( function(){
        $('.slideinright').each( function(i){
            
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element ){
                $(this).animate({'margin-left':'450px'},1000);
                /*$(this).css('animation-name','slide');*/
            }
            
        }); 
      
    });
});

    