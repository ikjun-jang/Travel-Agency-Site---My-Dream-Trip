<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String n = request.getParameter("bno");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("theID");
	
		if(n!=null){
			int no = Integer.parseInt(n);
			
			BoardDAO dao = new BoardDAO();
			BoardVO vo = new BoardVO();
			
			vo.setBno(no);
			vo.setTitle(title);
			vo.setContent(content);
			dao.updateOne(vo);
			if(id.equals("admin")){
				response.sendRedirect("../adminMain.jsp?type=1");			
			}else{
				response.sendRedirect("../userMenu.jsp?type=2");
			}
			
		}

%>
