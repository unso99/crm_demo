<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/search_customer_id_form.jsp</title>
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
		<form action="${pageContext.request.contextPath}/counsel/search_customer_id" method="post">
			<div class="mb-3">
			  <label for="name" class="form-label">고객 이름</label>
			  <input type="text" class="form-control" id="name" name="name" placeholder="고객의 이름를 입력해주세요.">
			</div>
			<div class="mb-3">
			  <label for="phone" class="form-label">전화번호</label>
			  <input type="text" class="form-control" id="phone" name="phone" placeholder="-를 빼고 입력해주세요">
			</div>
			<div class="row">
				<button type="submit" class="btn btn-primary">검색하기</button>
			</div>
		</form>
	</div>
</body>
</html>