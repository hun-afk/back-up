<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/book/viewerror.jsp"%>
<%
int bookId = Integer.parseInt(request.getParameter("bookId"));

BookDao bookDao = new BookDao();
Book found = bookDao.findByBookId(bookId);

boolean isExist = false;

FavoriteDao favoriteDao = new FavoriteDao();

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
		<h2>도서 상세보기</h2>
		<p style="text-align: right">
			도서검색 &gt; <span style="color: hotpink;">도서 상세보기</span>
		</p>
		<div>
			<h2
				style="text-align: center; margin-bottom: 8px; border-bottom: 1px solid #ccc; padding: 8px;">
				<%=found.title()%></h2>

			<div style="padding: 4px; text-align: right;">
				<span style="color: #777">카테고리</span> <span><%=found.categoryName()%></span>
				| <span style="color: #777">출판사</span> <span><%=found.publisher()%></span>
				| <span style="color: #777">♡</span> <span><%=found.rentalCnt()%></span>
			</div>
			<p style="text-align: center">
				<img src="<%=found.imageUrl()%>" />
			</p>
			<p style="text-align: center;">
				<%
				if (found.description() == null) {
				%>
				-
				<%
				} else {
				%>
				<%=found.description().replaceAll("\n", "<br/>")%>
				<%
				}
				%>
			</p>
		</div>
		<div style="text-align: right;">
		<%if(isExist) {%>


		<%}else { %>
			<a
				href="<%=application.getContextPath()%>/book/add-favorite.jsp?bookId=<%=found.bookId()%>"
				class="no-deco-link"><button>찜하기</button></a>
		<%} %>
		
		
			 <a
				href="<%=application.getContextPath()%>/book/search.jsp"
				class="no-deco-link"><button>목록</button></a>
		</div>
	</div>






</body>
</html>