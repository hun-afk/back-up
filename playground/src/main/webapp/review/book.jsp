<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
</head>
<body>
	<div style="text-align: center">
		<h2>도서등록</h2>
		<form action="<%=request.getContextPath()%>/review/book-result.jsp">
			책제목: <br /> <input type="text" name="title" /> <br /> 지은이: <br />
			<input type="text" name="author" /><br /> 출판사: <br /> <input
				type="text" name="publisher" /><br /> 원래가격: <br /> <input
				type="number" name="original_price" /> <br /> 판매가격: <br /> <input
				type="number" name="sale_price" /><br /> 상품상태 <select
				name="status">
				<option>최상</option>
				<option>상</option>
				<option>중</option>
			</select>
			<p>
				<button type="submit">등록</button>
			</p>

		</form>
	</div>

</body>
</html>