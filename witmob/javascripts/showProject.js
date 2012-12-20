/**
 * Created with JetBrains WebStorm.
 * User: mrj
 * Date: 12-11-29
 * Time: 下午12:00
 * To change this template use File | Settings | File Templates.
 */
$(".menu div:nth-child(2)").bind('touchstart', renderProject);
function renderProject(){
    $('#home').hide();
    $(".menu div").removeAttr("style");
    $('.menu>div:nth-child(2) font').css({'color': '#000000'});
    $('.menu>div:nth-child(1) font').css({'color': '#a9a9a9'});
    $('.menu>div:nth-child(3) font').css({'color': '#a9a9a9'});
    bindMenuHover(2);
    $('#project_show').show();
    shadowAboutUs();
    $('#about_us').hide();
    renderIphone();
}
var count,roll_time=1000,stay_time=3000,gap=0;
$('.menu_1').bind('touchstart', renderAndroid);
$('.menu_2').bind('touchstart', renderIpad);
$('.menu_3').bind('touchstart', renderIphone);
$('.show_area').hover(projectImageMouseEnter,projectImageMouseLeave)
    .bind('touchstart',projectImageClick)
    .mousemove(projectImageMouseMove);
function renderIphone(){
    $('.show_area').empty();
    clearProjectMenu();
    $('.equipment_type>:nth-child(3) img:nth-child(2)').hide();
    $('.equipment_type>:nth-child(3) font').css({color:"red"});
    $('.equipment_type>:nth-child(3)').css({'z-index': 10});
    $('<div class="show_area_roll">' +
        '<img src="images/iphone/1.png">' +
        '<img src="images/iphone/2.png">' +
        '<img src="images/iphone/3.png">' +
        '<img src="images/iphone/4.png">' +
        '<img src="images/iphone/5.png">' +
        '<img src="images/iphone/6.png">' +
        '<img src="images/iphone/7.png">' +
        '</div>').appendTo($('.show_area'));
    projectImageIndex=0;isright=true;count=7;
    rollProjectImage(count,roll_time,stay_time);
    renderShortImage('iphone',7);
    bindClickEvent('iphone');
}
function renderIpad(){
    $('.show_area').empty();
    clearProjectMenu();
    $('.equipment_type>:nth-child(2) img:nth-child(2)').hide();
    $('.equipment_type>:nth-child(2) font').css({color:"red"});
    $('.equipment_type>:nth-child(2)').css({'z-index': 10});
    $('<div class="show_area_roll">' +
        '<img src="images/ipad/1.png">' +
        '<img src="images/ipad/2.png">' +
        '<img src="images/ipad/3.png">' +
        '<img src="images/ipad/4.png">' +
        '<img src="images/ipad/5.png"></div>').appendTo($('.show_area'));
    projectImageIndex=0;isright=true;count=5;
    rollProjectImage(count,roll_time,stay_time);
    renderShortImage('ipad',5);
    bindClickEvent('ipad');
}
function renderAndroid(){
    $('.show_area').empty();
    clearProjectMenu();
    $('.equipment_type>:nth-child(1) img:nth-child(2)').hide();
    $('.equipment_type>:nth-child(1) font').css({color:"red"});
    $('.equipment_type>:nth-child(1)').css({'z-index': 10});
    $('<div class="show_area_roll">' +
        '<img src="images/android/1.png">' +
        '<img src="images/android/2.png">' +
        '<img src="images/android/3.png">' +
        '<img src="images/android/4.png">' +
        '<img src="images/android/5.png">' +
        '<img src="images/android/6.png">' +
        '<img src="images/android/7.png">' +
        '</div>').appendTo($('.show_area'));
    projectImageIndex=0;isright=true;count=7;
    rollProjectImage(count,roll_time,stay_time);
    renderShortImage('android',7);
    bindClickEvent('android');
}
function clearProjectMenu(){
    $('.equipment_type font').css({
        'color':'#ffffff'
    });
    $('.equipment_type>:nth-child(1) img:nth-child(2)').show();
    $('.equipment_type>:nth-child(2) img:nth-child(2)').show();
    $('.equipment_type>:nth-child(3) img:nth-child(2)').show();
    $('.equipment_type>:nth-child(1)').css({'z-index': 3});
    $('.equipment_type>:nth-child(2)').css({'z-index': 2});
    $('.equipment_type>:nth-child(3)').css({'z-index': 1});
}
var projectImageIndex=1;
var isright=true,projectRollInterval;
function rollProjectImage(count,roll_time,stay_time){
    clearInterval(projectRollInterval);
        projectRollInterval = setInterval(function(){
        if(isright){projectImageIndex++}else{projectImageIndex--}
        startRoll(roll_time,'slide');
        if(projectImageIndex>=(count-1)){isright=false}
        if(projectImageIndex<1){isright=true;}
    }, stay_time+roll_time);
}
var shortImageIndex=projectImageIndex;
function startRoll(roll_time,slideType){
    var move=-1024*projectImageIndex;
    shortImageIndex=projectImageIndex;
//    console.log('move: '+move+'   projectImageIndex: '+projectImageIndex);
    if(slideType=="slide"){
        slideDomElement('show_area_roll',move,roll_time);
    }else{
        $('.show_area_curtain').css({opacity: 1,'z-index': 10,
            '-webkit-transition':'all 0ms ease 0s',
            '-o-transition':'all 0ms ease 0s',
            '-ms-transition':'all 0ms ease 0s',
            '-moz-transition':'all 0ms ease 0s'});
        jumpDomElement('show_area_roll',move,roll_time);
    }
    var moveLength=0,className=null;
    if(projectImageIndex>=4){shortImageIndex-=(count-5);}
    if(isright&&projectImageIndex>=4){
        moveLength=-(count-5)*120;
        className='list_images';
        slideDomElement('selectedImage',((gap+120)*shortImageIndex),roll_time);
    }
    if((!isright)&&projectImageIndex<=4){className='list_images';
        shortImageIndex=projectImageIndex;
        slideDomElement('selectedImage',((gap+120)*shortImageIndex),roll_time);
    }
    if(className==null){
        moveLength=(gap+120)*shortImageIndex;
        className='selectedImage';
    }
//    console.log('isright',isright,'   className: ',className,'   moveLength:',moveLength);
    slideDomElement(className,moveLength,roll_time);
}
function slideDomElement(className,length,roll_time){
    $('.'+className).css({
        '-webkit-transform':'translate('+length+'px, 0)',
        '-o-transform':'translate('+length+'px, 0)',
        '-moz-transform':'translate('+length+'px, 0)',
        '-ms-transform':'translate('+length+'px, 0)',
        '-webkit-transition':'all '+roll_time+'ms ease 0s',
        '-o-transition':'all '+roll_time+'ms ease 0s',
        '-ms-transition':'all '+roll_time+'ms ease 0s',
        '-moz-transition':'all '+roll_time+'ms ease 0s'
    });
}
function jumpDomElement(className,length,roll_time){
    slideDomElement(className,length,0);
    roll_time=500;
    setTimeout(function(){
        $('.show_area_curtain').css({
            opacity: 0,
            '-webkit-transition':'all '+roll_time+'ms ease 0s',
            '-o-transition':'all '+roll_time+'ms ease 0s',
            '-ms-transition':'all '+roll_time+'ms ease 0s',
            '-moz-transition':'all '+roll_time+'ms ease 0s'
        });
    },0);
    setTimeout(function(){
        $('.show_area_curtain').css({'z-index': 0});
    },100);
}
function projectImageMouseEnter(){
    clearInterval(projectRollInterval);
}
function projectImageMouseLeave(){
    rollProjectImage(count,roll_time,stay_time)
}
function projectImageClick(evt){
    var positionsX = evt.originalEvent.x || evt.originalEvent.layerX || 0;
    var slideType='slide';
    if(positionsX<=($(window).width()/2)){
        if(projectImageIndex>0){ projectImageIndex--;isright=false;
        }else{projectImageIndex=count-1;isright=true;slideType='jump';}
    }else{
        if(projectImageIndex<(count-1)){projectImageIndex++;isright=true;
        }else{ projectImageIndex=0;isright=false;slideType='jump';}
    }
//    if(isright){projectImageIndex++}else{projectImageIndex--}
    startRoll(roll_time,slideType);
    if(projectImageIndex>=(count-1)){isright=false}
    if(projectImageIndex<1){isright=true;}
}
function renderShortImage(dirName,count){
    $('.short_image').empty();
    gap=0;
    $('<div class="short_image_list">' +
        '<div class="list_images"></div>' +
        '</div><div class="selectedImage"></div>').appendTo($('.short_image'));
    if(count>5){$('.list_images').css({'width':120*count+'px'})}
    for(var i=1;i<=count;i++){
        $('<img src="images/'+dirName+'/'+i+'_spot.png">').appendTo($('.list_images'));
    }
    if(count<5){
        gap=(600-(count*120))/(count+1);
        for(var j=1;j<=count;j++){
            $('.list_images>:nth-child('+j+')').css({'margin-left':gap+'px'})
        }
        $('.selectedImage').css({'margin-left':gap+'px'})
    }
}
function bindClickEvent(type){
    var txtList=[];
    if(type=='ipad'){txtList=['燕西华府','楼盘销售应用','燕西华府电子楼书','QAT','洪恩电子书']}
    if(type=='iphone'){txtList=['饭饭','new self','GQ','VOGUE','悦己self','魔法手机壳','精品小项目']}
    if(type=='android'){txtList=['云楼书','QAT Remote','昆河音响','饭饭','云端电话簿','lifeweeker','三联 LifeWeeker']}
    $('.selectedImage').bind('touchover',{selectedImage:true},shortImageMouseOver)
        .bind('touchout',shortImageMouseLeave)
//        .bind('mouseenter',{selectedImage:true},shortImageMouseEnter)
        .mousemove(function(e) {
            var positionX=e.pageX-$(this).offset().left;
            var positionY=e.pageY-$(this).offset().top;
            $('.shortImageTxt').css({left:($(this).position().left+positionX-209-35)+'px',top:(positionY-22)+'px'})
        });
    for(var k=0;k<count;k++){
        $('.list_images img:nth-child('+(k+1)+')')
            .bind('touchstart',{index:k},shortImageClick)
//            .bind('mouseenter',{txt:txtList[k],index:k},shortImageMouseEnter)
            .bind('touchover',{txt:txtList[k],index:k},shortImageMouseOver)
            .bind('touchout',shortImageMouseLeave);
    }
    function shortImageClick(evt){
        if(projectImageIndex<evt.data.index){isright=true;}
        if(projectImageIndex>evt.data.index){isright=false;}
        projectImageIndex=evt.data.index;
//        console.log(projectImageIndex);
        clearInterval(projectRollInterval);
        startRoll(roll_time,'jump');
        rollProjectImage(count,roll_time,stay_time);
        if(evt.data.index==0){isright=true}
        if(evt.data.index==(count-1)){isright=false}
    }
    function shortImageMouseOver(evt){
        var detailInfo=evt.data.txt;
        var hoverShortImageIndex=evt.data.index;
        if(evt.data.selectedImage){hoverShortImageIndex=projectImageIndex;detailInfo=txtList[projectImageIndex]}
        if(projectImageIndex>=4){hoverShortImageIndex-=2;}
        $('<div class="shortImageTxt"><div id="box1"><font size="1"><strong>'+detailInfo+'</strong></font></div></div>').appendTo($('.short_image_list'));
        $('.shortImageTxt').css({left:(20+120*hoverShortImageIndex)+'px'});
        if(detailInfo=='楼盘销售应用'){$('#box1').css({width:'80px'})}
        if(detailInfo=='燕西华府电子楼书'){$('#box1').css({width:'100px'})}
        $jScroller.add(".shortImageTxt","#box1","left",6);
        $jScroller.start();
    }
    function shortImageMouseEnter(evt){
        var hoverShortImageIndex=evt.data.index;
        if(evt.data.selectedImage){hoverShortImageIndex=projectImageIndex;detailInfo=txtList[projectImageIndex]}
        if(projectImageIndex>=4){hoverShortImageIndex-=2;}
        var left=20+120*hoverShortImageIndex;
        contractDiv('tempContract','short_image_list',250,left)
    }
    function contractDiv(childClass,targetClass,time,left){
        $('<div class="'+childClass+'"></div>').appendTo($('.'+targetClass));
        $('.'+childClass).css({left:left+'px'});
        setTimeout(function(){
            $('.'+childClass).css({
                '-webkit-transform':'scale(0.1)',
                '-o-transform':'scale(0.1)',
                '-moz-transform':'scale(0.1)',
                '-ms-transform':'scale(0.1)',
                '-webkit-transition':'all '+time+'ms ease 0s',
                '-o-transition':'all '+time+'ms ease 0s',
                '-moz-transition':'all '+time+'ms ease 0s',
                '-ms-transition':'all '+time+'ms ease 0s'
            });
        },0);
        setTimeout(function(){
            $('.'+childClass).css({
                '-webkit-transform':'scale(1)',
                '-o-transform':'scale(1)',
                '-moz-transform':'scale(1)',
                '-ms-transform':'scale(1)',
                '-webkit-transition':'all '+time+'ms ease 0s',
                '-o-transition':'all '+time+'ms ease 0s',
                '-moz-transition':'all '+time+'ms ease 0s',
                '-ms-transition':'all '+time+'ms ease 0s'
            });
        },time);
        setTimeout(function(){
            $('.'+childClass).remove();
        },(time*2));
    }
    function shortImageMouseLeave(){
        $('.shortImageTxt').remove();
    }
    $('.short_image_list').mousemove(function(e) {
        var positionX=e.pageX-$(this).offset().left;
        var positionY=e.pageY-$(this).offset().top;
        $('.shortImageTxt').css({left:(positionX-35)+'px',top:(positionY-18)+'px'})
    });
}
function projectImageMouseMove(evt){
    var positionsX = evt.originalEvent.x || evt.originalEvent.layerX || 0;
    if(positionsX<=($(window).width()/2)){
        $('.show_area').css({cursor:'url(images/backArrow.png),pointer'});
    }else{
        $('.show_area').css({cursor:'url(images/nextArrow.png),pointer'});
    }
}