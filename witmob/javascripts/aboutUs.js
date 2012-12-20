/**
 * Created with JetBrains WebStorm.
 * User: mrj
 * Date: 12-11-29
 * Time: 下午12:07
 * To change this template use File | Settings | File Templates.
 */
$(".menu div:nth-child(3)").bind('click', renderUs);
function renderUs(){
    $('#home').hide();
    $('#project_show').hide();
    $('#about_us').show();
    $(".menu div").removeAttr("style");
//    $('.menu>:nth-child(3)').css({'background-color': '#a9a9a9'});
    $('.menu>div:nth-child(3) font').css({'color': '#000000'});
    $('.menu>div:nth-child(1) font').css({'color': '#a9a9a9'});
    $('.menu>div:nth-child(2) font').css({'color': '#a9a9a9'});
    bindMenuHover(3);
    shadowAboutUs();
    setTimeout("distinctAboutUs(1)",500);
    setTimeout("distinctAboutUs(2)",900);
    setTimeout("distinctAboutUs(3)",1300);
}
function distinctAboutUs(index){
    var indexCh;
    switch (index){
        case 1: indexCh='first';break;
        case 2: indexCh='two';break;
        case 3: indexCh='third';break;
    }
    $(".about_background_image_down:eq("+(index-1)+")").css({
        'opacity': '1',
        '-webkit-transition':'all 0.5s ease 0s',
        '-o-transition':'all 0.5s ease 0s',
        '-moz-transition':'all 0.5s ease 0s',
        '-ms-transition':'all 0.5s ease 0s'
    });
    $('.'+indexCh+'_about_us font').css({
        'opacity': '1',
        '-webkit-transition':'all 0.5s ease 0s',
        '-o-transition':'all 0.5s ease 0s',
        '-moz-transition':'all 0.5s ease 0s',
        '-ms-transition':'all 0.5s ease 0s'
    });
    $(".about_background_image_up:eq("+(index-1)+")").css({
        'opacity': '0',
        '-webkit-transition':'all 0.5s ease 0s',
        '-o-transition':'all 0.5s ease 0s',
        '-moz-transition':'all 0.5s ease 0s',
        '-ms-transition':'all 0.5s ease 0s'
    });
}
function  shadowAboutUs(){
    $(".about_background_image_down").css({'opacity': '0'});
    $(".about_background_image_up").css({'opacity': '1'});
    $('#about_us font').css({'opacity': '0.3'});
}