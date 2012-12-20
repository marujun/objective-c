//http://developer.baidu.com/map/jsdemo.htm
var map = new BMap.Map("map");
map.centerAndZoom(new BMap.Point(116.41484, 40.003774), 22);
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
    '起点：<input id="start_point" value="北京联合大学">&nbsp&nbsp' +
    '<button id="type_transit" onclick="traffic(1)" style="width: 40px;height: 22px;" >公交</button>&nbsp&nbsp' +
    '<button id="type_drive" onclick="traffic(2)" style="width: 40px;height: 22px;">驾车</button>';
var infoWindow1 = new BMap.InfoWindow(market_content,market_opts);
marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});

function traffic(type) {
    var start=$('#start_point').val();
    var end='飘亮阳光广场D2';
    switch (type){
        case 1:transit();break;
        case 2:drive();break;
    }
    function transit(){
        $('#wrapper').css({width:'1000px'});
        var transit = new BMap.TransitRoute(map,{renderOptions:{map:map,panel:"searchResult"},
            onSearchComplete: function(rslt){
                console.log(rslt);
                if(!rslt || rslt.getNumPlans() < 1){
                    console.log("未发现公交路线");//相当于jquery的$("#endingBody")
                }
                setTimeout(function(){$('tr>td:nth-child(3)').remove();},0)
            }
        });
        map.clearOverlays();
        transit.search(start, end);
    }
    function drive(){
        var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
        driving.search(start, end);
    }
}


//$('#search').bind('click',{},searchLocation);
//$('#searchRoute').bind('click',{},searchRoute);
//function searchLocation(evt){
//    var address=$('#address')[0].value;
//    var local = new BMap.LocalSearch(map, {
//        renderOptions:{map: map}
//    });
//    local.search(address);
//}
//function searchRoute(evt){
//    var start = $('#start')[0].value;
//    var end = $('#end')[0].value;
//    var method=$('#method option:selected').val();
//    if(method=='DRIVING'){
//        var transit = new BMap.TransitRoute(map, {
//            renderOptions: {map: map, autoViewport: true}
//        });
//        transit.search(start, end);
////        var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
////        driving.search(start, end);
//    }
//    if(method=='WALKING'){
//        var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true}});
//        walking.search(start, end);
//    }
//}
