<%@page import="rentalbook.dao.FavoriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] no = request.getParameterValues("no");
	
	if (no == null) {
		no =new String[0];
	}

	FavoriteDao favoriteDao = new FavoriteDao();
	for(String n : no) {
		int pars = Integer.parseInt(n);
		favoriteDao.deleteByNo(pars);
	}
%>
<script>
	window.alert("총<%=no.length %>개의 도서가 즐겨찾기 해제되었습니다.");
	location.href="<%=application.getContextPath()%>/mylib/favorites.jsp";
</script>
