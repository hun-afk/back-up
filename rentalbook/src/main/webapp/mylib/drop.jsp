<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean auth = (boolean)session.getAttribute("auth");
	if(!auth) {
		response.sendRedirect(application.getContextPath()+"/member/login.jsp");
	}
%>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 동네 도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
<%@ include file="/common/header.jsp"%>

	<%-- navbar 만들어서 include 시킬꺼임. --%>
	<div style="width: 840px; margin: 0 auto;">
		<div style="text-align: center">
			<h2 style="font-weight: lighter;">회원탈퇴</h2>
			<div>
				회원서비스 &gt; <span style="color: hotpink;">회원탈퇴</span>
			</div>
		</div>
		<div
			style="width: 400px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
			<h3>유의사항</h3>
			<p>
				비밀번호가 일치하여야만 회원탈퇴가 진행됩니다.
			</p>
			<form
				action="<%=application.getContextPath()%>/mylib/drop-handle.jsp">
				<p>
					<input type="password" class="login-input" name="u_pwd"
						placeholder="비밀번호를 입력해주세요" />
				</p>
				<p>
					<button type="submit" class="login-input">회원탈퇴</button>
				</p>
			</form>
		</div>

	</div>

</body>
</html>






