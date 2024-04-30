<%@page import="owner.dto.OwnerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	boolean isSuccess = (boolean)request.getAttribute("isSuccess");
	OwnerDto dto = (OwnerDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>/user/login.jsp</title>
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
	<!-- Header -->
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				<strong><%=dto.getId() %></strong> 님 로그인 되었습니다.
				<a href="${pageContext.request.contextPath}/index.jsp">확인</a>
			</p>
		<%} else { %>
			<p>
				아이디 혹은 비밀 번호가 틀려요 
				<a href="${pageContext.request.contextPath}/index.jsp">다시 로그인</a>
			</p>
		<%} %>
		
	</div>
</body>
</html>