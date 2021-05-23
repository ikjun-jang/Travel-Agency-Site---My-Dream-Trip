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
	String enteredBirth =request.getParameter("birth");
	String enteredEmail =request.getParameter("email");
	
	try {
		UserVO vo = new UserVO();
		UserDAO dao = new UserDAO();
		vo = dao.selectId(Integer.parseInt(enteredBirth), enteredEmail);
		String id = vo.getId();
		response.sendRedirect("idCheck.jsp?id=" + id);
	} catch(Exception e){
		response.sendRedirect("loginFail.jsp");
	}
%>
</body>
</html>