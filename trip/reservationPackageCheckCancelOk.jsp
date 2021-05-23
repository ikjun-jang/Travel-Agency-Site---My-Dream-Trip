<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String packagen = request.getParameter("packageNo");
	String n = request.getParameter("no");
	String scor = request.getParameter("score");
	ReservationDAO rDAO = new ReservationDAO();
	PackageDAO pDAO = new PackageDAO();
	if(packagen!=null){
		int no = Integer.parseInt(n);
		int packageNo = Integer.parseInt(packagen);
		int score = 0;
		if(scor!=null){
			score=Integer.parseInt(scor);
		}
		PackageVO vo = pDAO.selectOne(packageNo);
		int voteGrade = vo.getVoteGrade();
		int votePeopleNum = vo.getVotePeopleNum();
		voteGrade = (voteGrade*votePeopleNum+score)/(votePeopleNum+1);
		votePeopleNum++;
		vo.setVoteGrade(voteGrade);
		vo.setVotePeopleNum(votePeopleNum);
		pDAO.updateVoteGrade(vo);
		rDAO.updateVote(no);
		response.sendRedirect("userMenu.jsp?type=1");
	}else{
		if(n!=null){
			int no = Integer.parseInt(n);
			rDAO.updateOne(no);
			response.sendRedirect("userMenu.jsp?type=1");
		}
	}
%>
</body>
</html>