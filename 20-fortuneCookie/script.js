console.log("linked")


//JQuery
$(document).ready( function(){

    $('img').hover(function() {
            $(this).attr("src", $(this).attr('data-alt-src'))
        }, function() {
            $(this).attr("src", "img/cookie.jpg");
        });
      
})
        
        

