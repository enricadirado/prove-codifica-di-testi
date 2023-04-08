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
  
  // Normalizzazioni
       $("#normalizzazione").click(function(){
        if ($(".reg").is(":visible")) {
            if ($(".reg").css('background-color') == 'rgb(0, 128, 0)') {
                $(".reg").css('background-color', 'transparent');
                $(".reg").click(function(){
                    $(".orig").css('background-color', 'transparent');
                })
            } else {
                $(".reg").css('background-color', 'green');
                $(".reg").click(function(){
                    $(".orig").css('background-color', 'green');
                })
            }
        
        } if ($(".orig").is(":visible")) {
            if ($(".orig").css('background-color') == 'rgb(0, 128, 0)') {
                $(".orig").css('background-color', 'transparent');
                $(".orig").click(function(){
                    $(".reg").css('background-color', 'transparent');
                })
            } else {
                $(".orig").css('background-color', 'green');
                $(".orig").click(function(){
                    $(".reg").css('background-color', 'green');
                })
            }
        } 
        
    });
  
  // Abbreviazioni
        $("#abbreviazione").click(function(){
            if ($(".abbr, .abbr_1").is(":visible")) {
                if (($(".abbr").css('background-color') == 'rgb(30, 144, 255)') && ($(".abbr_1").css('background-color') == 'rgb(30, 144, 255)')){
                    $(".abbr").css('background-color', 'transparent');
                    $(".abbr_1").css('background-color', 'transparent');
                    /*se è blu e clicco la parola resta blu*/
                    $(".abbr").click(function(){
                        $(".expan").css('background-color', 'transparent');
                    })
                } else {
                    $(".abbr").css('background-color', 'DodgerBlue');
                    $(".abbr_1").css('background-color', 'DodgerBlue');
                    $(".abbr").click(function(){
                        $(".expan").css('background-color', 'DodgerBlue');
                    })
                }
            
            } if ($(".expan").is(":visible")) {
                if ($(".expan").css('background-color') == 'rgb(30, 144, 255)') {
                    $(".expan").css('background-color', 'transparent');
                    $(".expan").click(function(){
                        $(".abbr").css('background-color', 'transparent');
                    })
                } else {
                    $(".expan").css('background-color', 'DodgerBlue');
                    $(".expan").click(function(){
                        $(".abbr").css('background-color', 'DodgerBlue');
                    })
                }
            } 
            
        });
  
    //Cancellature
     $("#cancellatura").click(function(){
        if ($(".del").is(":visible")) {
            $(".del").hide();   
        }else{
            $(".del").show();
            $(".del").css('background-color', 'violet');
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
