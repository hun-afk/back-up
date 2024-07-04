<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
boolean auth = (Boolean) session.getAttribute("auth");
if (!auth) {
	response.sendRedirect(application.getContextPath() + "/member/login.jsp");
	return;
}
String authUser = (String) session.getAttribute("auth_user_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: 0 auto;">
		<h2>의견남기기</h2>
		<p style="text-align: right">
			열린공간 &gt; <span style="color: hotpink;">의견남기기</span>
		</p>
		<form action="<%=application.getContextPath()%>/feed/write-handle.jsp">
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>작성자</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=authUser%></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>제목</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="title" type="text"
						style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ccc; padding: 12px;" colspan="2">
						<textarea name="body"
							style="height: 200px; resize : none; 
							width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc"></textarea>
					</td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 10px 20px;">저장</button>
				<button type="reset" style="padding: 10px 20px;">취소</button>
			</div>
		</form>
	</div>
</body>
</html>