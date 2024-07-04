<%@page import="model.Books"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Review"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sort = request.getParameter("sort");
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
	ods.setUser("playground");	
	ods.setPassword("oracle");

	String a = "SELECT * FROM BOOKS";
	if(sort == null || sort.equals("1")) {
		a += "ORDER BY TITLE";
	} else if (sort.equals("2")) {
		a += "ORDER BY TITLE DESC";
	} else if (sort.equals("3")) {
		a += "ORDER BY AUTHER";
	} else if (sort.equals("4")) {
		a += "ORDER BY AUTHER DESC";
	} else if (sort.equals("5")) {
		a += "ORDER BY PUBLISHER";
	} else if (sort.equals("6")) {
		a += "ORDER BY PUBLISHER DESC";
	}
	
	Connection conn = ods.getConnection();

	PreparedStatement stmt = conn.prepareStatement(a);
	
	ResultSet rs = stmt.executeQuery();
	
	List<Books> book = new ArrayList<>();
	
	while(rs.next()) {
		Books c = new Books(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDouble(7));
		book.add(c);
	}
	
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 모음</title>
</head>
<body>
	<h2>리뷰 List</h2>
	<ul>
		<%for(Books c : book) {%>
			<li><%=c.title() %></li>
				
		<%} %>
	</ul>
</body>
</html>