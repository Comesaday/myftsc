<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
<title>我的评价</title>
</head>
<body>
	<div class="main-area"> 
		<div class="mycmt">
			<div class="title">认购评价</div>
			<div class="cmt">
				<table style="width: 100%;margin-top: 30px;">
					<tbody>
					<tr>
						<td class="td1">果树编号：</td>
						<td class="td2"><s:property value="gcomment.tid"/></td>
					</tr>
					<tr>
						<td class="td1">我的评价：</td>
						<td class="td2"><s:property value="gcomment.comment"/></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>