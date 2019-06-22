<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
		<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
	</head>
	<body>	
		  <div class="panel admin-panel">
		    <div class="panel-head">
		    	<strong class="icon-pencil-square-o">认购信息</strong>
		    </div>
			    <div class="padding border-bottom">
			     	<form name="form1" action="${pageContext.request.contextPath }/susc/susc_search.action" method="post">
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
		       	<th>客户编号</th>
		       	<th>果树类别</th>
		        <th>认购定金</th>
		        <th>认购时间</th>
		        <th>认购状态</th>
		        <th>操作</th>
		      </tr>
		      <s:iterator var="susc" value="pageBean.list">
		        <tr>
		          <td>${id }</td>
		          <td>${user.id }</td>
		          <td>${tree.catagory.name }</td>
		          <td>${desposit }</td>
		          <td>${stime }</td>
		          <td>
		          	<s:if test="#susc.state == 'wait'">待支付</s:if>
		          	<s:if test="#susc.state == 'cancel'">已取消</s:if>
		          	<s:if test="#susc.state == 'doing'">认购中</s:if>
								<s:elseif test="#susc.state == 'pick'">已采摘</s:elseif>
								<s:elseif test="#susc.state == 'send'">已发货</s:elseif>
								<s:elseif test="#susc.state == 'over'">认购完成</s:elseif>
								<s:elseif test="#susc.state == 'cmtover'">认购完成</s:elseif>
		          </td>
		          <td style="width:18%;">
		          <s:if test="#susc.state == 'wait'">等待付款</s:if>
		          <s:if test="#susc.state == 'cancel'">等待处理</s:if>
		          <s:if test="#susc.state == 'doing'">
			    			<a id="pick" class="button button-little bg-green" onclick="pick(${id},${pageBean.currentPage })" href="javascript:void(0)">收获</a>
		          	<s:if test="#susc.user.isvip == true and #susc.message == false">
		          			<a class="button button-little bg-green" href="${pageContext.request.contextPath }/msg/msg_sendpage.action?user.id=${user.id}&tree.id=${tree.id}&page=${pageBean.currentPage}">发消息</a>
		          	</s:if>
		          </s:if>
		          <s:elseif test="#susc.state == 'pick'">
		          	待发货
		          </s:elseif>
		          <s:elseif test="#susc.state == 'over'">
		            	不可操作
		          </s:elseif>
		          <s:elseif test="#susc.state == 'send'">
		            	不可操作
		          </s:elseif>
		           <s:elseif test="#susc.state == 'cmtover'">
		            	不可操作
		          </s:elseif>
		          </td>
		       </tr>
		      </s:iterator>
		      <tr>
		        <td colspan="9">
			        <div class="pagelist"> 
			        	<a>第${pageBean.currentPage }/${pageBean.totalPage }页</a>
			        	<s:if test="pageBean.hasFirst">
			        		<a href="${pageContext.request.contextPath}/susc/susc_mgr.action?page=1">首页</a>
			        	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">首页</a>
			         	</s:else>
			         	<s:if test="pageBean.hasPre">
			         		<a href="${pageContext.request.contextPath}/susc/susc_mgr.action?page=${pageBean.currentPage - 1}">上一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">上一页</a>
			         	</s:else>
				        
				        <s:if test="pageBean.hasNext">
			         		<a href="${pageContext.request.contextPath}/susc/susc_mgr.action?page=${pageBean.currentPage + 1}">下一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">下一页</a>
			         	</s:else> 
				        <s:if test="pageBean.hasLast">
			         		<a href="${pageContext.request.contextPath}/susc/susc_mgr.action?page=${pageBean.totalPage}">尾页</a> 
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">尾页</a> 
			         	</s:else> 
			        </div>
		        </td>
		      </tr>
		    </table>
		  </div>
		  <script type="text/javascript">
		  function pick(id,page){
			  if(confirm("您确定果实已采摘完成吗?")){
					var href="${pageContext.request.contextPath}/susc/susc_pick.action?page="+page+"&id="+id;
					window.location.href=href;
				}
		  }
		  //搜索提示
		  function search(){
			  var uid = $("#uid").val();
			  if(uid ==""){
				  alert("请输入用户编号！");
				  return;
			  }
			 document.form1.submit();
		  }

		</script>
	</body>
</html>