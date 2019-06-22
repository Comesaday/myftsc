<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<script>
			function check(){
				var id = "<s:property value='#session.user.id'/>";
				var newpass = $("#newpass").val();
				if($("#password").val() == ""){
					document.getElementById("t1").innerHTML = "<font style='color:red;font-size:15px;'>请填写原始密码！</font>";
					return;
				}else if($("#newpass").val() == ""){
					document.getElementById("t2").innerHTML = "<font style='color:red;font-size:15px;'>请填写新密码！</font>";
					return;
				}else if($("#renewpass").val() == ""){
					document.getElementById("t3").innerHTML = "<font style='color:red;font-size:15px;'>请再次填写新密码！</font>";
					return;
				}else if($("#renewpass").val() == $("#password").val()){
					document.getElementById("t2").innerHTML = "<font style='color:red;font-size:15px;'>新密码不能旧密码相同！</font>";
					return;
				}else if($("#renewpass").val() != $("#newpass").val()){
					document.getElementById("t3").innerHTML = "<font style='color:red;font-size:15px;'>两次输入的密码不一致！</font>";
					return;
				}
				document.form1.submit();
			}
			function checkOldPass(){
				var account = $("#account").val();
				var password = $("#password").val();
				$.post("${pageContext.request.contextPath}/user/user/user_check.action",{account:account,password:password},function(data,status){
					if(status=="success"){
						if(data == '1'){
							$("#sure").attr("disabled",false);
							$("#renewpass").attr("disabled",false);
							$("#newpass").attr("disabled",false);
							document.getElementById("t1").innerHTML = "<font style='color:green;font-size:15px;'>原始密码正确！</font>";
						}else if(data == '0'){
							$("#sure").attr("disabled",true);
							$("#renewpass").attr("disabled",true);
							$("#newpass").attr("disabled",true);
							document.getElementById("t1").innerHTML = "<font style='color:red;font-size:15px;'>原始密码错误！</font>";
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<div class="main-area"> 
			<div class="myinfo">
				<div class="title">修改密码</div>
				<div class="pwd">
				<form name="form1" action="${pageContext.request.contextPath }/user/user_repwd.action?id=<s:property value="#session.user.id"/>" method="post">
					<table style="margin-top: 35px;" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="td1">用户名</td>
								<td class="td2"><input type="text" id="account" name="account" value="<s:property value="#session.user.account"/>" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="td1">原始密码</td>
								<td class="td2"><input type="text" id="password" onblur="checkOldPass()" name="password"><span id="t1"></span></td>
							</tr>
							<tr>
								<td class="td1">新密码</td>
								<td class="td2"><input type="text" id="newpass" name="newpass"><span id="t2"></span></td>
							</tr>
							<tr>
								<td class="td1">确认密码</td>
								<td class="td2"><input type="text" id="renewpass" name="renewpass"><span id="t3"></span></td>
							</tr>
							<tr>
								<td class="td1"></td>
								<td class="td2"><span id="t4"></span></td>
							</tr>
							<tr>
								<td class="td1"></td>
								<td class="td2">
									<a style="margin-left: 30px;" id="sure" target="_self" onclick="check()" href="javascript:void(0)">确定</a>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>