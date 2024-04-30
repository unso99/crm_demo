<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/insert_form.jsp</title>
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
		<form action="${pageContext.request.contextPath}/customer/insert" method="post">
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" id="name" name="name" placeholder="홍길동">
			</div>
			<div class="mb-3">
			  <label for="birth" class="form-label">생년월일</label>
			  <input type="text" class="form-control" id="birth" name="birth" placeholder="19000101">
			</div>
			<div class="mb-3">
			  <label for="phone" class="form-label">전화번호</label>
			  <input type="text" class="form-control" id="phone" name="phone" placeholder="01012345678">
			</div>
			<div class="mb-3">
			  <label for="email" class="form-label">이메일</label>
			  <input type="email" class="form-control" id="email" name="email" placeholder="sample@example.com">
			</div>
			<div class="mb-3">
			  <label for="address" class="form-label">주소</label>
			  <input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 서초구 ...">
			</div>
			<div class="row">
				<button type="submit" class="btn btn-primary">등록하기</button>
			</div>
		</form>
	</div>
</body>
</html>