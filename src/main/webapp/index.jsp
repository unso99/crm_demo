<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
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
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<div class="container">
		<main class="form-signin w-100 m-auto">
			<form action="${pageContext.request.contextPath}/login" method="post">
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingInput"
						placeholder="name@example.com"> <label for="floatingInput">Email
						address</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						placeholder="Password"> <label for="floatingPassword">Password</label>
				</div>
				<div class="form-check text-start my-3">
					<input class="form-check-input" type="checkbox" value="remember-me"
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> Remember me </label>
				</div>
				<button class="btn btn-primary w-100 py-2" type="submit">Sign
					in</button>
			</form>
		</main>
	</div>

</body>
</html>