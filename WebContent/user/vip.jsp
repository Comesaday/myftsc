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
				<div class="title" style="color: white;">开通VIP权限</div>
				<div class="basic">
					<div class="vipn">
						<ul style="margin: 25px 15px;;text-align: left;">
							<li style="padding: 8px 0;">1.开通VIP权限50元/次，时长为一个认购周期；</li>
							<li style="padding: 8px 0;">2.开通VIP权限50元/次，时长为一个认购周期；</li>
							<li style="padding: 8px 0;">3.开通VIP权限50元/次，时长为一个认购周期；</li>
							<li style="padding: 8px 0;">4.开通VIP权限50元/次，时长为一个认购周期；</li>
							<s:if test="hasActionMessages()">
								<li>
									<s:actionmessage/>
								</li>
							</s:if>
						</ul>
					</div>
					<div class="vipa" style="text-align: left;margin: 30px 15px;">
						<a style="background: #027B00;padding: 5px 15px;color: white;" href="${pageContext.request.contextPath }/user/user_vip.action?id=${ session.user.id}">开通VIP</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</body>
</html>