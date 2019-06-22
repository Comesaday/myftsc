<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<title>果树认购官方平台</title>
	</head>
	<body>
		<div id="container">
			<div class="header">
				<div class="head">
					<a class="logo"></a>
					<div class="login">
						<s:if test="#session.user != null">
						<ul>
							<li><a id="my" href="${pageContext.request.contextPath }/user/user_exit.action">退出登录</a></li>
							<li><a id="my" href="${pageContext.request.contextPath }/user/user_center.action">个人中心</a></li>
							<li><span style="color:white;">欢迎您：</span><span style="color: red;"><s:property value="#session.user.name"/></span></li>
						</ul>
						</s:if>
						<s:else>
						<ul>
							<li><a id="reg" href="${pageContext.request.contextPath }/user/user_regpage.action">注册</a></li>
							<li><a id="login" href="${pageContext.request.contextPath }/user/user_loginpage.action">登陆</a></li>
						</ul>
						</s:else>
					</div>
				</div>
			</div>
			<div class="nav">
				<div class="subnav">
					<ul>
						<li><a href="${pageContext.request.contextPath }/index.jsp">网站首页</a></li>
						<li><a href="${pageContext.request.contextPath }/index/index_intro.action">果园介绍</a></li>
						<li><a href="${pageContext.request.contextPath }/index/index_orchard.action">果园基地</a></li>
						<li><a href="${pageContext.request.contextPath }/index/index_know.action">认购须知</a></li>
						<li><a href="${pageContext.request.contextPath }/tree/tree_list.action?catagory.id=&state=can">认购中心</a></li>
						<li><a href="${pageContext.request.contextPath }/index/index_about.action">关于我们</a></li>
					</ul>
				</div>
			</div>
			<div class="main">
				<div class="main2">
					<h1 class="h1">绿  色  生  态  果  园</h1>
					<h2 style="padding-top: 50px;">以租赁果树模式对城市居民进行出租</h2>
					<h2>每棵果树每年100元起租</h2>
					<div class="orchard">
						<div class="pic">
							<p>期待您的加盟</p>
							<img src="${pageContext.request.contextPath }/images/other/img1.jpg">
							<img src="${pageContext.request.contextPath }/images/other/img2.jpg">
						</div>
						<div class="intro">
							<p>
								我们的绿色水果是许可使用绿色食品标志的、无污染的、安全、优质、营养果品。
							      无污染是指绿色果品生产、贮运过程中，通过严密监测、控制;防止农药残
							      留、放射性物质、重金属、有害细菌等对果品生产及运销各个环节的污染，
							      不会对人的身体健康产生损害。
							 </p>
						</div>
						<div class="clear"></div>
					</div> 
				</div>
				<div class="main1">
					<h1>春季繁花似锦</h1>
					<div class="img">
						<img style="margin-left: 120px;" src="${pageContext.request.contextPath }/images/other/flower1.jpg"/>
						<img src="${pageContext.request.contextPath }/images/other/flower2.jpg"/>
						<img src="${pageContext.request.contextPath }/images/other/flower3.jpg"/>
						<div class="clear"></div>
					</div>
					<h1>秋季硕果累累</h1>
					<div class="img">
						<img style="margin-left: 120px;" src="${pageContext.request.contextPath }/images/other/fruit1.jpg"/>
						<img src="${pageContext.request.contextPath }/images/other/fruit2.jpg"/>
						<img src="${pageContext.request.contextPath }/images/other/fruit3.jpg"/>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
