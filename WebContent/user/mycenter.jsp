<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/test.js" ></script>
		<script type="text/javascript">
		$(function(){
			//iframe高度随内容自动调整  
			$('#iframe').load(function(){	
				var h = $(this).contents().find("body").height();	
				//别的参考不对		
				$(this).height(h);	
				}  
			);  
		</script>
	</head>
	<body>
		<div id="container">
			<%@ include file="../top.jsp" %>
			<div class="location">
				<div class="local">
					<span>当前位置： 主页  >  个人中心</span>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="main">
				<div class="innermain">
					<div class="slide">
						<h2 style="margin: 0;">个人中心</h2>
						<ul class="org" style="width: 100%;">
							<li><a href="${pageContext.request.contextPath }/user/user_myinfo.action?id=${ session.user.id}" target="main">我的个人信息</a></li>
							<li><a href="${pageContext.request.contextPath }/user/user_mysusc.action?id=${ session.user.id}" target="main">我的认购信息</a></li>
							<s:if test="#session.user.isvip == true">
								<li><a href="${pageContext.request.contextPath }/user/user_mymsg.action?id=${ session.user.id}" target="main">我的认购消息</a></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath }/user/user_vippage.action?id=${ session.user.id}" target="main">开通VIP认购</a></li>
							</s:else>
							<li><a href="${pageContext.request.contextPath }/user/user_myexp.action?id=${ session.user.id}" target="main">我的快递信息</a></li>
							<li><a href="${pageContext.request.contextPath }/user/user_mycmt.action?id=${ session.user.id}" target="main">我的评价信息</a></li>
						</ul>
					</div>
					<div class="content">
						<iframe id="iframe" scrolling="no" frameborder="0" src="${pageContext.request.contextPath }/user/myinfo.jsp" name="main" width="100%" height="500px"></iframe>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<%@ include file="../footer.jsp" %>
		</div>
	</body>
</html>