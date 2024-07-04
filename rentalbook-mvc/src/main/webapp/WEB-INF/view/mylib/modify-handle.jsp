<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// (String userId, String password, String nickname, String gender, Date registerdAt)
	String userId = (String)session.getAttribute("auth_user_id");
	String password= request.getParameter("password");
	String nickname = request.getParameter("nickname");

	UserDao userDao = new UserDao();
	
	boolean result;
	if(password.isBlank()) {
		User temp = new User( userId, null, nickname , null, null);	
		result = userDao.updateNickname(temp);
	}else {
		User temp = new User( userId, password, nickname , null, null);	
		result = userDao.updateNicknameAndPassword(temp);
	}
	
	if(result) {
%>
<script>
	window.alert("정보가 수정되었습니다.");
	location.href="<%=application.getContextPath()%>/mylib/modify.jsp";
</script>
<%}else { %>
<script>
	window.alert("정보 수정에 실패하였습니다.");
	history.go(-1);
</script>

<%} %>
