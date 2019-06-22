<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
</head>
<body>
	<div class="main-area"> 
			<div class="myinfo">
				<div class="title">我的评价信息</div>
				<div class="exp">
					<table>
						<thead>
							<tr>
								<th>果树编号</th>
								<th>图片</th>
								<th>评价内容</th>
								<th>评价时间</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator var="cmt" value="comments">
							<tr>
								<td>${tree.id}</td>
								<td><img style="width: 50px;height: 30px;" src="${pageContext.request.contextPath }/images/cmt-img/${picture1}"></td>
								<td>${comment }</td>
								<td>${ctime }</td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</body>
</html>