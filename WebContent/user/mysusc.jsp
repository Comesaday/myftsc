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
				<div class="title">我的认购信息</div>
				<div class="susc">
					<table>
						<thead>
							<tr>
								<th>果树编号</th>
								<th>果树类别</th>
								<th>认购定金</th>
								<th>尾款</th>
								<th>认购时间</th>
								<th>认购状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator var="susc" value="suscs">
							<tr>
								<td>${tree.id }</td>
								<td>${tree.catagory.name }</td>
								<td>${desposit }元</td>
								<td>${other }元</td>
								<td>${stime}</td>
								<td>
								<s:if test="#susc.state == 'wait'"><p style="color: red;">待支付</p></s:if>
								<s:if test="#susc.state == 'cancel'"><p style="color: red;">已取消</p></s:if>
								<s:if test="#susc.state == 'doing'"><p style="color: red;">认购中</p></s:if>
								<s:if test="#susc.state == 'pick'"><p style="color: red;">已采摘</p></s:if>
								<s:if test="#susc.state == 'send'"><p style="color: red;">已发货</p></s:if>
								<s:if test="#susc.state == 'over'"><p style="color: red;">认购完成</p></s:if>
								<s:if test="#susc.state == 'cmtover'"><p style="color: red;">已评价</p></s:if>
								</td>
								<td>
								<s:if test="#susc.state == 'wait'">
									<a target="main" href="${pageContext.request.contextPath }/susc/susc_pay.action?id=${id}">支付</a>
									<a target="main" href="${pageContext.request.contextPath }/susc/susc_cancel.action?id=${id}">取消</a>
								</s:if>
								<s:if test="#susc.state == 'cancel'">
									<a target="main" href="${pageContext.request.contextPath }/susc/susc_del.action?id=${id}">删除</a>
								</s:if>
								<s:if test="#susc.state == 'doing'">请等待</s:if>
								<s:if test="#susc.state == 'pick'">等待发货</s:if>
								<s:if test="#susc.state == 'send'">已发货</s:if>
								<s:if test="#susc.state == 'over'">
									<a target="main" href="${pageContext.request.contextPath }/cmt/cmt_cmtpage.action?user.id=${user.id}&tree.id=${tree.id}">评价</a>
								</s:if>
								<s:if test="#susc.state == 'cmtover'">不可操作</s:if>
								</td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>