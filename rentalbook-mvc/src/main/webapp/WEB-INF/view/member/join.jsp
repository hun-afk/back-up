<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보입력 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: 0 auto;">
		<h2>회원가입</h2>
		<p style="text-align: right">
				회원서비스 &gt; <span style="color: hotpink;">회원가입</span>
		</p>
		<div style="text-align: right; margin-bottom: 8px;">
			<span style="color: red">*</span> 표시가 된 곳은 필수 항목입니다.
		</div>
		<form
			action="<%=application.getContextPath()%>/member/join-handle.jsp">
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>아이디</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="user_id" type="text"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>비밀번호</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>비밀번호확인</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password_check" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>닉네임</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="nickname" type="text"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
						style="color: red">*</span>성별</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						type="radio" style="padding: 6px 10px;" id="radio-m" name="gender"
						value="남" checked /> <label for="radio-m">남</label> <input
						type="radio" style="padding: 6px 10px;" id="radio-f" name="gender"
						value="여" /> <label for="radio-f">여</label></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 10px 20px;">회원가입</button>
				<button type="reset" style="padding: 10px 20px;">취소</button>
			</div>
		</form>
	</div>
</body>
</html>







