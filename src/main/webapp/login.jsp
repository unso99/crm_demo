<%@page import="owner.dto.OwnerDto"%>
<%@page import="owner.dao.OwnerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	
	boolean isValid = false;
	OwnerDto dto = OwnerDao.getInstance().getData(id);
	if(dto.getPassword().equals(pwd)){
		isValid = true;
	}
%>
{"isSuccess" : <%=isValid %>}