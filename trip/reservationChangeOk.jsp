<%@page import="dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String n = request.getParameter("no");
	String statu = request.getParameter("status");
	int no = 0;
	int status = 0;
	if(n!=null){
		no = Integer.parseInt(n);
	}
	if(statu!=null){
		status = Integer.parseInt(statu);
	}
	ReservationDAO rDAO = new ReservationDAO();
	rDAO.updateOne(status, no);
	response.sendRedirect("adminMain.jsp?type=2");
%>