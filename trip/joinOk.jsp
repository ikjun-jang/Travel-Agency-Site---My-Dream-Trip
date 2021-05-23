<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("pw");
	String gender_s = request.getParameter("gender");
	int gender = 0;
	String email = request.getParameter("email");
	String birthnum_s = request.getParameter("birthnum");
	int birthnum = 0;
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String phoneNum = request.getParameter("phone1") +"-"+ request.getParameter("phone2") +"-"+request.getParameter("phone3");
	String married_s = request.getParameter("m");
	int married = 0;
	
	if(gender_s != null){
		gender = Integer.parseInt(gender_s);
	}
	
	if(birthnum_s != null){
		birthnum = Integer.parseInt(birthnum_s);
	}
	
	if(married_s != null){
		married = Integer.parseInt(married_s);
	}
	
	UserDAO userDAO = new UserDAO();
	UserVO userVO = new UserVO();
	userVO.setId(id);
	userVO.setName(name);
	userVO.setPassword(password);
	userVO.setSex(gender);
	userVO.setEmail(email);
	userVO.setBirthNum(birthnum);
	userVO.setQuestion(question);
	userVO.setAnswer(answer);
	userVO.setPhone(phoneNum);
	userVO.setMarried(married);
	
	userDAO.insertOne(userVO);
	
	session.setAttribute("id", id);
	
	response.sendRedirect("mainpage.jsp");
	//response.sendRedirect(request.getHeader("referer"));

%>