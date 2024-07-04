<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("auth_user_id");
FavoriteDao favoriteDao = new FavoriteDao();
List<Favorite> favorites = favoriteDao.findByUserId(userId);

BookDao bookDao = new BookDao();
List<Book> books = new ArrayList<>();

for (Favorite f : favorites) {
	Book one = bookDao.findByBookId(f.bookId());
	books.add(one);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico" />
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: 0 auto;">
		<h2>즐겨찾기한 도서목록</h2>
		<div style="text-align: right">
			<p>
				마이페이지 &gt; <span class="highlight">즐겨찾기한 도서목록</span>
			</p>
		</div>
		<div style="margin: 15px 0px;">
			총 <span style="color: orchid"><%=favorites.size()%></span> 개의 도서를
			즐겨찾기 중입니다.
		</div>
		<form action="<%=application.getContextPath()%>/mylib/delete-favorite.jsp">
			<table class="default-table">
				<thead>
					<tr class="border-bottom">
						<th></th>
						<th style="">분류</th>
						<th>도서제목</th>
						<th style="width: 30%">즐겨찾기한 날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < favorites.size(); i++) {
					%>
					<tr class="border-bottom">
						<td><input type="checkbox" name="no" value="<%=favorites.get(i).no() %>"/></td>
						<td class="text-center"><%=books.get(i).categoryName()%></td>
						<td class="text-center"><a
							href="<%=application.getContextPath()%>/book/view.jsp?bookId=<%=favorites.get(i).bookId()%>"
							class="no-deco-link" target="_blank"> <%=books.get(i).title()%>
						</a></td>
						<td class="text-center"><%=favorites.get(i).createdAt()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div style="margin-top: 20px;">
				<button type="submit">즐겨찾기 해제</button>
			</div>
		</form>
	</div>
</body>
</html>







