<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
	String reservation = request.getParameter("reservation");
	if (reservation != null) {
		if (reservation.trim().equals("reserve")) {
			out.println("reservationbtn");
		} else if (reservation.trim().equals("문의 게시판")) {
			out.println("boardbtn");
		} else if (reservation.trim().equals("계정 설정")){
			out.println("idchangebtn");
		}
	}
%>