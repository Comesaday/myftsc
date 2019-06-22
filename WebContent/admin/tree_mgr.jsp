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
				<strong class="icon-reorder">果树信息</strong>
			</div>
			<div class="padding border-bottom">
			<form name="form1" action="${pageContext.request.contextPath }/tree/tree_mgr.action" method="post">
				<ul class="search" style="padding-left: 10px;">
					<li>类别：</li>
					<li style="margin-left: 0px;">
						<s:set var="cid" value="cid"></s:set>
						<s:set var="state" value="state"></s:set>
						<select name="catagory.id" class="input"  style="width: 200px; line-height: 17px;">
							<option value=""> 请选择</option>
							<s:iterator value="catagories">
								<s:if test="%{id == #cid}">
									<option value="${id }" selected="selected">${name }</option>
								</s:if>
								<s:else>
									<option value="${id }">${name }</option>
								</s:else>
							</s:iterator>	
						</select>
					</li>
					<li>状态：</li>
					<li style="margin-left: 0px;">
						<select name="state" class="input"  style="width: 200px; line-height: 17px;">
							<option value="all"> 请选择</option>
							<option value="not">待分配</option>
							<option value="can">可认购</option>
							<option value="wait">待认购</option>
							<option value="doing">认购中</option>
						</select>
					</li>
					<li>
						<a href="javascript:void(0)" class="button border-main icon-search" onclick="findByName()">搜索</a>
					</li>
					<li style="color: red;font-size: 18px;">
						<s:if test="hasActionMessages()">
							<s:actionmessage/>
						</s:if>
					</li>
					<li style="float: right; margin-right: 60px;">
						<a href="${pageContext.request.contextPath }/cat/cat_addpage.action?catagory.id=${catagory.id}&state=${state}&page=${pageBean.currentPage}" class="button border-main">添加类别</a>
						<a href="${pageContext.request.contextPath }/tree/tree_addpage.action?catagory.id=${catagory.id}&state=${state}&page=${pageBean.currentPage}" class="button border-main">添加果树</a>
					</li>
				</ul>
			</form>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>编号</th>
					<th>果树名称</th>
					<th>果树图片</th>
					<th>果树价格</th>
					<th>果树特色</th>
					<th>果树状态</th>
					<th>操作</th>
				</tr>
				<s:iterator var="tree" value="pageBean.list">
					<tr>
						<td><s:property value="#tree.id" /></td>
						<td><s:property value="#tree.catagory.name" /></td>
						<td><img style="width: 30px;height:30px;" src="${pageContext.request.contextPath }/images/tree-img/<s:property value='#tree.picture1'/>"></td>
						<td><s:property value="#tree.price" /></td>
						<td><s:property value="#tree.tpoint" /></td>
						<td>
							<s:if test="#tree.state == 'not'">
								不可认购
							</s:if>
							<s:if test="#tree.state == 'can'">
								可认购
							</s:if>
							<s:if test="#tree.state == 'doing'">
								认购中
							</s:if>
							<s:if test="#tree.state == 'wait'">
								待认购
							</s:if>
						</td>
						<td style="width: 18%;">
							<s:if test="#tree.state == 'not'">
							<a class="button button-little bg-green" href="${pageContext.request.contextPath }/tree/tree_susc.action?catagory.id=${cid }&state=${state1 }&id=${id}&page=${pageBean.currentPage }">对外认购</a>
							<a class="button button-little bg-red" href="${pageContext.request.contextPath }/tree/tree_del.action?catagory.id=${cid }&state=${state1 }&id=${id}&page=${pageBean.currentPage }">删除</a>&nbsp;
							<a class="button button-little bg-green" href="${pageContext.request.contextPath }/tree/tree_modpage.action?catagory.id=${cid }&state=${state1 }&id=${id}&page=${pageBean.currentPage }">修改</a>
							</s:if>
							<s:if test="#tree.state == 'can'">
							<a class="button button-little bg-red" href="${pageContext.request.contextPath }/tree/tree_del.action?catagory.id=${cid }&state=${state1 }&id=${id}&page=${pageBean.currentPage }">删除</a>&nbsp;
							<a class="button button-little bg-green" href="${pageContext.request.contextPath }/tree/tree_modpage.action?catagory.id=${cid }&state=${state1 }&id=${id}&page=${pageBean.currentPage }">修改</a>
							</s:if>
							<s:if test="#tree.state == 'doing'">
								不可操作
							</s:if>
							<s:if test="#tree.state == 'wait'">
								不可操作
							</s:if>
						</td>
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
								<a
									href="${pageContext.request.contextPath}/tree/tree_mgr.action?state=${state1 }&catagory.id=${cid }&page=1">首页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">首页</a>
							</s:else>
							<s:if test="pageBean.hasPre">
								<a
									href="${pageContext.request.contextPath}/tree/tree_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.currentPage-1 }">上一页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">上一页</a>
							</s:else>

							<s:if test="pageBean.hasNext">
								<a href="${pageContext.request.contextPath}/tree/tree_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.currentPage+1 }">下一页</a>
							</s:if>
							<s:else>
								<a style="color: red" href="javascript:void(0)">下一页</a>
							</s:else>
							<s:if test="pageBean.hasLast">
								<a
									href="${pageContext.request.contextPath}/tree/tree_mgr.action?state=${state1 }&catagory.id=${cid }&page=${pageBean.totalPage }">尾页</a>
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
	
	function findByName(){
		document.form1.submit();
	}
	
	function findByStatus(){
		document.form2.submit();
	}
	</script>
</body>
</html>