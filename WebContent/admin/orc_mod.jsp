<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改果园信息</strong></div>
  <div class="body-content">
  <form action="${pageContext.request.contextPath }/orc/orc_modInfo.action" class="form-x" method="post" enctype ="multipart/form-data">
      
      <input type="hidden" name="id" value="<s:property value='gorchard.id'/>"/>
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" value="<s:property value='gorchard.name'/>" class="input w50" name="name" data-validate="required:请输入果园名称" />
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>宣传视频：</label>
        </div>
        <div class="field">
          <input type="file" id="movie" name="picture" onchange="url.value=this.value" style="display: none;">
          <input type="text" id="url" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传宣传视频!"/>
          <input type="button" onclick="movie.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;" >
        </div>
      </div> 
      
      <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture1" name="picture" onchange="url1.value=this.value" style="display: none;" value="<s:property value='gorchard.name'/>"/>
          <input type="text" id="url1" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture1.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;"/>
        </div>
      </div>  
      
        <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture2" name="picture" style="display: none;" onchange="url2.value=this.value">
          <input type="text" id="url2" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture2.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div>  
      
        <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture3" name="picture" style="display: none;" onchange="url3.value=this.value">
          <input type="text" id="url3" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture3.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div> 
      
       <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture4" name="picture" style="display: none;" onchange="url4.value=this.value">
          <input type="text" id="url4" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture4.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div> 
      
       <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture5" name="picture" style="display: none;" onchange="url5.value=this.value">
          <input type="text" id="url5" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture5.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <input type="file" id="picture6" name="picture" style="display: none;" onchange="url6.value=this.value">
          <input type="text" id="url6" class="input tips" style="width:25%; float:left;" data-validate="required:请上传图片!"/>
          <input type="button" onclick="picture6.click()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <input type="text" value="<s:property value='gorchard.address'/>" class="input w50" name="address" data-validate="required:请填写地址！" />
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>网址：</label>
        </div>
        <div class="field">
          <input type="text" value="<s:property value='gorchard.web'/>" class="input w50" name="web" data-validate="required:请填写网址！" />
        </div>
      </div>

	 <div class="form-group">
        <div class="label">
          <label>特色：</label>
        </div>
        <div class="field">
          <input type="text"  value="<s:property value='gorchard.opoint'/>"class="input" name="opoint"  data-validate="required:请填写特色！" />
        </div>
      </div>


      <div class="form-group">
        <div class="label">
          <label>详细信息：</label>
        </div>
        <div class="field">
          <textarea class="input" name="detail" style=" height:100px;" data-validate="required:请填写详细信息！" >
          	<s:property value="gorchard.detail"/>
          </textarea>
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