<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
<script type="text/javascript">
	$("#btn").click(function(){
		if($("password").val() == ""){
			$("#check").innerHTML == "<font  style='font-size: 14px;line-height: 36px; margin-left: 15px;color: red;'>密码不能为空！</font>";
			return;
		}
		$("#form1").submit();
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>重置用户密码</strong>
		</div>
		<div class="body-content">
			<form method="post" id="form1" class="form-x" action="${pageContext.request.contextPath }/user/user_modUser.action?id=${user.id }">
				<div class="form-group">
					<div class="label">
						<label>用户名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${user.account }" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>新密码：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="password" name="password" data-validate="required:请输入新密码！" />
						<span id="check"></span>
					</div>
				</div>
				<s:if test="hasActionMessages()">
				<div style="margin-left:120px;margin-bottom:10px;">
					<strong style="color: red;font-size: 15px;"><s:actionmessage/></strong>
				</div>
				</s:if>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit" id="btn">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>