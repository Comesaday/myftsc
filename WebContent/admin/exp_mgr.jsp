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
			    <strong class="icon-pencil-square-o">
			   		快递信息
			    </strong>
		    </div>
			    <div class="padding border-bottom">
			      <ul class="search" style="padding-left:10px;">
			      	<li>请输入果树编号:</li>
			        <li>
			        <form action="${pageContext.request.contextPath }/exp/exp_search.action" name="form1">
			          <input type="hidden" name="page" value="${pageBean.currentPage }">
			          <input type="text" placeholder="请输入用户编号" id="tid" name="user.id" class="input" style="width:250px; line-height:17px;display:inline-block" />
			          <input type="button" class="button border-main icon-search" onclick="search()" value="搜索"/>
			       </form>
			        </li>
		        	<s:if test="hasActionMessages()">
		        	  <li style="color: red;font-size: 18px;">
		        	     <s:actionmessage/>
		        	  </li>
		        	</s:if>
			      </ul>
			    </div>
		    <table class="table table-hover text-center">
		     <tr>
			      <th>编号</th>
			      <th>运单号</th>
				    <th>发件时间</th>
				    <th>状态</th>
				    <th>操作</th>
		      </tr>
		      <s:iterator var="express" value="pageBean.list">
		        <tr>
		          <td>${id }</td>
		          <td>${tnum }</td>
			        <td>${stime }</td>
			      <td>
			      	<s:if test="#express.state == 'wait'">待发货</s:if>
			      	<s:elseif test="#express.state == 'doing'">已发货</s:elseif>
			      	<s:elseif test="#express.state == 'over'">已签收</s:elseif>
			      </td>
			       <td>
			      	<s:if test="#express.state == 'wait'">
			      		 <a class="button button-little bg-blue" href="${pageContext.request.contextPath}/exp/exp_sendexppage.action?page=${pageBean.currentPage }&id=${id}">发货</a>
			      	</s:if>
			      	<s:elseif test="#express.state == 'doing'">
			      		 <a class="button button-little bg-blue" href="http://www.ickd.cn" target="_blank">查询</a>
			      	</s:elseif>
			      	<s:elseif test="#express.state == 'over'">
						 			 <a class="button button-little bg-red" href="${pageContext.request.contextPath}/exp/exp_del.action?page=${pageBean.currentPage }&id=${id}">删除</a>
							</s:elseif>
			      </td>
		        </tr>
		      </s:iterator>
		      <tr>
		        <td colspan="11">
			        <div class="pagelist"> 
			        	<a>第<s:property value="pageBean.currentPage"/>/<s:property value="pageBean.totalPage"/>页</a>
			        	<s:if test="pageBean.hasFirst">
			        		<a href="${pageContext.request.contextPath}/exp/exp_mgr.action?page=1">首页</a>
			        	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">首页</a>
			         	</s:else>
			         	<s:if test="pageBean.hasPre">
			         		<a href="${pageContext.request.contextPath}/exp/exp_mgr.action?page=<s:property value='pageBean.currentPage-1'/>">上一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">上一页</a>
			         	</s:else>
				        
				        <s:if test="pageBean.hasNext">
			         		<a href="${pageContext.request.contextPath}/exp/exp_mgr.action?page=<s:property value='pageBean.currentPage+1'/>">下一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">下一页</a>
			         	</s:else> 
				        <s:if test="pageBean.hasLast">
			         		<a href="${pageContext.request.contextPath}/exp/exp_mgr.action?page=<s:property value='pageBean.totalPage'/>">尾页</a> 
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