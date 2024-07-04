<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수 조작하기</title>
</head>
<body>
	<div style="text-align: center">
		<h2>수 조작하기</h2>
		<p>당신이 입력한 숫자와 제어문자열을 이용해서 결과를 알려드립니다.</p>
		<p>제어문자는 'w', 'a', 's', 'd' 만 유효하니 참고 바랍니다.</p>
	</div>
	<div style="text-align: center">
		<form action="./control-result.jsp">
			<p>
				초기 값<br/>
				<input type="text" style="text-align: center" name="n" pattern="[0-9]+"/>
			</p>
			<p>
				제어문자<br/><input type="text" name="control" 
						pattern="[wasd]+" style="text-align: center"/>
			</p>
			<p>
				<button type="submit">결과보기</button>
				<button type="reset">재작성하기</button>
			</p>
		</form>
	</div>
</body>
</html>