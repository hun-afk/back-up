<%@ page import="rentalbook.vo.User"%>
<%@ page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
boolean header_auth = (boolean) session.getAttribute("auth");
String header_authUserId = (String) session.getAttribute("auth_user_id");

UserDao header_userDao = new UserDao();
User header_authUser = header_userDao.findByUserId(header_authUserId);
%>
<%-- header include  --%>
<div style="padding: 8px; width: 1280px; margin: auto">
	<%-- banner / login & join shortcut / search --%>
	<div
		style="display: flex; align-items: center; justify-content: space-between;">
		<%--banner  --%>
		<div>
			<h1 style="font-weight: 100">
				<a href="<%=application.getContextPath()%>/index.jsp"
					class="no-deco-link">동네도서관</a>
			</h1>
		</div>
		<%-- search --%>
		<div>
			<input type="text" placeholder="검색어를 입력하세요" class="srch-bar" />
		</div>
		<%-- login & join shortcut --%>
		<%
		if (!header_auth) {
		%>
		<div>
			<a href="<%=application.getContextPath()%>/member/login.jsp"
				class="no-deco-link ">로그인</a> | <a
				href="<%=application.getContextPath()%>/member/join.jsp"
				class="no-deco-link ">회원가입</a>
		</div>
		<%
		} else {
		%>
		<div>
			<a href="<%=application.getContextPath()%>/member/logout.jsp"
				class="no-deco-link "><%=header_authUser.nickname()%>님 로그아웃</a> | <a
				href="<%=application.getContextPath()%>/mylib/modify.jsp"
				class="no-deco-link ">마이페이지</a>
		</div>
		<%
		}
		%>
		<%-- shortcut  링크 --%>
	</div>
	<div
		style="display: flex; align-items: center; justify-content: space-around;">
		<div>
			<a href="" class="no-deco-link fs-large">도서관소개</a>
		</div>
		<div>
			<a href="<%=application.getContextPath()%>/book/search.jsp"
				class="no-deco-link fs-large">도서 검색</a>
		</div>
		<div>
			<a href="<%=application.getContextPath()%>/feed/list.jsp"
				class="no-deco-link fs-large">열린공간</a>
		</div>
	</div>
</div>