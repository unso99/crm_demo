<%@page import="customer.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long id = Long.parseLong(request.getParameter("id"));

	boolean isSuccess = CustomerDao.getInstance().delete(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/delete.jsp</title>
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
				고객님 정보가 삭제되었습니다.
				<a href="${pageContext.request.contextPath}/index.jsp">확인</a>
			</p>
		<%} else { %>
			<p>
				고객 정보 삭제에 실패했습니다.
				<a href="detail.jsp?id=<%=id %>">되돌아가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>