<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[] titles = new String[]{"봄","여름","가을", "겨울"};
	out.println("<!DOCTYPE html>");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JspWriter out</h2>
	<ul>
		<%for(String one : titles) { %>
			<li><a href="./season.jsp?q=<%=one %>"><%=one %></li>
		<%} %>
	</ul>	
	<ol>
	<%
		for(String one : titles) {
			out.println("<li>" + one+"</li>");			
		}
	%>
	</ol>
	<p>
		<%@ include file="/nav.jsp" %>
	</p>
</body>
</html>