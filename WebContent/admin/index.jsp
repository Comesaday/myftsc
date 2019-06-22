<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>后台管理中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>后台管理中心</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green"
				href="${pageContext.request.contextPath }/admin/pwd_reset.jsp"
				target="right"><span class="icon-pencil-square-o"></span>修改密码</a>
			&nbsp;&nbsp; <a class="button button-little bg-red"
				href="${pageContext.request.contextPath }/admin/admin_logOff.action"><span
				class="icon-power-off"></span>退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-pencil-square-o"></span>果园管理
		</h2>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/orc/orc_mgr.action"
				target="right"><span class="icon-caret-right"></span>果园信息管理</a>
			</li>
				<li>
				<a href="${pageContext.request.contextPath }/tree/tree_mgr.action?catagory.id=&state=all"
				target="right"><span class="icon-caret-right"></span>果树信息管理</a>
			</li>
		</ul>
		
			<h2>
			<span class="icon-pencil-square-o"></span>客户管理
		</h2>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/user/user_mgr.action"
				target="right"><span class="icon-caret-right"></span>客户信息管理</a>
			</li>
		</ul>

		<h2>
			<span class="icon-pencil-square-o"></span>认购管理
		</h2>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/susc/susc_mgr.action?message="
				target="right"><span class="icon-caret-right"></span>认购信息管理</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/msg/msg_mgr.action"
				target="right"><span class="icon-caret-right"></span>认购消息管理</a>
			</li>
		</ul>

		<h2>
			<span class="icon-pencil-square-o"></span>快递管理
		</h2>
		<ul>
			<li>
			<a href="${pageContext.request.contextPath }/exp/exp_mgr.action"
				target="right"><span class="icon-caret-right"></span>快递信息管理</a>
			</li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>评价管理
		</h2>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/cmt/cmt_mgr.action"
				target="right"><span class="icon-caret-right"></span>评价信息管理</a>
			</li>
		</ul>
	
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav h2").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
			$(".leftnav ul li a").click(
					function() {
						$("#a_leader_txt").text($(this).parent().parent().prev().text());
						$(".leftnav ul li a").removeClass("on");
						$(this).addClass("on");
					})
		});
		
	</script>
	<ul class="bread">
		<li><a href="${pageContext.request.contextPath }/admin/info.jsp"
			target="right" class="icon-home"> 首页</a></li>
		<li><a href="javascript:void(0)" id="a_leader_txt">网站信息</a></li>
	</ul>
	<div class="admin" style="padding: 15px;">
		<iframe scrolling="auto" src="${pageContext.request.contextPath }/admin/info.jsp" name="right"
			width="100%" height="100%"></iframe>
	</div>
</body>
</html>