$(document).ready(function(){
  $(".orig, .sic, .abbr").click(function(){
        $(this).hide();
        $(this).next().show();
    });
    $(".reg, .corr, .expan").click(function(){
        $(this).hide();
        $(this).prev().show();
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
