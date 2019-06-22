<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/innerbox.js"></script>
	</head>
	<body>
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
			<div class="box">
				<div id="innerbox">
					
				</div>
			</div>
	</body>
</html>
