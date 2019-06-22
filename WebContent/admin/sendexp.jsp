<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>填写快递信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
	<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span>填写快递单号</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/exp/exp_addexp.action">
      <div class="form-group">
        <div class="label">
          <label for="sitename">收件人姓名：</label>
        </div>
        <div class="field">
        	<input type="hidden" name="id" value="${express.id }">
        	<input type="hidden" name="tree.id" value="${express.tree.id }">
          <input type="text" class="input w50" value="${express.user.name }" readonly="readonly">
        </div>
      </div>  
      
        <div class="form-group">
        <div class="label">
          <label for="sitename">收件人电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${express.user.phone }" readonly="readonly">
        </div>
      </div> 
      
        <div class="form-group">
        <div class="label">
          <label for="sitename">收件人地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${express.user.address }" readonly="readonly">
        </div>
      </div> 
      
        <div class="form-group">
        <div class="label">
          <label for="sitename">收件人邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${express.user.email }" readonly="readonly">
        </div>
      </div> 
      
      <div class="form-group">
        <div class="label">
          <label for="sitename">快递单号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tnum">
        </div>
      </div> 
      
        <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" id="btn"> 提交</button>   
        </div>
      </div> 
    </form>
  </div>
</div>
</body>
</html>