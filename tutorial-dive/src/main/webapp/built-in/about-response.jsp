<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("about-response.jsp executed...");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response :: built-in Objects</title>
</head>
<body>
	<%@ include file="/nav.jsp" %>
	<h2>HttpServletResponse response</h2>
	<p>	
		HttpServletResposne 객체는 http 응답과 관련된 작업을 처리하기 위해 주로 사용된다.
		<small>(jsp 로 응답처리하는 경우에는 그렇게 활용도가 높지는 않다.)</small>
	</p>
	<p>
		대부분의 메서드들은 직접 호출하는 상황이 많이 발생하진 않는다. 그럼에도 
		<b>sendRedirect(String location)</b> 메서드는 정말 많이 활용된다.
	</p>
	<%
		// 요청 클라이언트를 다른 위치로 보내고자 할때 사용
		// response.sendRedirect(request.getContextPath()+"/overview.jsp");
	%>
	<hr/>
	<h3>기타 유용한 메서드</h3>
	<h3>컨텐츠관련 설정</h3>
	<ul>
		<li>setContentType : 응답 컨텐츠 종류 설정</li>
		<li>setContentLength : 응답 본문 길이</li>
	</ul>
	<h3>헤더 설정</h3>
	<%
		response.setHeader("publisher", "saansoo");
	%>
	<ul>
		<li>setHeader / addHeder : 특정을 가진 헤더 전송</li>
	</ul>
	<h3>출력스트림 제어</h3>
	<ul>
		<li>getOutputStream</li>
		<li>getWriter</li>
	</ul>
	
</body>
</html>