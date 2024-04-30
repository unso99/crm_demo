<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String savedId = (String)request.getAttribute("savedId");
String savedPwd = (String)request.getAttribute("savedPwd");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>/user/login_form.jsp</title>

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
</head>
<body>
	<div class="container">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
						</div>
						<form action="${pageContext.request.contextPath}/owner/login" method="post">
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									value="<%=savedId%>" id="exampleInputEmail" name="id"
									aria-describedby="emailHelp" placeholder="Enter id...">
							</div>
							<div class="form-group">
								<input type="password" class="form-control form-control-user"
									value="<%=savedPwd%>" id="exampleInputPassword"
									name="password" placeholder="Password">
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox small">
									<input type="checkbox" class="custom-control-input" id="isSave"
										name="isSave"
										<%=(savedId != null && !savedId.isEmpty()) ? "checked" : ""%>>
									<label class="custom-control-label" for="isSave">Remember
										Me</label>
								</div>
							</div>
							<button type="submit" class="btn btn-primary btn-user btn-block">
								Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>