<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yqbmxq4IoM1U0GrBUfYd5lZvTBb91bfz"></script>
		<title>认购中心</title>
		<script type="text/javascript">
			function submit(){
				document.form1.submit();
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
							<div class="treelist">
								<div class="title" style="color: white;">果树认购</div>
								<div class="search">
									<form name="form1" action="${pageContext.request.contextPath }/tree/tree_list.action" method="post">
										<ul>
										<li>
											<s:set var="cid" value="cid"></s:set>
											<span style="padding-left: 10px;">查找果树：</span>
											<input type="hidden" name="state" value="can">
											<select name="catagory.id">
												<option value="0">---请选择---</option>
												<s:iterator value="catagories">
													<s:if test="%{id == #cid}">
														<option value="<s:property value="id"/>" selected="selected"><s:property value="name"/></option>
													</s:if>
													<s:else>	
														<option value="<s:property value="id"/>"><s:property value="name"/></option>
													</s:else>
												</s:iterator>
											</select>
										</li>
										<li style="padding-right: 20px;">
											<a href="javascript:void(0)" onclick="submit()">搜索</a>
										</li>
										<s:if test="hasActionMessages()">
											<li>
												<s:actionmessage/>
											</li>
										</s:if>
										</ul>
										<div class="clear"></div>
									</form>
								</div>
								<div class="list">
									<s:iterator var="tree" value="pageBean.list">
									<div class="tree">
										<a href="${pageContext.request.contextPath }/tree/tree_view.action?id=<s:property value="#tree.id"/>" 
											style="background-image: url('${pageContext.request.contextPath }/images/tree-img/<s:property value="#tree.picture1"/>');background-size:100% 100%;text-align: left;color: #FFFFFF;">
										</a>
										<span>${catagory.name }</span>
										<span style="padding-bottom: 8px;">认购价格：${price }</span>
									</div>
									</s:iterator>
									<div class="clear"></div>
								</div>
								<div class="page">
									<ul>
										<li style="margin-right: 20px;"><a href="javascript:void(0)">第<s:property value="pageBean.currentPage"/>/<s:property value="pageBean.totalPage"/>页</a></li>
										<s:if test="pageBean.hasFirst">
											<li><a href="${pageContext.request.contextPath }/tree/tree_list.action?state=${state }&catagory.id=${catagory.id }&page=1">首页</a></li>
										</s:if>
										<s:else>
											<li><a style="color: red;" href="javascript:void(0)">首页</a></li>
										</s:else>
										<s:if test="pageBean.hasPre">
											<li><a href="${pageContext.request.contextPath }/tree/tree_list.action?state=${state }&catagory.id=${catagory.id }&page=${pageBean.currentPage-1 }">上一页</a></li>
										</s:if>
										<s:else>
											<li><a style="color: red;" href="javascript:void(0)">上一页</a></li>
										</s:else>
										<s:if test="pageBean.hasNext">
											<li><a href="${pageContext.request.contextPath }/tree/tree_list.action?state=${state }&catagory.id=${catagory.id }&page=${pageBean.currentPage+1 }">下一页</a></li>
										</s:if>
										<s:else>
											<li><a style="color: red;" href="javascript:void(0)">下一页</a></li>
										</s:else>
										<s:if test="pageBean.hasLast">
											<li><a href="${pageContext.request.contextPath }/tree/tree_list.action?state=${state }&catagory.id=${catagory.id }&page=${pageBean.totalPage }">尾页</a></li>
										</s:if>
										<s:else>
											<li><a style="color: red;" href="javascript:void(0)">尾页</a></li>
										</s:else>
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
