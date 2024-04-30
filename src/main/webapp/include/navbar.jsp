<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">고객관리</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarScroll"
					aria-controls="navbarScroll" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarScroll">
					<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
						style="--bs-scroll-height: 100px;">
						<li class="nav-item dropdown" aria-current="page">
							<a class="nav-link dropdown-toggle ${param.current eq 'customer' ? 'active' : '' }" href="#"
							id="navbarScrollingDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 고객 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/customer/insert_form.jsp">고객 등록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/index.jsp">고객 조회</a></li>
							</ul></li>
						<li class="nav-item">
							<a class="nav-link ${param.current eq 'counsel' ? 'active' : '' }" href="${pageContext.request.contextPath}/counsel/list.jsp">상담</a>
						</li>
					</ul>
					<div class="navbar-nav">
						<c:choose>
			      			<c:when test="${ not empty id}">
				      			<a class="nav-link" href="#">${id }</a>
					      		<a class="nav-link" href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
			      			</c:when>
			      			<c:otherwise>
				      			<a class="nav-link" href="${pageContext.request.contextPath}/owner/login_form">로그인</a>
			      			</c:otherwise>
			      		</c:choose>
					</div>
				</div>
			</div>
		</nav>