<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	String referer = request.getHeader("referer");
	if(referer.contains("userMenu")){
		response.sendRedirect("mainpage.jsp");
	}else{
		response.sendRedirect(request.getHeader("referer"));
	}
	
%>