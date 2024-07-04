<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String line = request.getParameter("line");
	System.out.println(line);
	String[] lines = request.getParameterValues("line");
	if(lines== null) {
		// redirect 수신자는 브라우저가 될꺼기 때문에, 재 이동시켜야될 경로(위치)는 contextPath를 설정해서 보내
		response.sendRedirect(request.getContextPath()+"/example/triangle.jsp");		
		return;
	}
	System.out.println(lines[0] + "," + lines[1] + "," + lines[2]);
	
	int[] arr = new int[lines.length];
	
	for (int i = 0; i < lines.length; i++) {
		arr[i] = Integer.parseInt(lines[i]);
	}
	// lines[0] 이 lines[1] + lines[2] 보다 작고
	// lines[1] 이 lines[0] + lines[2] 보다 작고
	// lines[2] 이 lines[0] + lines[1] 보다 작으면 삼각형이 만들어짐.
	
	boolean valid;
	if (arr[0] < arr[1] + arr[2] && arr[1] < arr[0] + arr[2] && arr[2] < arr[0] + arr[1]) {
		valid = true;
	} else {
		valid = false;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼각형의 완성조건</title>
</head>
<body>
	<h2>삼각형은 만들어지는가?</h2>
	<p>
		전달받은 세 선분 (<%=arr[0] %>, <%=arr[1] %>, <%=arr[2] %>)을 이용해서 
		<%if(valid) {%>
			<b style="color: blue">삼각형을 만들 수 있습니다.</b>
		
		<%}else { %>
			<b style="color: red">삼각형을 만들 수 없습니다..</b>
		<%} %> 
	
	</p>


</body>
</html>
