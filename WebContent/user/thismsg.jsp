<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
	</head>
	<body>
		<div class="main-area"> 
			<div class="myinfo">
				<div class="title">认购动态</div>
				<div class="pwd">
					<table style="border-spacing:10px;margin: 10px auto;text-align: left;" border="0" cellspacing="0" cellpadding="0">
						<tbody style="background: #E0FAF2;">
							<tr>
								<td class="td1" width="20%">果树视频</td>
								<td class="td2">
									<video controls="controls" style="width:400px; height:200px; object-fit: fill">
									<source src="${pageContext.request.contextPath }/images/msg-img/${message.movie }" type="audio/mp4">
								</td>
							</tr>
							<tr>
								<td class="td1">果树图片</td>
								<td class="td2">
									 <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/msg-img/${message.picture1}">
       	  			   <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/msg-img/${message.picture2}">
       	  				 <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/msg-img/${message.picture3}">
								</td>
							</tr>
							<tr>
								<td class="td1">果树信息</td>
								<td class="td2" align="justify">${message.content }</td>
							</tr>
							<tr>
								<td class="td1"></td>
								<td class="td2"><a class="button button-little bg-green" href="${pageContext.request.contextPath }/user/user_mymsg.action?id=${session.user.id}">返回</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
