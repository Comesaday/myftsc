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
				<div class="title">我的消息</div>
				<div class="susc">
					<table>
						<thead>
							<tr>
								<th>果树编号</th>
								<th>视频</th>
								<th>图片</th>
								<th>时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator var="msg" value="messages">
							<tr>
								<td>${tree.id }</td>
								<td>
									<video controls="controls" style="width:100px; height:30px; object-fit: fill">
									<source src="${pageContext.request.contextPath }/images/msg-img/${movie }" type="audio/mp4">
								</td>
								<td><img style="width: 100px;height: 30px;" src="${pageContext.request.contextPath }/images/msg-img/${picture1 }"></td>
								<td>${stime }</td>
								<td><a href="${pageContext.request.contextPath }/msg/msg_view.action?id=${id }">查看</a></td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
