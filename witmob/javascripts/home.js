/**
 * Created with JetBrains WebStorm.
 * User: mrj
 * Date: 12-11-28
 * Time: 下午1:01
 * To change this template use File | Settings | File Templates.
 */
$(".menu div:nth-child(1)").bind('touchstart', renderHome);
$('#about_us').hide();
$('#home').show();
$('#project_show').hide();
bindMenuHover(1);


function loadURL(url) {
    var iFrame;
    iFrame = document.createElement("iframe");
    iFrame.setAttribute("src", url);
    iFrame.setAttribute("style", "display:none;");
    iFrame.setAttribute("height", "0px");
    iFrame.setAttribute("width", "0px");
    iFrame.setAttribute("frameborder", "0");
    document.body.appendChild(iFrame);
    // 发起请求后这个iFrame就没用了，所以把它从dom上移除掉
    iFrame.parentNode.removeChild(iFrame);
    iFrame = null;
}

$('.txt_email').bind('touchstart',function(){
    window.location='mailto:sales@witmob.com?subject=To witmob&body=Hello!';
}).hover(function(){$('.txt_email').css({'background-color': '#a9a9a9'})},function(){$(".txt_email").removeAttr("style");});
$('.txt_address').bind('touchstart',function(){
//    loadURL("youdao:abc");
    $('<div class="company_map"><div class="map_area_shadow"></div></div>').appendTo('#witmob');
    $('<div class="mapArea"><div class="navigationBar">' +
        '<button class="resetButton" ><font size="4" face="微软雅黑" colr="#000000">公司地址</font></button>' +
        '<img src="images/cancel_img.png" style="position:absolute;left: 770px;top: 10px;"></div><div id="map"></div></div>').appendTo('.company_map');
    showMap();
    $('.navigationBar>img').bind('touchstart',function(){$('.company_map').remove();})
        .hover(function(){$('.navigationBar>img').attr("src","images/cancel_hover_img.png")},
               function(){$('.navigationBar>img').attr("src","images/cancel_img.png")});
}).hover(function(){$('.txt_address').css({'background-color': '#a9a9a9'})},function(){$(".txt_address").removeAttr("style");});
function bindMenuHover(index){
    for(var i=1;i<4;i++){
        $(".menu div:nth-child("+i+")").unbind("touchover").unbind("touchout");
        if(i!=index){
            $(".menu div:nth-child("+i+")").bind('touchover',{index:i}, deepenColor)
                .bind('touchout',{index:i}, shallowColor);
        }
    }
    function deepenColor(evt){$(".menu div:nth-child("+evt.data.index+")>font").css({color:'#000000'})}
    function shallowColor(evt){$(".menu div:nth-child("+evt.data.index+")>font").css({color:'#a9a9a9'})}
}
function renderHome(){
    $('#home').show();
    $(".menu div").removeAttr("style");
//    $('.menu>:nth-child(1)').css({'background-color': '#dcdcdc'});
    $('.menu>div:nth-child(1) font').css({'color': '#000000'});
    $('.menu>div:nth-child(2) font').css({'color': '#a9a9a9'});
    $('.menu>div:nth-child(3) font').css({'color': '#a9a9a9'});
    bindMenuHover(1);
    $('#about_us').hide();
    $('#project_show').hide();
    shadowAboutUs();
}

var homeImageIndex = 1;
var imageClass = ['roll_ipad', 'roll_iphone', 'roll_android_phone', 'roll_android_pad'];
roll(2);
var rollInterval = setInterval("roll(2)", 12000);
var a, b, c, d, e;
$(".roll_image img").bind('touchover', mouseover_image)//注意函数名后面没有括号()
    .bind('touchout', mouseout_image).bind('touchstart', click_image);
