<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/counsel/insert_form.jsp</title>
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
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a class="btn btn-primary me-md-2 mt-2" href="${pageContext.request.contextPath}/counsel/search_customer_id.jsp">고객 번호 찾기</a>
		</div>
		<form action="insert.jsp" method="post">
			<div class="mb-3">
			  <label for="customer_id" class="form-label">고객 번호</label>
			  <input type="text" class="form-control" id="customer_id" name="customer_id" placeholder="고객의 번호를 입력해주세요.">
			</div>
			<div class="mb-3">
			  <label for="counselor" class="form-label">상담사</label>
			  <input type="text" class="form-control" id="counselor" name="counselor" value="${id }" readonly>
			</div>
			<div class="mb-3">
			  <label for="description" class="form-label">상담 내용</label>
			  <textarea class="form-control" id="description" name="description" rows="3" placeholder="상담내용을 입력해주세요."></textarea>
			</div>
			<div class="row">
				<button type="submit" class="btn btn-primary">등록하기</button>
			</div>
		</form>
	</div>
</body>
</html>