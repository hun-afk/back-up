<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	//System.out.println(uri);
	String extractUri = uri.substring(request.getContextPath().length());
	System.out.println(extractUri);

%>
<p>
	<%if(extractUri.equals("/overview.jsp")) { %>
		Overview
	<%} else { %>
		<a href="<%=request.getContextPath()%>/overview.jsp">Overview</a>
	<%} %>
	
	<%if(extractUri.equals("/built-in/about-out.jsp")) { %>
		out
	<%} else { %>
		<a href="<%=request.getContextPath()%>/built-in/about-out.jsp">out</a>
	<%} %>
	
	<%if(extractUri.equals("/built-in/about-request.jsp")) { %>
		request
	<%} else { %>
		<a href="<%=request.getContextPath()%>/built-in/about-request.jsp">request</a>
	<%} %>
	
	<%if(extractUri.equals("/built-in/about-response.jsp")) { %>
		response
	<%} else { %>
		<a href="<%=request.getContextPath()%>/built-in/about-response.jsp">response</a>
	<%} %>
	
</p>