<%@ page import="model.Rank"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Rank> ranks = (List<Rank>) application.getAttribute("ranks");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>숫.자.야.구</h1>
		<h3>명예의 전당</h3>
		<%for(int i=0; i<ranks.size(); i++) { %>
			<p>
				<b>#<%=i+1 %></b>
				<%=ranks.get(i).ip() %> 
				<small>(
				시도 횟수 : <%=ranks.get(i).turn() %>			
				걸린 시간 : <%=ranks.get(i).elapsed() %>
				)</small>
			</p>
		<%} %>
	</div>
</body>
</html>