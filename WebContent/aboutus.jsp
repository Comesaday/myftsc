<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yqbmxq4IoM1U0GrBUfYd5lZvTBb91bfz"></script>
		<title>关于我们</title>
	</head>
	<body>
		<div id="container">
			<%@ include file="top.jsp" %>
			<div class="location">
				<div class="local">
					<span>当前位置： 主页  >  关于我们</span>
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
							<div class="aboutus">
								<div class="title" style="color: white;">关于我们</div>
								<div class="us">
									<p>
									我们的果园位于生态绿岛——崇明的西北部，是由上海瑞华实业公司（光明食品集团旗下）
									倾力打造的现代生态旅游观光中心。瑞华果园园区占地1500余亩，是崇明生态示范区建
									设的一个绿色窗口，集现代生态林果示范、林果业科学研究、果品品牌生产、科普教育
									和观光休闲于一体。瑞华果园景观方面：注重休闲设施和景观环境的协调统一，充分用
									足果树、果林的特色，注重科学、美观、生态的原则，重点做好游、观、体验结合的特色。
									以绿色、自然、生态为底蕴，运用艺术化的写真手法，融入小桥、流水、亭榭的园林韵味，
									充分利用果园、果树的自然之美，并深入挖掘水果之后的文化，形成摘月台、瑞桃园、
									知青年代、香踪桥、健逸亭、拓意园等源于自然高于自然的生态景观。果园更是以“回归
									自然”为主题，是都市人自己家的生态果园，满足人们回归自然，释放都市的纷繁的需求，
									帮助人们回归自然、置身自然，呼吸大自然赐予踏青的生态芬芳。开怀释放快节奏生活带来
									的疲惫，让您感受“世外桃源”的清幽。果园所生产的果品及林下经济养殖将传达给游客自然、
									健康、休闲的生活理念，使游客亲身体验到自己家都市果园的感受，享受品尝到真正的健康
									绿色产品。
									</p>
									<p>
									交通概况：(公交)
									地铁1号线—彭浦新村（共富新村）—换乘彭石线公交车—石洞口码头—崇明南门港—换乘南跃线公交车—瑞华果园
									(自驾 )
									①上内环－中环（翔殷路隧道方向）－五洲大道隧桥入口－长江隧桥－陈海公路－崇明南门—港东公路—北沿公路向西—瑞华果园 
									②上内环－中环（翔殷路隧道方向）－五洲大道－长江隧桥－陈海公路到底—北沿公路向东—瑞华果园</p>
								</div>
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
