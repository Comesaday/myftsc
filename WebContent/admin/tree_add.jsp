<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>新增果树</strong></div>
  <s:if test="hasActionMessages()">
	<div class="panel-head" id="add"><center><s:actionmessage/></center></div>
  </s:if>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/tree/tree_add.action" enctype="multipart/form-data">  
        <div class="form-group">
          <div class="label">
            <label>果树名称：</label>
            <input type="hidden" name="page" value="${page }">
          </div>
          <div class="field">
            <select name="catagory.id" class="input w50">
            <s:iterator value="catagories" var="cat">
              <option value="<s:property value="#cat.id"/>"><s:property value="#cat.name"/></option>
            </s:iterator>
            </select>
            <div class="tips"></div>
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
          <label>认购价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="price" value="" data-validate="member:只能为数字"  />
          <div class="tips"></div>
        </div>
      </div>

	<div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>果树特色：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="tpoint"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>简要介绍：</label>
        </div>
        <div class="field">
          <textarea name="detail" class="input" style="height:120px; border:1px solid #ddd;"></textarea>
          <div class="tips"></div>
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