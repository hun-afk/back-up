<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/member/join-error.jsp"%>
<%
	String userId = request.getParameter("user_id");
	String password = request.getParameter("password");
	String passwordCheck = request.getParameter("password_check");
	String nickname = request.getParameter("nickname");
	String gender = request.getParameter("gender");
	
	// 데이터 유효성 검사
	if (userId.isBlank() || password.isBlank() || passwordCheck.isBlank() || !password.equals(passwordCheck)) {
		// 먼가를 하고		
		return;
	}
	
	int result = 0;
	
	UserDao userDao = new UserDao();
	User found = userDao.findByUserId(userId);
	
	if(found != null) {
		result = 1;
	} else {
		User one = new User(userId, password, nickname, gender, new Date(System.currentTimeMillis()));
		boolean saved = userDao.save(one);
		result = saved ? 3 : 2;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<div style="width: 840px; margin: 100px auto; text-align: center">
		
		<%if(result == 3) { %>
			<h3>가입 승인</h3>
			<p>
				<b><%=nickname %></b> 님의 회원가입 요청이 승인 처리되었습니다.				
			</p>
		<%}else if(result==1){ %>
			<script>
				window.alert("이미 사용중인 아이디 입니다.");
				history.go(-1);
			</script>
		<%} else { %>
			<script>
				window.alert("데이터 처리 중에 오류가 발생하였습니다.\n다시 시도해주세요.");
				history.go(-1);
			</script>
		<%} %>
	</div>
</body>
</html>





