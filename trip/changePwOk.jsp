<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	out.println(id);
	out.println(pw);
	UserVO vo = new UserVO();
	UserDAO dao = new UserDAO();
	dao.updatePw(id, pw);
	response.sendRedirect("login.jsp");
%>
</body>
</html>