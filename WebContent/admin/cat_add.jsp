<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<style type="text/css">
	.actionMessage{
		padding: 10px 0;
		margin-top: 10px;
		font-size: 17px;
		color: red;
	}
</style>
<script type="text/javascript">
	function check(){
		var name = $("#name").val();
		if(name == ""){
			return;
		}
		$.post("${pageContext.request.contextPath }/cat/cat_check.action",{name:name},function(data,status){
			if(status == "success"){
				if(data == 0){
					$("#btn").attr("disabled",true);
					document.getElementById("checkSpan").innerHTML = "<font style='font-size: 15px;color: red;'>该类别已存在,不可以重复添加！</font>";
				}else if(data == 1){
					$("#btn").attr("disabled",false);
					document.getElementById("checkSpan").innerHTML = "<font style='font-size: 15px;color: green;'>可添加！</font>";
				}
			}
		});
	}
	function del(){
		document.form2.submit();
	}
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>添加果树类别</strong>
		</div>
		<div class="body-content">
	    <form name="form2" class="form-x" action="${pageContext.request.contextPath }/cat/cat_del.action" method="post">
			 <div class="form-group">
          <div class="label">
            <label>已有类别：</label>
          </div>
          <div class="field">
            <select name="id" class="input w50" style="margin-right: 20px;">
            	<s:iterator value="catagories">
              	<option value="${id }">${name }</option>
              </s:iterator>
            </select>
            <div class="tips">
            	<a class="button button-little bg-red" href="javascript:void(0)" onclick="del()">删除</a>
            	<span style="text-align: left;">
            		<s:if test="hasActionMessages()">
            			<s:actionmessage/>
            		</s:if>
            	</span>
            </div>
          </div>
        </div>
			</form>
			<form method="post" class="form-x" action="${pageContext.request.contextPath }/cat/cat_add.action">
				<div class="form-group">
					<div class="label">
						<label>新增类别：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="name" name="name" onmouseout="check()"/>
						<span id="checkSpan" style="font-size: 14px;line-height: 36px; margin-left: 15px;"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit" id="btn">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
