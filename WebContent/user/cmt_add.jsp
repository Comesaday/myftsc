<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
<title>认购评价</title>
</head>
<body>
	<div class="main-area"> 
		<div class="mycmt">
			<div class="title">认购评价</div>
			<div class="cmt">
				<form id="form1" name="form1" action="${pageContext.request.contextPath }/cmt/cmt_comment.action" method="post" enctype="multipart/form-data">
					<input type="hidden" name="user.id" value="${user.id }">
					<input type="hidden" name="tree.id" value="${tree.id }">
					<table style="width: 100%;margin-top: 40px;">
						<tbody>
						<tr>
							<td class="td1">图片：</td>
							<td class="td2">
								 <input type="file" id="picture1" name="picture" onchange="url1.value=this.value" style="display: none;">
          			 <input type="text" id="url1" class="input tips" style="width:25%; float:left;"/>
          			 <input type="button" onclick="picture1.click()" value="+ 浏览上传"/>
							</td>
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2">
								 <input type="file" id="picture2" name="picture" onchange="url2.value=this.value" style="display: none;">
          			 <input type="text" id="url2" class="input tips" style="width:25%; float:left;"/>
          			 <input type="button" onclick="picture2.click()" value="+ 浏览上传"/>
							</td>
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2">
								 <input type="file" id="picture3" name="picture" onchange="url3.value=this.value" style="display: none;">
          			 <input type="text" id="url3" style="width:25%; float:left;"/>
          			 <input type="button" onclick="picture3.click()" value="+ 浏览上传"/>
							</td>
						</tr>
						<tr>
							<td class="td1">评价</td>
							<td class="td2">
								<textarea name="comment" style="width: 425px;height: 130px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2"><input type="submit" style="border: 0;background: #027B00;width: 100px; height: 30px;margin-top: 30px;" value="确认"></td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>