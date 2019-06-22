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
		    <div class="panel-head"><strong class="icon-pencil-square-o">评价信息</strong></div>
			    <div class="padding border-bottom">
			      <ul class="search" style="padding-left:10px;">
			        <li>
			        <form action="${pageContext.request.contextPath }/cmt/cmt_search.action" name="form1">
			          <input type="hidden" name="page" value="${pageBean.currentPage }">
			          <input type="text" placeholder="请输入用户编号" id="uid" name="user.id" class="input" style="width:250px; line-height:17px;display:inline-block" />
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
		       	<th>用户编号</th>
		       	<th>评价内容</th>
		        <th>评价时间</th>
		      </tr>
		      <s:iterator var="comment" value="pageBean.list">
		        <tr>
		          <td><s:property value="#comment.id"/></td>
		          <td><s:property value="#comment.user.id"/></td>
		          <td><s:property value="#comment.comment"/></td>
		          <td><s:property value="#comment.ctime"/></td>
		        </tr>
		      </s:iterator>
		      <tr>
		        <td colspan="9">
			        <div class="pagelist"> 
			        	<a>第<s:property value="pageBean.currentPage"/>/<s:property value="pageBean.totalPage"/>页</a>
			        	<s:if test="pageBean.hasFirst">
			        		<a href="${pageContext.request.contextPath}/cmt/cmt_mgr.action?page=1">首页</a>
			        	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">首页</a>
			         	</s:else>
			         	<s:if test="pageBean.hasPre">
			         		<a href="${pageContext.request.contextPath}/cmt/cmt_mgr.action?page=<s:property value='pageBean.currentPage-1'/>">上一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">上一页</a>
			         	</s:else>
				        
				        <s:if test="pageBean.hasNext">
			         		<a href="${pageContext.request.contextPath}/cmt/cmt_mgr.action?page=<s:property value='pageBean.currentPage+1'/>">下一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">下一页</a>
			         	</s:else> 
				        <s:if test="pageBean.hasLast">
			         		<a href="${pageContext.request.contextPath}/cmt/cmt_mgr.action?page=<s:property value='pageBean.totalPage'/>">尾页</a> 
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