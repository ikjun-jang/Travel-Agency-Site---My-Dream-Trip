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
	String id = request.getParameter("id");
	String enteredAnswer =request.getParameter("answer");
	//out.println(id);
	//out.println(enteredAnswer);
	UserVO vo = new UserVO();
	UserDAO dao = new UserDAO();
	vo = dao.selectOne(id);
	String realAnswer = vo.getAnswer();
	//out.println(realAnswer);
	if(enteredAnswer.equals(realAnswer)) {
		response.sendRedirect("changePassword.jsp");
	}
	else {
		response.sendRedirect("loginFail.jsp");
	}
%>
</body>
</html>