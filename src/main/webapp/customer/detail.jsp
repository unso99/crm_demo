<%@page import="customer.dao.CustomerDao"%>
<%@page import="customer.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//고객번호
	long id = Long.parseLong(request.getParameter("id"));
	//고객정보
	CustomerDto dto = CustomerDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/detail.jsp</title>
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
		<jsp:param value="customer" name="current"/>
	</jsp:include>
	<div class="container mt-5">
		<form action="update.jsp" method="post">
			<div class="mb-3">
			  <input type="hidden" class="form-control" id="id" name="id" placeholder="홍길동" value="<%=dto.getId() %>">
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" id="name" name="name" placeholder="홍길동" value="<%=dto.getName() %>">
			</div>
			<div class="mb-3">
			  <label for="birth" class="form-label">생년월일</label>
			  <input type="text" class="form-control" id="birth" name="birth" placeholder="19000101" value="<%=dto.getBirth() %>">
			</div>
			<div class="mb-3">
			  <label for="phone" class="form-label">전화번호</label>
			  <input type="text" class="form-control" id="phone" name="phone" placeholder="01012345678" value="<%=dto.getPhone() %>">
			</div>
			<div class="mb-3">
			  <label for="email" class="form-label">이메일</label>
			  <input type="email" class="form-control" id="email" name="email" placeholder="sample@example.com" value="<%=dto.getEmail() %>">
			</div>
			<div class="mb-3">
			  <label for="address" class="form-label">주소</label>
			  <input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 서초구 ..." value="<%=dto.getAddress() %>">
			</div>
			<div class="row">
				<button type="submit" class="btn btn-primary mb-3">수정하기</button>
				<a class="btn btn-danger mb-3" href="delete.jsp?id=<%=dto.getId() %>">삭제하기</a>
				<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/index.jsp">뒤로가기</a>
			</div>
		</form>
	</div>
</body>
</html>