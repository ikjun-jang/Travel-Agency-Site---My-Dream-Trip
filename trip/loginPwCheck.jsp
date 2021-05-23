<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	UserDAO userDAO = new UserDAO();
	
	out.println(userDAO.checkPw(id));

%>