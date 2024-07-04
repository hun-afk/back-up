<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> map = new HashMap<>();
	map.put("page","해당 JSP 페이지의 전반적인 설정을 잡고자 할 때 사용되며, 각종 속성들을 설정 할 수 있다.");
	map.put("include","현재 JSP 페이지 내에 다른 파일의 내용을 포함시킬 때 사용한다.");
	map.put("taglib","사용자 정의 태그를 JSP 페이지에서 사용하고자 할때 쓰인다.");

	String subject = request.getParameter("subject");
	String value = map.get(subject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어에 대해 알아보기</title>
</head>
<body>
	<h3>검색어 : <%=subject %></h3>
	<%if(value != null) {%>
		<p>
			<%=value%>
		</p>
	<%}else {%>
		<p>
			등록되지 않은 주제입니다.
		</p>
	<%} %>
</body>
</html>