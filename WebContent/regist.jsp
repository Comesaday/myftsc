<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>  
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yqbmxq4IoM1U0GrBUfYd5lZvTBb91bfz"></script>
		<title>注册新用户</title>
		<script type="text/javascript">

		function checkName(){
			var account = $("#account").val();
			if(account == ""){
				document.getElementById("sp1").innerHTML = "<font style='color:red;font-size:15px;'>用户名不能为空！</font>";
				$("#account").focus();
				return;
			}
			$.post("${pageContext.request.contextPath }/user/user_regcheck.action",{account:account},function(data,status){
				if(status == "success"){
					if(data == 1){
						$("#btn").attr("disabled",true);
						document.getElementById("sp1").innerHTML = "<font style='color:red;font-size:15px;'>该用户名已被注册！</font>";
					}else if(data == 0){
						$("#btn").attr("disabled",false);
						document.getElementById("sp1").innerHTML = "<font style='color:green;font-size:15px;'>用户名可注册！</font>";
					}
				}
			});
		}
		
		function checkPic(){
			var pic = $("#pic").val();
			if(pic == ""){
				$("#pic").focue();
				document.getElementById("sp2").innerHTML = "<font style='color:red;font-size:15px;'>请上传图片！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp2").innerHTML = "";
				$("#btn").attr("disabled",true);
			}
		}
		function checkPass(){
			var password = $("#password").val();
			if(password == ""){
				document.getElementById("sp3").innerHTML = "<font style='color:red;font-size:15px;'>请设置密码！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp3").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkRepass(){
			var repass = $("#repass").val();
			var password = $("#password").val();
			if(repass == ""){
				document.getElementById("sp4").innerHTML = "<font style='color:red;font-size:15px;'>请再次输入密码！</font>";
				return;
			}else if(repass != password){
				document.getElementById("sp4").innerHTML = "<font style='color:red;font-size:15px;'>两次输入的密码不一致！</font>";
				$("#btn").attr("disabled",true);
			}else{
				document.getElementById("sp4").innerHTML = "<font style='color:green;font-size:15px;'>两次输入的密码一致！</font>";
				$("#btn").attr("disabled",false);
			}
		}
		function checkPhone(){
			var phone = $("#phone").val();
			if(phone == ""){
				document.getElementById("sp5").innerHTML = "<font style='color:red;font-size:15px;'>联系方式不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp5").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkEmail(){
			var email = $("#email").val();
			if(email == ""){
				document.getElementById("sp6").innerHTML = "<font style='color:red;font-size:15px;'>邮箱不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp6").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkAddress(){
			var address = $("#address").val();
			if(address == ""){
				document.getElementById("sp7").innerHTML = "<font style='color:red;font-size:15px;'>地址不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp7").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		</script>
	</head>
	<body>
		<div id="container">
			<%@ include file="top.jsp" %>
			<div class="location">
				<div class="local">
					<span>当前位置： 主页  >  注册</span>
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
								<div class="regist text">
									<div class="title">注  册  新  用  户</div>
									<form id="form1" action="${pageContext.request.contextPath }/user/user_reg.action" method="post">
										<s:if test="hasActionMessages()">
											<s:actionmessage/>
										</s:if>
										<table>
											<tbody>
												<tr>
													<th>用户名：</th>
													<td><input type="text" id="account" name="account" onblur="checkName()" placeholder="填写用户名"><span id="sp1" class="sp"></span></td>
												</tr>
												<tr> 
													<th>密码：</th>
													<td><input type="text" onblur="checkPass()" id="password" name="password" placeholder="填写密码"><span class="sp" id="sp3"></span></td>
												</tr>
												<tr>
													<th>确认密码：</th>
													<td><input type="text" id="repass" onblur="checkRepass()" name="repass" placeholder="再次输入密码"><span class="sp" id="sp4"></span></td>
												</tr>
												<tr>
													<th>姓名：</th>
													<td>
														<input type="text" id="name" onblur="checkName()" name="name" placeholder="输入真实姓名"><span class="sp" id="sp8"></span>
													</td>
												</tr>
												<tr>
													<th>性别：</th>
													<td>
														<input type="radio" id="sex" name="sex" value="男" checked/>男
														<input type="radio" id="sex" name="sex" value="女" />女
													</td>
												</tr>
												<tr>
													<th>电话号码：</th>
													<td><input type="text" onblur="checkPhone()" id="phone" name="phone" placeholder="输入电话号码"><span class="sp" id="sp5"></span></td>
												</tr>
												<tr>
													<th>邮箱：</th>
													<td><input type="text" id="email" onblur="checkEmail()" name="email" placeholder="输入邮箱地址"><span class="sp" id="sp6"></span></td>
												</tr>
												<tr>
													<th>居住地址：</th>
													<td><input type="text" id="address" onblur="checkAddress()" name="address" placeholder="输入居住地址"><span class="sp" id="sp7"></span></td>
												</tr>
												<tr>
													<th></th>
													<td><input style="color: #FFFFFF;background: #027B00;padding: 6px 25px;border: 0;" type="submit" id="btn" value="注    册"></td>
												</tr>
											</tbody>
										</table>
									</form>
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
