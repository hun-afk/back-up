<%@page import="java.sql.ResultSet"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="rentalbook.vo.User"%>
<%@ page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean header_auth = (boolean)session.getAttribute("auth");
	String header_authUserId = (String)session.getAttribute("auth_user_id");
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
	ods.setUser("rentalbook");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	// 식별키로 조회하고,	
	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM USERS WHERE USER_ID=?");
	stmt.setString(1, header_authUserId);

	ResultSet rs = stmt.executeQuery();
	// 식별용 컬럼 (Primary Key) 로 검색하면, 있거나 없거나  둘중 하나임. if - else 확인만 하면 됨.
	String header_nickname = null;
	if(rs.next()) {
		header_nickname = rs.getString("nickname");	// 그 데이터의 password 뽑아서.
		
	} 
	conn.close();
%>
<%-- header include  --%>
<div style="padding: 8px;">
	<%-- banner / login & join shortcut / search --%>
	<div
		style="display: flex; align-items: center; justify-content: space-between;">
		<%--banner  --%>
		<div>
			<h1 style="font-weight: 100">
				<a href="<%=application.getContextPath()%>/index.jsp" class="no-deco-link">동네도서관</a>
			</h1>
		</div>
		<%-- search --%>
		<div>
			<input type="text" placeholder="검색어를 입력하세요" class="srch-bar"/>
		</div>
		<%-- login & join shortcut --%>
		<%if(!header_auth) { %>
		<div>
			<a href="<%=application.getContextPath()%>/member/login.jsp"
				class="no-deco-link ">로그인</a> |  <a
				href="<%=application.getContextPath()%>/member/join.jsp"
				class="no-deco-link ">회원가입</a>
		</div>
		<%}else { %>
		<div>
			<a href="<%=application.getContextPath()%>/member/logout.jsp"
				class="no-deco-link "><%=header_nickname %>님 로그아웃</a> | 
			<a
				href="<%=application.getContextPath()%>/mylib/modify.jsp"
				class="no-deco-link ">정보수정</a>	
		</div>
		<%} %>
		<%-- shortcut  링크 --%>
	</div>
	<div style="display: flex; align-items: center; justify-content: space-around;">
		<div><a href="" class="no-deco-link fs-large">도서관소개</a></div>
		<div><a href="" class="no-deco-link fs-large">도서 검색</a></div>
		<div><a href="" class="no-deco-link fs-large">열린공간</a></div>
	</div>
</div>





