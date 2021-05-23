<%@page import="dao.PackageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("packageNo");
	PackageDAO pDAO = new PackageDAO();
	
	if(a!=null){
		int no = Integer.parseInt(a);
		pDAO.deleteOne(no);	
		response.sendRedirect("adminMain.jsp?type=3");
	}

%>