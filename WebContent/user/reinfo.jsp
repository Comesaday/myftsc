<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/operate.js" ></script>
		<script type="text/javascript">
		function checkName(){
			var phone = $("#name").val();
			if(phone == ""){
				document.getElementById("sp4").innerHTML = "<font style='color:red;font-size:15px;'>姓名不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp4").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkPhone(){
			var phone = $("#phone").val();
			if(phone == ""){
				document.getElementById("sp5").innerHTML = "<font style='color:red;font-size:15px;'>联系方式不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp5").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkEmail(){
			var email = $("#email").val();
			if(email == ""){
				document.getElementById("sp6").innerHTML = "<font style='color:red;font-size:15px;'>邮箱不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp6").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		function checkAddress(){
			var address = $("#address").val();
			if(address == ""){
				document.getElementById("sp7").innerHTML = "<font style='color:red;font-size:15px;'>地址不能为空！</font>";
				$("#btn").attr("disabled",true);
				return;
			}else{
				document.getElementById("sp7").innerHTML = "";
				$("#btn").attr("disabled",false);
			}
		}
		</script>
	</head>
	<body>
		<div class="main-area">
			<div class="regist text">
				<div class="title">修改个人信息</div>
				<form action="${pageContext.request.contextPath }/user/user_reinfo.action?id=${user.id}" method="post">
					<s:if test="hasActionMessages()">
						<s:actionmessage/>
					</s:if>
					<input type="hidden" name="password" value="${user.password }">
					<input type="hidden" name="sex" value="${user.sex }">
					<input type="hidden" name="isvip" value="${user.isvip }">
					<input type="hidden" name="state" value="${user.state }">
					<table>
						<tbody>
							<tr>
								<th>账户：</th>
								<td><input type="text" value="${user.account }" readonly="readonly" id="account" name="account" placeholder="填写用户名"></td>
							</tr>
							<tr>
								<th>姓名：</th>
								<td><input type="text" onblur="checkName()" id="name" value="${user.name }" name="name" placeholder="输入姓名"><span id="sp4"></span></td>
							</tr>
							<tr>
								<th>电话号码：</th>
								<td><input type="text" onblur="checkPhone()" id="phone" value="${user.phone }" name="phone" placeholder="输入电话号码"><span id="sp5"></span></td>
							</tr>
							<tr>
								<th>邮箱：</th>
								<td><input type="text" onblur="checkEmail()" id="email" name="email" value="${user.email }" placeholder="输入邮箱地址"><span id="sp6"></span></td>
							</tr>
							<tr>
								<th>居住地址：</th>
								<td><input type="text" onblur="checkAddress()" id="address" value="${user.address }" name="address" placeholder="输入居住地址"><span id="sp7"></span></td>
							</tr>
							<tr>
								<th></th>
								<td><input type="submit" id="btn" style="border: 0;padding: 6px 25px;background: #027B00;" value="修    改"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>