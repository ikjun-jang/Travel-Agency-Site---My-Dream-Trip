<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
session.setAttribute("theID", id);
response.sendRedirect("mainpage.jsp");

%>