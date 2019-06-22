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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>基本信息</strong></div>
  <div class="panel-head" id="add" style="text-align: right;padding:5px;">
  	<a class="button border-main" style="margin-right:20px;" href="${pageContext.request.contextPath }/orc/orc_delInfo.action">删除果园信息</a>
  	<a class="button border-main" style="margin-right:60px;" href="${pageContext.request.contextPath }/orc/orc_modInfoPage.action">修改果园信息</a>
  </div>
  <div class="body-content">
  <div class="form-x">
      
       <div class="form-group" style="margin-bottom: 20px;">
        <div class="label">
          <label>宣传视频：</label>
        </div>
        <div class="field">
        	<video controls="controls" style="width:400px; height:200px; object-fit: fill">
				<source src="${pageContext.request.contextPath}/images/orc-img/<s:property value="gorchard.movie"/>" type="audio/mp4">
			</video>
        </div>
      </div>  
      
      <div class="form-group" style="margin-bottom: 20px;">
        <div class="label">
          <label>果园图片：</label>
        </div>
        <div class="field">
          <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture1'/>">
       	  <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture2'/>">
       	  <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture3'/>">
       	  <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture4'/>">
       	  <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture5'/>">
       	  <img style="width:100px;height:100px;margin-right: 30px;" src="${pageContext.request.contextPath }/images/orc-img/<s:property value='gorchard.picture6'/>">
        </div>
      </div>  

			<div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" disabled="disabled" value="<s:property value='gorchard.name'/>" class="input w50" data-validate="required:请输入果园名称" />
        </div>
      </div>

       <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <input type="text" disabled="disabled" value="<s:property value='gorchard.address'/>" class="input w50" data-validate="required:请填写地址！" />
        </div>
      </div>
      
      
       <div class="form-group">
        <div class="label">
          <label>网址：</label>
        </div>
        <div class="field">
          <input type="text" disabled="disabled" value="<s:property value='gorchard.web'/>" class="input w50" data-validate="required:请填写地址！" />
        </div>
      </div>

			 <div class="form-group">
        <div class="label">
          <label>特色：</label>
        </div>
        <div class="field">
          <input type="text" disabled="disabled" value="<s:property value='gorchard.opoint'/>" class="input" data-validate="required:请填写特色！" />
        </div>
      </div>


      <div class="form-group">
        <div class="label">
          <label>详细信息：</label>
        </div>
        <div class="field">
          <textarea class="input" disabled="disabled" style=" height:90px;" data-validate="required:请填写详细信息！" >
            <s:property value="gorchard.detail"/>
          </textarea>
        </div>
      </div>
	</div>
  </div>
</div>
</body>
</html>