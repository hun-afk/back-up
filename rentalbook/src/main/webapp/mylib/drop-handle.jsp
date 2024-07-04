<%@page import="rentalbook.vo.Favorite"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pwd = request.getParameter("u_pwd");
	
	UserDao userDao = new UserDao();
	String userId=(String)session.getAttribute("auth_user_id");
	
	User found =userDao.findByUserId(userId);
	
	if(!found.password().equals(pwd)) {
		response.sendRedirect(application.getContextPath()+"/mylib/drop.jsp?error=true");
	}else {
		FeedDao feedDao = new FeedDao();
		List<Feed> feeds = feedDao.findByWriterId(userId);
		if(feeds.size() > 0) {
			for(Feed one : feeds) {
				boolean t = feedDao.setNullToWriterIdByNo(one.no());
			}
		}	
		// 탈퇴하고자 사용자 등록한 Favorite List를 불러와. 이 메서드를 만든적이 있다 그거 찾아서 사용
		FavoriteDao favoriteDao = new FavoriteDao();
		List<Favorite> favorites =favoriteDao.findByUserId(userId);
		// List 반복문 돌면서 Favorite 객체를 접근하면 그안에 no() 값이 있을꺼임.
		for(Favorite one : favorites) {
		// 그 no() 값 이용해서 Favorite 데이터를 no 로 지우는 메서드를 만든적이 있다. 그거 사용
			favoriteDao.deleteByNo(one.no());
		}
		
		boolean r = userDao.deleteByUserId(userId);
		// 거의 실패할 가능성이 없기에 r 값을 확인하지 않을 것임.
		if(r) {
			response.sendRedirect(application.getContextPath()+"/member/logout.jsp");
		}else {
			response.sendRedirect(application.getContextPath()+"/mylib/drop.jsp?error=true");
		}
	}
%>