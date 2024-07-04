<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Feed found;
	if(request.getParameter("no") == null) {
		found = null;
	}else {
		int no = Integer.parseInt(request.getParameter("no"));
		
		FeedDao feedDao = new FeedDao();
		
		
		boolean f = feedDao.increaseReadCntByNo(no);
		found = feedDao.findByNo(no);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%if(found == null) { %>
		<script>
			window.alert("존재하지 않는 글입니다.");
			history.go(-1);
		</script>
	<%} else {%>
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: 0 auto;">
		<h2>의견 상세보기</h2>
		<p style="text-align: right">
			열린공간 &gt; <span style="color: hotpink;">의견 상세보기</span>
		</p>
		<div>
			<h3 style="text-align: center; margin-bottom:8px; 
				border-bottom: 1px solid #ccc; padding : 8px;"><%=found.title() %></h3>		
			<div style="padding : 4px; text-align: right; ">
				<span style="color : #777">작성일</span> <span><%=found.writedAt() %></span> |
				<span style="color : #777">작성자</span>  <span><%=found.writerId() %></span> |
				<span style="color : #777">조회</span> <span><%=found.readCnt() %></span>
			</div>
			<p>
				<%=found.body().replaceAll("\n", "<br/>") %>			
			</p>
		</div>
		<div style="text-align: right;">
			<a href="<%=application.getContextPath() %>/feed/list.jsp" class="no-deco-link"><button>목록</button></a>
			
			<%if(found.writerId() != null &&
					found.writerId().equals((String) session.getAttribute("auth_user_id") )) {%>
			<a href="<%=application.getContextPath() %>/feed/delete-handle.jsp?no=<%=found.no()%>" class="no-deco-link">
				<button>삭제</button>
			</a>
			<a href="<%=application.getContextPath() %>/feed/update.jsp?no=<%=found.no()%>" class="no-deco-link">
				<button>수정</button>
			</a>
			<%} %>
		</div>
	</div>
	
	
	<%} %>
</body>
</html>

















