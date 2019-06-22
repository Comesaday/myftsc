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
		    <strong class="icon-pencil-square-o">订单信息</strong>
		   </div>
			    <div class="padding border-bottom">
			      <ul class="search" style="padding-left:10px;">
			      	<li>请输入用户编号:</li>
			        <li>
			        <form action="${pageContext.request.contextPath }/order/order_searchById.action" name="form1">
			          <input type="hidden" name="flag" value="<s:property value="flag"/>">
			          <input type="text" placeholder="请输入用户编号" name="uid" class="input" style="width:250px; line-height:17px;display:inline-block" />
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
		       	<th>订单号</th>
		        <th>下单时间</th>
		        <th>交易金额</th>
		        <th>订单状态</th>
		      </tr>
		      <s:iterator var="order" value="pageBean.list">
		        <tr>
		          <td><s:property value="#order.id"/></td>
		          <td><s:property value="#order.uid"/></td>
		          <td><s:property value="#order.onum"/></td>
		          <td><s:property value="#order.otime"/></td>
		          <td><s:property value="#order.omoney"/></td>
		          <td>
		          <s:if test="#order.state == 'wait'">待支付</s:if>
		          <s:elseif test="#order.state == 'pay'">已支付</s:elseif>
		          <s:elseif test="#order.state == 'over'">已完成</s:elseif>
		          <s:elseif test="#order.state == 'cancel'">已取消</s:elseif>
		          </td>
		        </tr>
		      </s:iterator>
		      <tr>
		        <td colspan="9">
			        <div class="pagelist"> 
			        	<a>第<s:property value="pageBean.currentPage"/>/<s:property value="pageBean.totalPage"/>页</a>
			        	<s:if test="pageBean.hasFirst">
			        		<a href="${pageContext.request.contextPath}/order/order_mgr.action?age=1">首页</a>
			        	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">首页</a>
			         	</s:else>
			         	<s:if test="pageBean.hasPre">
			         		<a href="${pageContext.request.contextPath}/order/order_mgr.action?age=<s:property value='pageBean.currentPage-1'/>">上一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">上一页</a>
			         	</s:else>
				        
				        <s:if test="pageBean.hasNext">
			         		<a href="${pageContext.request.contextPath}/order/order_mgr.action?page=<s:property value='pageBean.currentPage+1'/>">下一页</a>
			         	</s:if>
			         	<s:else>
			         		<a style="color:red" href="javascript:void(0)">下一页</a>
			         	</s:else> 
				        <s:if test="pageBean.hasLast">
			         		<a href="${pageContext.request.contextPath}/order/order_mgr.action?page=<s:property value='pageBean.totalPage'/>">尾页</a> 
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
			  if(document.form1.uid.value ==""){
				  alert("请输入用户编号！");
				  document.form1.uid.focus();
				  return;
			  }
			 document.form1.submit();
		  }
     	//单个删除
		function delTree(id,page){
			if(confirm("您确定要删除吗?")){
				var href="tree_delTree.action?id="+id+"&&currentPage="+page;
				window.location.href=href;
			}
		}
		
		//全选
		$("#checkall").click(function(){ 
		  $("input[name='ids']").each(function(){
			  if (this.checked) {
				  this.checked = false;
			  }
			  else {
				  this.checked = true;
			  }
		  });
		})
		
		//批量删除
		function DelSelect(){
			if(confirm("您确定要删除这些数据吗?")){
				document.form2.submit();
			}
		}
		</script>
	</body>
</html>