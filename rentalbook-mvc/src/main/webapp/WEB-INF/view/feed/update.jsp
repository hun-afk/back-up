<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	FeedDao feedDao = new FeedDao();
	Feed feed = feedDao.findByNo(no);
	if(feed== null || feed.writerId() == null || !feed.writerId().equals(session.getAttribute("auth_user_id"))) {
		out.println("<script>");
		out.println("window.alert(\"수정권한이 없습니다.\")");
		out.println("history.go(-1);");
		out.println("</script>");
	}else{
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
		<form action="<%=application.getContextPath()%>/feed/update-handle.jsp">
			<input type="hidden" name="no" value="<%=feed.no() %>"/>
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>작성자</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=feed.writerId() %></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>제목</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="title" type="text" value="<%=feed.title() %>"
						style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ccc; padding: 12px;" colspan="2">
						<textarea name="body" 
							style="height: 200px; resize : none; 
							width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc"><%=feed.body() %></textarea>
					</td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 10px 20px;">변경</button>
				<button type="reset" style="padding: 10px 20px;">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
<%}%>