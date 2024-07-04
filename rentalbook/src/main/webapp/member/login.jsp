<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2 style="font-weight: lighter;">로그인</h2>
			<div>
				회원서비스 &gt; <span style="color: hotpink;">로그인</span>
			</div>
		</div>
		<div
			style="width: 400px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
			<form
				action="<%=application.getContextPath()%>/member/login-handle.jsp">
				<p>
					<input type="text" class="login-input" placeholder="아이디를 입력해주세요"
						name="u_id" />
				</p>
				<p>
					<input type="password" class="login-input" name="u_pwd"
						placeholder="비밀번호를 입력해주세요" />
				</p>
				<p>
					<button type="submit" class="login-input">로그인</button>
				</p>
			</form>
			<p style="text-align: center">
				<a href="<%=request.getContextPath()%>/member/join.jsp" class="no-deco-link">신규회원가입
					바로가기</a>
			</p>
		</div>

	</div>

</body>
</html>







