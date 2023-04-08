$(document).ready(function(){
  $(".orig, .sic, .abbr").click(function(){
        $(this).hide();
        $(this).next().show();
    });
    $(".reg, .corr, .expan").click(function(){
        $(this).hide();
        $(this).prev().show();
    });
    
    // Correzioni
  $("#correzione").click(function(){
        if ($(".corr").is(":visible")) {
            if ($(".corr").css('background-color') == 'rgb(255, 0, 0)') {
                $(".corr").css('background-color', 'transparent');
                $(".corr").click(function(){
                    $(".sic").css('background-color', 'transparent');
                })
            } else {
                $(".corr").css('background-color', 'red');
                $(".corr").click(function(){
                    $(".sic").css('background-color', 'red');
                })
            }
        
        } if ($(".sic").is(":visible")) {
            if ($(".sic").css('background-color') == 'rgb(255, 0, 0)') {
                $(".sic").css('background-color', 'transparent');
                $(".sic").click(function(){
                    $(".corr").css('background-color', 'transparent');
                })
            } else {
                $(".sic").css('background-color', 'red');
                $(".sic").click(function(){
                    $(".corr").css('background-color', 'red');
                })
            }
        } 
        
    });
  
    $("img.img_class").css("display", "none");
    $("p.desc_img").css("display", "none");

    $("img.img_class:first").css("display", "inline");
    $("p.desc_img:first").css("display", "inline");

    var img=$("img.img_class").toArray();
    var p=$("p.desc_img").toArray();

    var index_foto=0;
    var index_p=0;

    function switchFoto(n){
        index_foto+=n;
        index_p+=n; 
        if(index_foto==img.length && index_p==img.length){
            index_foto=0;
            index_p=0;
        };
        if(index_foto<0 && index_p<0){
            index_foto=img.length-1;
            index_p=img.length-1;
        };
        $("img.img_class").css("display", "none");
        img[index_foto].style.display = "block";

        $("p.desc_img").css("display", "none");
        p[index_p].style.display = "block";
    }
    switchFoto(0);
    
    $("#btn_back").click(function(){
        switchFoto(-1);
    });
    $("#btn_next").click(function(){
        switchFoto(+1);
    });  
})
