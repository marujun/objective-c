/**
 * Created with JetBrains WebStorm.
 * User: mrj
 * Date: 12-12-11
 * Time: 下午5:23
 * To change this template use File | Settings | File Templates.
 */
var map='';
function showMap(){
    map = new BMap.Map("map");
    map.centerAndZoom(new BMap.Point(116.41484, 40.003774), 22);
//    var control_opts = {type: BMAP_NAVIGATION_CONTROL_ZOOM};
//    map.addControl(new BMap.NavigationControl(control_opts));
    map.addControl(new BMap.NavigationControl());
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    var marker1 = new BMap.Marker(new BMap.Point(116.41484, 40.003774));  // 创建标注
    map.addOverlay(marker1);              // 将标注添加到地图中
    var market_opts = {
        width : 400,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "北京阅微灵动科技有限公司"  // 信息窗口标题
    };
    var market_content='<p>地址：北京市朝阳区安立路68号阳光广场D2 - 1001室</p>' +
        '起点：<input id="start_point" >&nbsp&nbsp' +
        '<button id="type_transit" onclick="traffic(1)" style="width: 40px;height: 22px;" >公交</button>&nbsp&nbsp' +
        '<button id="type_drive" onclick="traffic(2)" style="width: 40px;height: 22px;">驾车</button>';
    var infoWindow1 = new BMap.InfoWindow(market_content,market_opts);
    marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
}

function traffic(type) {
    var start=$('#start_point').val();
    if(start==''){
        alert('请输入起点！')
    }else{
        var end='飘亮阳光广场D2';
        $('<div id="searchResult" style="opacity: 0;"></div>').appendTo('.mapArea');
        switch (type){
            case 1:transit();break;
            case 2:drive();break;
        }
    }
    function transit(){
        var transit = new BMap.TransitRoute(map,{renderOptions:{map:map,panel:"searchResult"},
            onSearchComplete: function(rslt){
                if(!rslt || rslt.getNumPlans() < 1){
                    alert("请选择准确的起点");
                    showResultNavigation();
                    var local = new BMap.LocalSearch(map, {renderOptions:{map: map,panel:"searchResult"}});
                    local.search(start);
                }else{
                    showResultNavigation();
                    setTimeout(function(){$('tr>td:nth-child(3)').remove();},0)
                }
            }
        });
//        map.clearOverlays();
        transit.search(start, end);
        resetButton();
    }
    function drive(){
        var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, panel:"searchResult"},
            onSearchComplete: function(rslt){
                if(!rslt || rslt.getNumPlans() < 1){
                    alert("请选择准确的起点");
                    showResultNavigation();
                    var local = new BMap.LocalSearch(map, {renderOptions:{map: map,panel:"searchResult"}});
                    local.search(start);
                }else{showResultNavigation();}
            }
        });
        driving.search(start, end);
        resetButton();
    }
    function showResultNavigation(){
        $('#searchResult').css({opacity: 1});
        $('.mapArea').css({width:'1000px',left:'12px'});
        $('#map').css({left:'15px'});
        $('.navigationBar>img').css({'left': '970px'});
    }
    function resetButton(){
        $('.resetButton').css({opacity:1}).bind('click',function(){
            $('.mapArea').css({width:'800px',left:'112px'});
            $('.resetButton').css({opacity:0});
            $('#searchResult').remove();
            $('.navigationBar>img').css({'left': '770px'});
            map='';
            showMap();
        })
    }
}