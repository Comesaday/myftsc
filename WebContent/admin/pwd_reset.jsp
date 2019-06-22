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
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
	<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
	<script type="text/javascript">
		function checkPass(){
			var account = $("#account").val();
			var password = $("#password").val();
			if(password ==""){
				$("#password").focus();
				return;
			}
			$.post("${pageContext.request.contextPath }/admin/admin_checkPwd.action",{account:account,password:password},function(data,status){
				if(status=="success"){
					if(data == 0){
						$("#btn").attr("disabled",false);
						$("#renewpass").attr("disabled",false);
						$("#newpass").attr("disabled",false);
						document.getElementById("checkPwd").innerHTML = "<font style='color:green;font-size:15px;'>原始密码正确！</font>";
					}else if(data == 1){
						$("#btn").attr("disabled",true);
						$("#renewpass").attr("disabled",true);
						$("#newpass").attr("disabled",true);
						document.getElementById("checkPwd").innerHTML = "<font style='color:red;font-size:15px;'>原始密码错误！</font>";
					}
				}
			});
		}
		
		function checkNewPwd(){
			var password = $("#password").val();
			var newpass = $("#newpass").val();
			if(password!=""&&newpass!=""){
				if(password==newpass){
					$("#renewpass").attr("disabled",true);
					$("#btn").attr("disabled",true);
					document.getElementById("checkNewPwd").innerHTML = "<font style='color:red;font-size:15px;'>新密码不能和旧密码一样！</font>";
				}else{
					$("#renewpass").attr("disabled",false);
					$("#btn").attr("disabled",false);
					document.getElementById("checkNewPwd").innerHTML = "<font style='color:green;font-size:15px;'>新密码可用！</font>";
				}
			}
		}
		
		function checkTwoPwd(){
			var newpass = $("#newpass").val();
			var renewpass = $("#renewpass").val();
			if(newpass!=""&&renewpass!=""){
				if(renewpass==newpass){
					$("#btn").attr("disabled",false);
					document.getElementById("checkTwoPwd").innerHTML = "<font color='green'>两次输入的密码一致！</font>";
				}else{
					$("#btn").attr("disabled",true);
					document.getElementById("checkTwoPwd").innerHTML = "<font color='red'>两次输入的密码不一致！</font>";
				}
			}
		}
	</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/admin/admin_modInfo.action?id=<s:property value="#session.admin.id"/>">
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="account" name="admin.account" value="<s:property value="#session.admin.account"/>" readonly="readonly">
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="password" name="admin.password" onblur="checkPass()" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />  
          <span id="checkPwd" style="font-size: 14px;line-height: 36px; margin-left: 15px;"></span>     
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="newpass" name="newpass" onblur="checkNewPwd()" placeholder="请输入新密码" data-validate="required:请输入新密码" />         
       	  <span id="checkNewPwd" style="font-size: 14px;line-height: 36px; margin-left: 15px;"></span> 
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="renewpass" name="renewpass" onblur="checkTwoPwd()" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码 "/>          
          <span id="checkTwoPwd" style="font-size: 14px;line-height: 36px; margin-left: 15px;"></span>
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