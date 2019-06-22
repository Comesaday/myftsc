<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
		<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>发送邮件</title>
	</head>
	<body>
		<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>发送邮件</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" id="form1"
				action="${pageContext.request.contextPath }/email/email_sendEmail.action?tid=<s:property value='gemail.tid'/>">
				<div class="form-group">
					<div class="label">
						<label>果树编号：</label>
					</div>
					<div class="field">
						<input type="text" readonly="readonly" class="input w50" value="<s:property value='gemail.tid'/>"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>发件人：</label>
					</div>
					<div class="field">
						<input type="text" name="user" readonly="readonly" class="input w50" value="<s:property value='#session.adminUser.email'/>"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>收件人：</label>
					</div>
					<div class="field">
						<input type="text" readonly="readonly" name="email" class="input w50" value="<s:property value='gemail.email'/>"/>
					</div>
				</div>
				
				 <div class="form-group">
			        <div class="label">
			          <label>果树图片：</label>
			        </div>
			        <div class="field">
			          <input type="file" id="picture1" onchange="url1.value=this.value" style="display: none;">
			          <input type="text" name="pic1" id="url1" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传图片!"/>
			          <input type="button" onclick="picture1.click()" class="button bg-blue margin-left"  value="+ 浏览上传"  style="float:left;" >
			        </div>
			      </div>  
			      
			       <div class="form-group">
			        <div class="label">
			          <label></label>
			        </div>
			        <div class="field">
			          <input type="file" id="picture2" onchange="url2.value=this.value" style="display: none;">
			          <input type="text" id="url2" name="pic2" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传图片!"/>
			          <input type="button" onclick="picture2.click()" class="button bg-blue margin-left" value="+ 浏览上传"  style="float:left;" >
			        </div>
			      </div>  
			      
			      <div class="form-group">
			        <div class="label">
			          <label></label>
			        </div>
			        <div class="field">
			          <input type="file" id="picture3" onchange="url3.value=this.value" style="display: none;">
			          <input type="text" name="pic3" id="url3" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传图片!"/>
			          <input type="button" onclick="picture3.click()" class="button bg-blue margin-left"  value="+ 浏览上传"  style="float:left;" >
			        </div>
			      </div>  
			      
			      <div class="form-group">
			        <div class="label">
			          <label>视频：</label>
			        </div>
			        <div class="field">
			          <input type="file" id="movie" onchange="url4.value=this.value" style="display: none;">
			          <input type="text" name="movie" id="url4" class="input tips" style="width:25%; float:left;"  data-validate="required:请上传视频!"/>
			          <input type="button" onclick="movie.click()" class="button bg-blue margin-left"  value="+ 浏览上传"  style="float:left;" >
			        </div>
			      </div>  
			      
			      <div class="form-group">
					<div class="label">
						<label>说明：</label>
					</div>
					<div class="field">
						<input type="text" name="detail" class="input"/>
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