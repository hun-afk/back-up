<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰남기기</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/review/write-result.jsp">
		<input type="text" name="writer"/>
		<input type="text" name="message"/>
		<input type="text" name="score"/>
		<button type="submit">리뷰</button>
	</form>
</body>
</html>