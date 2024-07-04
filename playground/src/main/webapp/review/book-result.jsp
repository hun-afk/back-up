<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String auther = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String status = request.getParameter("status");
	int originalPrice = Integer.parseInt(request.getParameter("original_price"));
	int salePrice = Integer.parseInt(request.getParameter("sale_price"));
	
	double discountRate = (double)(originalPrice - salePrice) / originalPrice * 100;
	

	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	
	PreparedStatement stmt = conn
			.prepareStatement("insert into books values(?, ?, ?, ?, ?, ?, ?)");
	
	stmt.setString(1, title);
	stmt.setString(2, auther);
	stmt.setString(3, publisher);
	stmt.setString(4, status);
	stmt.setInt(5, originalPrice);
	stmt.setInt(6, salePrice);
	stmt.setDouble(7, discountRate);
	
	int cnt = stmt.executeUpdate();
	
	conn.close();
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>중고 상품 등록</h2>
	<%if(cnt == 1) { %>
	<p>
		당신의 소중한 의견이 잘 저장되었습니다.
	</p>
	<%} else { %>
	<p>
		데이터 처리 중 장애가 발생한 것 같습니다. 다시 시도해주세요.
	</p>
	<%} %>
	
</body>
</html>
