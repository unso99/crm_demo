<%@page import="owner.dto.OwnerDto"%>
<%@page import="owner.dao.OwnerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	String isSave = request.getParameter("isSave");
	System.out.println(id);
	boolean isSuccess = false; // Assuming login is not successful by default
	OwnerDto dto = OwnerDao.getInstance().getData(id); // Initialize dto to null
	if (isSave != null) {
		//아이디 비밀번호를 쿠키로 응답하고 1주일 동안 유지되도록 한다.
		Cookie cook1 = new Cookie("savedId", id);
		Cookie cook2 = new Cookie("savedPwd", pwd);
	
		cook1.setMaxAge(60 * 60 * 24 * 7);
		cook2.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cook1);
		response.addCookie(cook2);
	
	} else {
		//특정 키값으로 저장된 쿠키값 삭제하기 (value 에는 아무 값이나 넣어도 상관없다)
		Cookie cook1 = new Cookie("savedId", "");
		Cookie cook2 = new Cookie("savedPwd", null);
		cook1.setMaxAge(0);
		cook2.setMaxAge(0);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}
	
	if (dto != null && dto.getId() != null && dto.getId().equals(id) && dto.getPassword().equals(pwd)) {
		isSuccess = true; // Set isSuccess to true upon successful login
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>login.jsp</title>
</head>
<body class="is-preload">
	<!-- Header -->
	<header id="header">
		<c:choose>
			<c:when test="${isSuccess}">
				<h1>로그인 성공!</h1>
				<p>
					축하드립니다!<br /> 회원가입이 완료되었습니다. <br /> 이제 저희 서비스를 자유롭게 이용하실 수 있습니다.<br />
					환영합니다!
				</p>
				<br />
				<a href="${pageContext.request.contextPath}/index.jsp">메인 화면으로
					가기</a>
			</c:when>
			<c:otherwise>
				<p>
					로그인에 실패했습니다.<br /> 이메일이 존재하지 않거나 이메일과 비밀번호가 일치하지 않습니다.<br /> <a
						href="index.jsp">다시 로그인하러가기</a>
				</p>
			</c:otherwise>
		</c:choose>
	</header>
</body>
</html>