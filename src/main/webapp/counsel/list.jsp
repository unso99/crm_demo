<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/list.jsp</title>
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
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a class="btn btn-primary me-md-2 mt-2" href="${pageContext.request.contextPath}/counsel/list.jsp">상담 등록</a>
		</div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">이름</th>
		      <th scope="col">생년월일</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">이메일</th>
		      <th scope="col">주소</th>
		    </tr>
		  </thead>
		  <tbody>
		  	
		  </tbody>
		</table>
	</div>
</body>
</html>