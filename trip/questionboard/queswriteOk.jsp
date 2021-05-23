<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");	
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("theID");
		String bno_s = request.getParameter("bno");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(bno_s != null){
			int bno = Integer.parseInt(bno_s);
			dao.insertOne(vo,bno);
		}else{
			dao.insertOne(vo);
		}
	

		
		if(id.equals("admin")){
			response.sendRedirect("../adminMain.jsp?type=1");			
		}else{
			response.sendRedirect("../userMenu.jsp?type=2");
		}
		
	
	%>
    