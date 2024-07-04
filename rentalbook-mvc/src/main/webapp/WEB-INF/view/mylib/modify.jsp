<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
boolean auth = (Boolean) session.getAttribute("auth");

String authUserId = (String) session.getAttribute("auth_user_id");

UserDao userDao = new UserDao();
User authUser = userDao.findByUserId(authUserId);
// findByUserId의 결과가 null 인지 확인은 안할꺼임.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%
	if (!auth) {
	%>
	<script>
			window.alert("도서관회원으로 로그인 후 사용하세요.");	
			location.href="<%=application.getContextPath()%>/member/login.jsp";
	</script>
	<%
	} else {
	%>
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: 0 auto;">
		<h2>회원정보수정</h2>
		<div style="display: flex; justify-content: space-between;">
			<div style="text-align: right">
				마이페이지 &gt; <span style="color: hotpink;">회원정보수정</span>
			</div>
			<div>
				<a href="<%=application.getContextPath()%>/mylib/modify.jsp"
					class="no-deco-link">정보수정</a> | <a
					href="<%=application.getContextPath()%>/mylib/drop.jsp"
					class="no-deco-link">회원탈퇴</a>
			</div>
		</div>

		<p style="text-align: left; margin-bottom: 8px;">* 비밀번호와 닉네임만
			변경할 수 있습니다.</p>
		<form action="<%=application.getContextPath()%>/mylib/modify-handle.jsp">
			<input type="hidden" name="oldpass" value="<%=authUser.password()%>"/>
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">회원상태</td>
					<td style="border: 1px solid #ccc; padding: 12px;">정회원(정상)</td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">아이디</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=authUser.userId()%></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">닉네임</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="nickname" type="text" value="<%=authUser.nickname() %>"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">비밀번호</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" />
						<span>변경시에만 입력하세요.</span></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">비밀번호확인</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password_check" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee">성별</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=authUser.gender() %></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 10px 20px;">저장</button>
			</div>
		</form>
	</div>




	<%
	}
	%>
</body>
</html>











