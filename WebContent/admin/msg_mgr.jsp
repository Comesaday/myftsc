<%@page import="cn.comesaday.cw.domain.Tree"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html lang="zh-cn">
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
</head>
<body>
	<div id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">认购消息</strong>
			</div>
			<div class="padding border-bottom">
			<form name="form1" action="${pageContext.request.contextPath }/msg/msg_search.action" method="post">
				<ul class="search" style="padding-left: 10px;">
					<li>
						<input type="hidden" name="page" value="${pageBean.currentPage }">
          	<input type="text" placeholder="请输入用户编号" id="uid" name="user.id" class="input" style="width:250px; line-height:17px;display:inline-block" />
          	<input type="button" class="button border-main icon-search" onclick="search()" value="搜索"/>
					</li>
					<li style="color: red;font-size: 18px;">
						<s:if test="hasActionMessages()">
							<s:actionmessage/>
						</s:if>
					</li>
				</ul>
			</form>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>编号</th>
					<th>果树编号</th>
					<th>用户编号</th>
					<th>图片</th>
					<th>时间</th>
				</tr>
				<s:iterator value="pageBean.list">
					<tr>
						<td>${id }</td>
						<td>${tree.id }</td>
						<td>${user.id }</td>
						<td><img style="width: 30px;height:30px;" src="${pageContext.request.contextPath }/images/msg-img/${picture1 }"></td>
						<td>${stime }</td>
					</tr>
				</s:iterator>
				<tr>
				<tr>
					<td colspan="9">
						<div class="pagelist">
							<a>第<s:property value="pageBean.currentPage" />/<s:property
									value="pageBean.totalPage" />页
							</a>
							<s:if test="pageBean.hasFirst">
								<a href="${pageContext.request.contextPath}/msg/msg_mgr.action?state=${state1 }&catagory.id=${cid }&page=1">首页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">首页</a>
							</s:else>
							<s:if test="pageBean.hasPre">
								<a href="${pageContext.request.contextPath}/msg/msg_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.currentPage-1 }">上一页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">上一页</a>
							</s:else>

							<s:if test="pageBean.hasNext">
								<a href="${pageContext.request.contextPath}/msg/msg_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.currentPage+1 }">下一页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">下一页</a>
							</s:else>
							<s:if test="pageBean.hasLast">
								<a
									href="${pageContext.request.contextPath}/msg/msg_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.totalPage }">尾页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">尾页</a>
							</s:else>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function search(){
			var uid = $("#uid").val();
			if(uid == ""){
				return;
			}
			document.form1.submit();
		}
	</script>
</body>
</html>