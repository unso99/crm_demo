<%@page import="counsel.dao.CounselDao"%>
<%@page import="counsel.dto.CounselDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isSuccess = (boolean)request.getAttribute("isSuccess");
	
	CounselDto dto = (CounselDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counselor/update.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				상담 정보가 수정되었습니다.
				<a href="${pageContext.request.contextPath}/counsel/list">확인</a>
			</p>
		<%} else { %>
			<p>
				상담 정보 수정에 실패했습니다.
				<a href="${pageContext.request.contextPath}/detail?id=<%=dto.getId() %>">다시 수정하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>