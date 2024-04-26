<%@page import="customer.dao.CustomerDao"%>
<%@page import="counsel.dao.CounselDao"%>
<%@page import="counsel.dto.CounselDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//상담 번호
	long id = Long.parseLong(request.getParameter("id"));
	//상담 정보
	CounselDto dto = CounselDao.getInstance().getData(id);
	
	//고객 이름
	String customer_name = CustomerDao.getInstance().getData(dto.getCustomer_id()).getName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/detail.jsp</title>
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
	<div class="container mt-5">
		<form action="update.jsp" method="post">
			<div class="mb-3">
			  <input type="hidden" class="form-control" id="id" name="id" placeholder="홍길동" value="<%=dto.getId() %>">
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="true" name="is_finished" 
			  <%if(dto.getIs_finished().equals("true")) {%>
			  	checked
			  <%} %>>
			  <label class="form-check-label" for="flexCheckDefault">
			    상담 해결 여부
			  </label>
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" id="name" name="name" placeholder="홍길동" value="<%=customer_name %>" readonly>
			</div>
			<div class="mb-3">
			  <input type="hidden" class="form-control" id="customer_id" name="customer_id" placeholder="홍길동" value="<%=dto.getCustomer_id() %>">
			</div>
			<div class="mb-3">
			  <label for="counselor" class="form-label">상담사</label>
			  <input type="text" class="form-control" id="counselor" name="counselor" placeholder="홍길동" value="<%=dto.getCounselor() %>" readonly>
			</div>
			<div class="mb-3">
			  <label for="description" class="form-label">상담 내용</label>
			  <textarea class="form-control" id="description" name="description" rows="3" placeholder="상담내용을 입력해주세요."><%=dto.getDescription() %></textarea>
			</div>
			<div class="mb-3">
			  <label for="updated_at" class="form-label">최근 상담 날짜</label>
			  <%if(dto.getUpdated_at() != null) {%>
			  	<input type="text" class="form-control" id="updated_at" name="updated_at" placeholder="홍길동" value="<%=dto.getUpdated_at() %>" readonly>
			  <%} else { %>
			  	<input type="text" class="form-control" id="updated_at" name="updated_at" placeholder="홍길동" value="<%=dto.getCreated_at() %>" readonly>
			  <%} %>
			</div>
			<div class="row">
				<button type="submit" class="btn btn-primary mb-3">수정하기</button>
				<a class="btn btn-danger mb-3" href="delete.jsp?id=<%=dto.getId() %>">삭제하기</a>
				<a class="btn btn-outline-primary" href="list.jsp">뒤로가기</a>
			</div>
		</form>
	</div>
</body>
</html>