<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>编辑信息</strong></div>
  <div class="body-content">
  <form action="${pageContext.request.contextPath }/msg/msg_send.action" class="form-x" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>目标客户：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="user.id" value="${user.id }" readonly="readonly"/>
          <input type="hidden" name="page" value="${page }"/>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>目标果树：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tree.id" value="${tree.id }" readonly="readonly"/>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>宣传视频：</label>
        </div>
        <div class="field">
          <input type="file" id="movie1" name="picture" onchange="url.value=this.value" style="display: none;">
          <input type="text" id="url" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传宣传视频!"/>
          <input type="button" onclick="movie1.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;" >
        </div>
      </div>  
      
      <div class="form-group">
        <div class="label">
          <label>果树图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture1" name="picture" onchange="url1.value=this.value" style="display: none;">
          <input type="text" id="url1" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture1.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;" >
        </div>
      </div>  
      
        <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <input type="file" id="picture2" name="picture" style="display: none;" onchange="url2.value=this.value">
          <input type="text" id="url2" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture2.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div>  
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <input type="file" id="picture3" name="picture" style="display: none;" onchange="url3.value=this.value">
          <input type="text" id="url3" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture3.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div>  

      <div class="form-group">
        <div class="label">
          <label>果树描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="content" style=" height:100px;" data-validate="required:请填写果树描述信息！" ></textarea>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
	</form>
  </div>
</div>
</body>
</html>