function mouseover_image() {
//    console.log(homeImageIndex);
    clearTimer();
    $('.roll_image img').hide();
    showImage(homeImageIndex)
}
function mouseout_image() {
    $('.roll_image img').hide().show().css({opacity:0,
        '-webkit-transform':'scale(0.1)',
        '-o-transform':'scale(0.1)',
        '-moz-transform':'scale(0.1)',
        '-ms-transform':'scale(0.1)'
    });
//    console.log(homeImageIndex);
    roll(homeImageIndex);
    rollInterval = setInterval("roll('" + homeImageIndex + "')", 12000);
}
function click_image() {
    var index = homeImageIndex + 1;
    if (index > 4 || index < 1) {
        index = 1
    }
    $('.' + imageClass[index - 1]).show();
    $('.' + imageClass[homeImageIndex - 1]).css({
        'opacity':'0',
        '-webkit-transform':'translate(500px, 0)',
        '-o-transform':'translate(500px, 0)',
        '-moz-transform':'translate(500px, 0)',
        '-ms-transform':'translate(500px, 0)',
        '-webkit-transition':'all 0.5s ease 0s',
        '-o-transition':'all 0.5s ease 0s',
        '-moz-transition':'all 0.5s ease 0s',
        '-ms-transition':'all 0.5s ease 0s'
    });
    setTimeout('MoveLeft("' + imageClass[homeImageIndex - 1] + '")', 500);
    setTimeout("MoveShow('" + imageClass[index - 1] + "')", 300);
    homeImageIndex = index;
}
function showImage(index) {
    if (index > 4 || index < 1) {
        index = 1
    }
    homeImageIndex = index;
    $('.' + imageClass[index - 1]).show().css({
        'opacity':'1',
        '-webkit-transform':'scale(1) ',
        '-o-transform':'scale(1) ',
        '-moz-transform':'scale(1) ',
        '-ms-transform':'scale(1) '
    });
}
function roll(index) {
    var indexClass = [];
    for (var i = 0; i < 4; i++) {
        if (index > 4 || index < 1) {
            index = 1
        }
        indexClass.push(imageClass[index - 1]);
        index++;
    }
//    console.log(indexClass);
    rollOneImage(indexClass[0]);
    c = setTimeout("rollOneImage('" + indexClass[1] + "')", 3000);
    d = setTimeout("rollOneImage('" + indexClass[2] + "')", 6000);
    e = setTimeout("rollOneImage('" + indexClass[3] + "')", 9000);
}

function rollOneImage(className) {
    homeImageIndex = judgeIndex(className);
    MoveShow(className);
    var right = 'MoveRight("' + className + '")';
    var left = 'MoveLeft("' + className + '")';
    a = setTimeout(right, 2500);
    b = setTimeout(left, 3500);
}
function MoveShow(className) {
    $('.' + className).css({
        'opacity':'1',
        '-webkit-transform':'scale(1,1)',
        '-o-transform':'scale(1,1)',
        '-moz-transform':'scale(1,1)',
        '-ms-transform':'scale(1,1)',
        '-webkit-transition':'all 0.5s ease 0s',
        '-o-transition':'all 0.5s ease 0s',
        '-moz-transition':'all 0.5s ease 0s',
        '-ms-transition':'all 0.5s ease 0s'
    });
}
function MoveRight(className) {
    $('.' + className).css({
        'opacity':'0',
        '-webkit-transform':'translate(500px, 0)',
        '-o-transform':'translate(500px, 0)',
        '-moz-transform':'translate(500px, 0)',
        '-ms-transform':'translate(500px, 0)',
        '-webkit-transition':'all 1s ease 0s',
        '-o-transition':'all 1s ease 0s',
        '-moz-transition':'all 1s ease 0s',
        '-ms-transition':'all 1s ease 0s'
    });
}
function MoveLeft(className) {
    $('.' + className).css({
        '-webkit-transform':'scale(0.1,0.1) ',
        '-o-transform':'scale(0.1,0.1) ',
        '-moz-transform':'scale(0.1,0.1) ',
        '-ms-transform':'scale(0.1,0.1) ',
        '-webkit-transition':'all 0s ease 0s',
        '-o-transition':'all 0s ease 0s',
        '-moz-transition':'all 0s ease 0s',
        '-ms-transition':'all 0s ease 0s'
    });
}

function judgeIndex(className) {
    var index = 1;
    switch (className) {
        case 'roll_ipad':
            index = 1;
            break;
        case 'roll_iphone':
            index = 2;
            break;
        case 'roll_android_phone':
            index = 3;
            break;
        case 'roll_android_pad':
            index = 4;
            break;
    }
    return index;
}
function clearTimer() {
    clearInterval(rollInterval);
    clearTimeout(a);
    clearTimeout(b);
    clearTimeout(c);
    clearTimeout(d);
    clearTimeout(e);
}