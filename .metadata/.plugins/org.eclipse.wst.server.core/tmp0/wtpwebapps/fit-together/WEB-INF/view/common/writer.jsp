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
		<div class="my-3">로그온 메뉴바 들어갈 자리</div>
		<div>
			<span>자유게시판</span> &gt; <span class="warning">글쓰기</span>
		</div>
		<h2 class="my-2">글쓰기</h2>
		<form
			action="${pageContext.servletContext.contextPath }/events/new-handle" method="post">
			<div class="my-1">
				<small>제목</small><br />
				 <input type="text" name="title"
						class="w-100  p-2 border-rounded fs-3" />
			</div>
			<div class="my-1">
				<small>내용</small><br />
				<textarea class="w-100  p-2 border-rounded fs-3" name="body"
					style="height: 160px; resize: none"></textarea>
			</div>
			<div class="my-1">
				<button class="w-100 p-2 border-rounded fs-2" >작성</button>
			</div>
		</form>
	</div>
</body>
</html>