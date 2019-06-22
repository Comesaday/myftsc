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
		<style type="text/css">
		.dialog{   
			background:blue;
		 	width: 500px;
		    height: 200px;
		    border-radius: 5px;
		    position: absolute;
		    left: 30%;
		    bottom: 30%;
		    background: #eee;
		    line-height: 40px;
		    text-align: center;
		    display: none;
		    font-size:16px;
		}
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
		<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
	</head>
	<body>	
		  <div class="panel admin-panel">
		    <div class="panel-head"><strong class="icon-pencil-square-o">基本信息</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
		    <form method="post" action="${pageContext.request.contextPath }/user/user_findByAccount.action" id="form1" name="form1">
			    <div class="padding border-bottom">
			      <ul class="search" style="padding-left:10px;">
			      	<li>查找用户信息:</li>
			        <li>
			          <input type="text" placeholder="请输入用户名" id="account" name="account" class="input" style="width:250px; line-height:17px;display:inline-block" />
			          <input type="button" id="search" class="button border-main icon-search" value="搜索"/>
			        </li>
		        	<s:if test="hasActionMessages()">
		        	  <li style="color: red;font-size: 18px;">
		        	     <s:actionmessage/>
		        	  </li>
		        	</s:if>
			      </ul>
			    </div>
			</form>
			
			<form action="tree_delBatchTree.action" method="post" id="treeInfo" name="form2"> 
		    <table class="table table-hover text-center">
		       <tr>
		        <th>编号</th>
		        <th>用户名</th>
		        <th>姓名</th>
		        <th>地址</th>
		        <th>联系方式</th>
		        <th>邮箱</th>
		        <th>操作</th>
		      </tr>
		      <s:iterator value="pageBean.list">
		        <tr>
		          <td>${id }</td>
		          <td>${account }</td>
		          <td>${name }</td>
		          <td>${address }</td>
		          <td>${phone }</td>
		          <td>${email }</td>
		          <td style="width:18%;">
		          	<a class="button button-little bg-green" href="${pageContext.request.contextPath }/user/user_modUserPage.action?id=${id }">修改</a>
		          </td>
		        </tr>
		      </s:iterator>
		      <tr>
		        <td colspan="9">
			        <div class="pagelist"> 
			        	<a>第<s:property value="pageBean.currentPage"/>/<s:property value="pageBean.totalPage"/>页</a>
			        	<s:if test="pageBean.hasFirst">
			        		<a href="${pageContext.request.contextPath}/user/user_mgr.action?page=1">首页</a>
			        	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">首页</a>
			         	</s:else>
			         	<s:if test="pageBean.hasPre">
			         		<a href="${pageContext.request.contextPath}/user/user_mgr.action?page=<s:property value='pageBean.currentPage-1'/>">上一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">上一页</a>
			         	</s:else>
				        
				        <s:if test="pageBean.hasNext">
			         		<a href="${pageContext.request.contextPath}/user/user_mgr.action?page=<s:property value='pageBean.currentPage+1'/>">下一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">下一页</a>
			         	</s:else> 
				        <s:if test="pageBean.hasLast">
			         		<a href="${pageContext.request.contextPath}/user/user_mgr.action?page=<s:property value='pageBean.totalPage'/>">尾页</a> 
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">尾页</a> 
			         	</s:else> 
			        </div>
		        </td>
		      </tr>
		    </table>
		    </form>
		  </div>
		  <script type="text/javascript">
		  $("#search").click(function(){
			  if($("#account").val() ==""){
				  return;
			  }
			  $("#form1").submit();
		  });
		  </script>
	</body>
</html>