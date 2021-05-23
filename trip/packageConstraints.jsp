<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.MakeConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String shortDesc = request.getParameter("shortdesc");
	String delay = request.getParameter("delay");
	String price = request.getParameter("price");
	String descript = request.getParameter("descript");
	String schedule = request.getParameter("schedule");
	String countryNo = request.getParameter("countryNo");
	String cityNo = request.getParameter("cityNo");
	Connection conn = MakeConnection.getInstance().getConnection();
	StringBuffer sb = new StringBuffer();
	if (title != null) {
		char[] leng = title.toCharArray();
		if (leng.length > 30) {
			out.println("titleExceed");
		} else if (leng.length == 0) {
			out.println("titleZero");
		} else {
			out.println("titleOk");
		}
	}
	if (shortDesc != null) {
		char[] leng = shortDesc.toCharArray();
		if (leng.length > 200) {
			out.println("shortDescExceed");
		} else if (leng.length == 0) {
			out.println("shortDescZero");
		} else {
			out.println("shortDescOk");
		}
	}
	if (delay != null) {
		char[] leng = delay.toCharArray();
		if (leng.length > 5) {
			out.println("delayExceed");
		} else if (leng.length == 0) {
			out.println("delayZero");
		} else {
			try {
				int a = Integer.parseInt(delay);
				if (a == 0) {
					out.println("delayRealZero");
				}else{
					out.println("delayOk");
				}
			} catch (Exception e) {
				out.println("delayNPE");
			}
		}
	}
	if (price != null) {
		char[] leng = price.toCharArray();
		if (leng.length > 10) {
			out.println("priceExceed");
		} else if (leng.length == 0) {
			out.println("priceZero");
		} else {
			try {
				int a = Integer.parseInt(price);
				if (a == 0) {
					out.println("priceRealZero");
				}else{
					out.println("priceOk");
				}
			} catch (Exception e) {
				out.println("priceNPE");
			}
		}
	}
	if (descript != null) {
		char[] leng = descript.toCharArray();
		if (leng.length > 2000) {
			out.println("descriptExceed");
		} else if (leng.length == 0) {
			out.println("descriptZero");
		} else{
			out.println("descriptOk");
		}
	}
	if (schedule != null) {
		char[] leng = schedule.toCharArray();
		if (leng.length > 1000) {
			out.println("scheduleExceed");
		} else if (leng.length == 0) {
			out.println("scheduleZero");
		} else{
			out.println("scheduleOk");
		}
	}
/* 	if (countryNo != null) {
		out.println		
	} */
%>