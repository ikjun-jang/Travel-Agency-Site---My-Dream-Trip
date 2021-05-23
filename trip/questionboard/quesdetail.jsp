<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
	border:1px solid black; 
	border-collapse:collapse;
	color:white;
	}
	table tr th {
	border:1px solid black;
	background-color:pink; 
	height:30px;
	font-size:14px;
	}
	table tr td {
	border:1px solid #462125; 
	text-align:center; 
	height:25px; 
	font-size:12px;
	}
	table td{
	background-color: skyblue;
	color:white;
	}
	#forms{
	position: absolute;
	top:100px;
	left:500px;
	}
</style>
</head>
<body>
	<%
		String no = request.getParameter("bno");
	
		if(no!=null){	
		//list.jsp에서 넘겨주는 게시물번호를 가지고 db에 가서 데이터 1건 조회한 후에
		BoardDAO dao = new BoardDAO();
		int n = Integer.parseInt(no);
		dao.raiseHits(n);
		BoardVO vo = dao.selectOne(n);
		
		//화면에 출력하는 기능.
	%>
		<form id = "forms">
		<table>
			<tr>
				<th>게시물 번호</th>
				<td><%=vo.getBno() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=vo.getId() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=vo.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows ="20" cols="50"><%=vo.getContent() %></textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=vo.getWdate() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=vo.getHits() %></td>
			</tr>
			<tr>
				<td colspan="3">
						<a href = "quesmodify.jsp?bno=<%=vo.getBno()%>"><input type="button" value="수정하기" /></a>
						<input type="button" value="뒤로 돌아가기" onclick="history.back();"/>
						<a href = "queswriteForm.jsp?bno=<%=vo.getBno()%>"><input type="button" value="댓글달기" /></a>
						<%-- <a href = "quesdeleteOk.jsp?no=<%=vo.getNo()%>"><input type="button" value="삭제하기" /></a> --%>

				</td>
			</tr>
		</table>
	</form>
	<%
		}
	%>

</body>
</html>