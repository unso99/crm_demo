<%@page import="customer.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long id = (long)request.getAttribute("id");

	CustomerDto dto = (CustomerDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/search_customer_id.jsp</title>
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
		<%if(id != -1) {%>
			<p>
				<strong><%=dto.getName() %></strong> 고객님의 번호는 <strong><%=id %></strong>번 입니다.
				<a href="insert_form.jsp?customer_id=<%=id %>">등록하러가기</a>
			</p>
		<%} else { %>
			<p>
				존재하지 않는 고객입니다.
				<a href="search_customer_id_form.jsp">다시 검색하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>