<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
<title>操作失败</title>


<style type="text/css">
 body{
 	margin: 0;
	padding: 0;
	background-color: #F5F5F5;
 }
.tbody {
	width: 100%;
	padding-top: 125px;
	margin: 0;
	min-height: 400px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}
</style>
<script type="text/javascript">
	function countDown(secs) {  
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs >= 0) {
			setTimeout("countDown(" + secs + ")", 1000);
		} else {
			parent.window.location.href = "${pageContext.request.contextPath }/index.jsp";
		}
	}
</script>

</head>

<body>
<div class="main-area"> 
	<div class="tbody" style="text-align: center; "   >
	<br/>	<br/>	<br/>
		<font color="#6699CC" style="font-size: 24px;font-weight: bolder;">修改密码成功!</font>
		<span id="jumpTo"
			style="font-size: 20px;font-weight: bolder;color:#6699CC">5</span>秒后您需要重新登陆
		<script type="text/javascript">
			countDown(4, 'javascript:history.go(-1);');
		</script>
		<p align="center" style="font-size: 16px;">
			如果您的浏览器不支持跳转,<a style="text-decoration: none"
				href="&{pageContext.request.contextPath}/index.jsp"><font color="#FF0000">请点击这里</font>
			</a>.
		</p>
	</div>
</div>
</body>
</html>
