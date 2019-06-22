<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yqbmxq4IoM1U0GrBUfYd5lZvTBb91bfz"></script>
		<title>果树认购</title>
		<script type="text/javascript">
		function susc(){
			var user = '<s:property value="#session.user"/>';
			if(user){
				var agr = $("#agr").is(':checked');
				if(agr == false){
					document.getElementById("rwd").innerHTML = "<font style='color:red;font-size:15px;'>请先同意认购协议！</font>";
					return;
				}else{
					document.getElementById("rwd").innerHTML = "";
				}
				$("#form1").submit();
			}else{
				alert("请先登录或注册！");
				window.location.href="${pageContext.request.contextPath}/user/user_loginpage.action";
			}
		
		}
		function check(){
			var agr = $("#agr").is(':checked');
			if(agr == false){
				document.getElementById("rwd").innerHTML = "<font style='color:red;font-size:15px;'>请先同意认购协议！</font>";
				return;
			}else{
				document.getElementById("rwd").innerHTML = "";
			}
		}
		</script>
	</head>
	<body>
		<div id="container">
			<%@ include file="top.jsp" %>
			<div class="location">
				<div class="local">
					<span>当前位置： 主页  > 认购中心</span>
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
							<div class="treeinfo">
								<div class="title">果树信息</div>
								<div class="treepic">
									<img src="${pageContext.request.contextPath }/images/tree-img/${tree.picture1}"/>
								</div>
								<form id="form1" name="form1" action="${pageContext.request.contextPath }/susc/susc_order.action" method="post">
								<div class="otherinfo">
									<div class="tinfo"> 
										<input type="hidden" name="user.id" value="${session.user.id }">
										<input type="hidden" name="tree.id" value="${tree.id }">
										<input type="hidden" name="desposit" value="${tree.price }">
										<h2 style="margin-top: 15px;">果树名称：${tree.catagory.name }</h2>
										
										<h2>果树介绍：<span>${tree.detail }</span></h2>
										<h2>认购价格：RMB ${tree.price }</h2>
										<h2>认购定金：RMB 100</h2>
										<h2>认购协议：
											<input type="checkbox" checked="checked" onclick="check()"id="agr"/>同意<a id="open" href="javascript:void()">认购协议</a>
										</h2>
									</div>
									<div class="sure">
										<a href="javascript:void(0)" onclick="susc()">认购果树</a><span id="rwd" style="padding-left: 10px;"></span>
									</div>
								</div>
								</form>
								<div id="agreement" class="agreement" style="display: none;">
									<div class="title"><span>认购协议</span><a style="float:right;font-size:14px;color:#FFFFFF;" id="close" href="javascript:void(0)">关闭</a></div>
									<div class="agree">
										<p style="font-size: 16px;line-height: 20px;">
											诚信果园秉承诚信经营、绿色共享的认购理念。我们的团队用科学的手段管理果园，
											少污染，少农药，出产绿色健康的水果，让您看的舒心，吃得放心。为了愉快的合作，
											我们有以下下几点需要您认同：
										</p>	
										<ul style="padding-left: 15px;color: red;">
											<li>1、果树一经认购，定金缴纳成功，不可中途放弃认购。</li>
											<li>2、如遇自然灾害，我们会采取特殊手段挽回损失。</li>
											<li>3、如果您想偶尔知晓果树状态，须开通VIP权限，我们会定期向您发送照片视频等。</li>
											<li>5、果实成熟有一定时间间隔，为保证果实新鲜，我们帮您采摘保存，等待集中发货。</li>
											<li>6、果实采用货到付款快递交付，请您配合支付尾款。</li>
											<li>7、果树所有权属果园，果实归您所有，任何客户不得强占果树</li>
										</ul>
									</div>
								</div>
								<div class="morepic">
									<ul>
										<li><img src="${pageContext.request.contextPath }/images/tree-img/${tree.picture1}"/></li>
										<li><img src="${pageContext.request.contextPath }/images/tree-img/${tree.picture2}"/></li>
										<li><img src="${pageContext.request.contextPath }/images/tree-img/${tree.picture3}"/></li>
									</ul>
									<div class="clear"></div>
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
