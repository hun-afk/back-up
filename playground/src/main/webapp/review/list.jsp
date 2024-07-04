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
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
	ods.setUser("playground");	
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();

	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM REVIEWS");
	
	ResultSet rs = stmt.executeQuery();
	
	List<Review> reviews = new ArrayList<>();
	
	while(rs.next()) {
		new Review(rs.getString(1), rs.getString(2), rs.getInt(3));
		
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<h2>방명록</h2>
	<p>
		이 곳을 방문했던 사람들이 남긴 메세지들입니다.
	</p>
	<ul>
		<%for(Review o : reviews) {%>
			<li><%=o.massage() %> (<%=o.score() %>)</li>
				<small style="color: #555">from <%=o.writer() %></small>
		<%} %>
	</ul>	
</body>
</html>









