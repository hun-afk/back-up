<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@ page import="java.sql.Date"%>
<%@ page import="rentalbook.vo.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String authUserId = (String)session.getAttribute("auth_user_id");
	int bookId = Integer.parseInt(request.getParameter("bookId"));
	
	// (int no, String userId, int bookId, Date createdAt)
	// insert 시킬때 no 값은 의미가 없음?? .. 대충 세팅..
	Favorite one = new Favorite(-1, authUserId, bookId, new Date(System.currentTimeMillis()));
	FavoriteDao favoriteDao = new FavoriteDao();
	boolean saveResult = favoriteDao.save(one);

	if(saveResult) {
		BookDao bookDao = new BookDao();
		bookDao.increaseRentalCntByNo(bookId);
		response.sendRedirect(application.getContextPath()+"/book/view.jsp?bookId="+bookId);
		
	}else {
		out.println("<script>");
		out.println("window.alert(\"즐겨찾기 등록에 실패하였습니다.\");");
		out.println("history.go(-1);");
		out.println("</script>");
	}
%>















