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
	<div class="my-2 p-2 px-5"
		style="background-color: black; margin-bottom: 30px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="display: flex; align-items: center; gap: 20px;">
				<a href="${pageContext.servletContext.contextPath }/index"></a> 
				<a href="${pageContext.servletContext.contextPath }/events"
					class="fs-3 badge-dark">행사목록 <small>..</small></a> <a
					href="${pageContext.servletContext.contextPath }/list"
					class="fs-3 badge-dark">자유게시판 <small>..</small></a> <a
					href="${pageContext.servletContext.contextPath }/gym/list"
					class="fs-3 badge-dark">체육시설 <small>..</small></a>
			</div>
		</div>
	</div>
</body>
</html>