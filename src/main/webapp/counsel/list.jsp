<%@page import="customer.dao.CustomerDao"%>
<%@page import="customer.dto.CustomerDto"%>
<%@page import="counsel.dao.CounselDao"%>
<%@page import="counsel.dto.CounselDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CounselDto> list = (List<CounselDto>)request.getAttribute("list");
%>
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
			<a class="btn btn-primary me-md-2 mt-2" href="${pageContext.request.contextPath}/counsel/insert_form.jsp">상담 등록</a>
		</div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">고객이름</th>
		      <th scope="col">상담자</th>
		      <th scope="col">최근 상담일자</th>
		      <th scope="col">완료</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<%for(CounselDto dto : list) {%>
		  		<tr>
		  			<th scope="row">
		  				<a href="${pageContext.request.contextPath}/counsel/detail?id=<%=dto.getId()%>"><%=dto.getId() %></a>
		  			</th>
					<td><%=dto.getCustomer_name() %></td>
					<td><%=dto.getCounselor() %></td>
					<td>
						<%if(dto.getUpdated_at() == null) {%>
							<%=dto.getCreated_at() %>
						<%} else {%>
							<%=dto.getUpdated_at() %>
						<%} %>
					</td>
					<td>
						<%if(dto.getIs_finished().equals("false")) {%>
							진행중
						<%} else {%>
							완료
						<%} %>
					</td>		  		
		  		</tr>
		  	<%} %>
		  </tbody>
		</table>
	</div>
</body>
</html>