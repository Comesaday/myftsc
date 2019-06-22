<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yqbmxq4IoM1U0GrBUfYd5lZvTBb91bfz"></script>
		<title>果园介绍</title>
	</head>
	<body>
		<div id="container">
			<%@ include file="top.jsp" %>
			<div class="location">
				<div class="local">
					<span>当前位置： 主页  >  果园介绍</span>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="main">
				<div class="innermain">
					<div class="slide">
						<h2 style="margin: 0;">果园位置</h2>
						<div style="width:100%;height:200px;margin-bottom:10px;border:#ccc solid 1px;font-size:12px" id="map"></div>
						<h2>联系我们</h2>
						<div class="about">
							<p style="padding-top: 5px;">联系人：<s:property value="admin.name"/></p>
							<p>电话：<s:property value="admin.phone"/></p>
							<p>邮箱：<s:property value="admin.email"/></p>
							<p>地址：<s:property value="orchard.address"/></p>
							<p>网址：<a href="http://www.comesaday.cn"><s:property value="orchard.web"/></a></p>
						</div>
						<div class="manage">
							<a href="${pageContext.request.contextPath }/admin/login.jsp">管理员登陆</a>
						</div>
					</div>
					<div class="content">
						<div class="main-area">
							<div class="info">
								<h2>详细信息</h2>
								<div class="detail">
									<video controls="controls" style="width:300px; height:220px; padding: 12px 10px 10px 0;object-fit: fill">
								        <source src="${pageContext.request.contextPath}/images/orc-img/<s:property value='orchard.movie'/>" type="audio/mp4">
								    </video>
								    <div class="produce">
								    	<p>
								    		<s:property value="orchard.detail"/>
								    	</p>
								    </div>
									<div class="clear"></div>
								</div>
								<h2>客户评论</h2>
								<div class="comment">
									<ul>
									<s:iterator var="comment" value="comments">
										<li>${comment }<span style="display: block;float:right;"><s:property value="#comment.ctime"/></span></li>
									</s:iterator>
									</ul>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<%@ include file="footer.jsp" %>
		</div>
	</body>
	<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point(113.211886,33.753316),18);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"果园",title:"果园",imageOffset: {width:0,height:3},position:{lat:33.754164,lng:113.210008}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
        var opts = {
          width: 200,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT,type:0});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
      map.addControl(overviewControl);
    }
    var map;
      initMap();
  </script>
</html>
