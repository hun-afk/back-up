<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${empty title }">
		<title>핏투게더</title>
	</c:when>
	<c:otherwise>
		<title>${title }::핏투게더</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
</head>
<body>
	<div class="container px-1">
		<div>
			<h1 class="text-center">핏투게더</h1>
		</div>
		<div>
			<form action="${pageContext.servletContext.contextPath }/search" method="get" 
			style="margin:auto; width:40%">
				<input class="search-txt" type="text" placeholder="검색어를 입력해주세요" style="width: 83%">
				<button class="search-btn" type="submit">검색하기</button>
			</form>
		</div>
	</div>
</body>
</html>