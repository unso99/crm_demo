<%@page import="customer.dto.CustomerDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isSuccess = (boolean)request.getAttribute("isSuccess");
	CustomerDto customer = (CustomerDto)request.getAttribute("customer");
	long customer_id = (long)request.getAttribute("customer_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/insert.jsp</title>
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
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="counsel" name="current"/>
	</jsp:include>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				<strong><%=customer.getName() %></strong> 고객님의 상담이 등록되었습니다.
				<a href="${pageContext.request.contextPath }/counsel/list">확인</a>
			</p>
		<%} else { %>
			<p>
				상담 등록에 실패하였습니다.
				<a href="insert_form.jsp?customer_id=<%=customer_id%>">다시 등록하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>