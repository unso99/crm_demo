<%@page import="customer.dao.CustomerDao"%>
<%@page import="customer.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	CustomerDto dto = new CustomerDto(name,birth,phone,email,address);
	
	boolean isSuccess = CustomerDao.getInstance().insert(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/insert.jsp</title>
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
				<strong><%=dto.getName() %></strong> 고객님이 등록되었습니다.
				<a href="${pageContext.request.contextPath}/index.jsp">확인</a>
			</p>
		<%} else { %>
			<p>
				고객 등록에 실패하였습니다.
				<a href="insert_form.jsp">다시 등록하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>