<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    String[] s = request.getParameterValues("checkno");
    String id = (String)session.getAttribute("theID");

	if(s!= null){
		
		BoardDAO dao = new BoardDAO();
		
		
		for(String x : s){
			int no = Integer.parseInt(x);
			dao.deleteOne(no,id);
		}
		
	}
    
	if(id.equals("admin")){
		response.sendRedirect("../adminMain.jsp?type=1");			
	}else{
		response.sendRedirect("../userMenu.jsp?type=2");
	}
   
    %>