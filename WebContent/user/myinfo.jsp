<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
	</head>
	<body>
		<div class="main-area"> 
			<div class="myinfo">
				<div class="title">我的个人信息</div>
				<div class="basic">
					<table>
						<thead>
							<tr>
								<th>用户名</th>
								<th>姓名</th>
								<th>电话</th>
								<th>居住地</th>
								<th>邮箱</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${user.account }</td>
								<td>${user.name }</td>
								<td>${user.phone }</td>
								<td>${user.address }</td>
								<td>${user.email }</td>
								<td>
									<a href="${pageContext.request.contextPath }/user/pwd_reset.jsp">修改密码</a>
									<a href="${pageContext.request.contextPath }/user/user_reinfopage.action?id=${user.id}">修改信息</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>