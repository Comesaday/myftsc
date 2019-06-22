<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<script type="text/javascript">
			function collect(ob,id){
				$.post("${pageContext.request.contextPath }/exp/exp_collect.action",{id:id},function(data,status){
					if(status == 'success'){
						$(ob).parent().prev().text("已签收");
						$(ob).parent().html("<a href=\"${pageContext.request.contextPath }/exp/exp_del.action?id='+id+'\">删除</a>");
					}
				}); 
			}
			
			function del(ob,id){
				$.post("${pageContext.request.contextPath }/exp/exp_del.action",{id:id},function(data,status){
					if(status == 'success'){
						window.location.reload();
					}
				});
			}
		</script>
	</head>
	<body>
		<div class="main-area"> 
			<div class="myinfo">
				<div class="title">我的快递信息</div>
				<div class="exp">
					<table>
						<thead>
							<tr>
								<th>快递单号</th>
								<th>发件时间</th>
								<th>快递状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator var="exp" value="exps">
							<tr>
								<td>${tnum }</td>
								<td>${stime }</td>
								<td>
								<s:if test="#exp.state == 'wait'"><p style="color: red;">待发货</p></s:if>
								<s:elseif test="#exp.state == 'doing'"><p style="color: red;">运输中</p></s:elseif>
								<s:elseif test="#exp.state == 'over'"><p style="color: red;">已签收</p></s:elseif>
								</td>
								<td>
									<s:if test="#exp.state == 'doing'">
										<a href="http://www.ickd.cn" target="_blank">查询</a>
										<a onclick="collect(this,${id})" href="javascript:void(0)">已收货</a>
									</s:if>
									<s:elseif test="#exp.state == 'wait'">不可操作</s:elseif>
									<s:elseif test="#exp.state == 'over'">
										<a target="main" href="javascript:void(0)" onclick="del(this,<s:property value="#exp.id"/>)">删除</a>
									</s:elseif>
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