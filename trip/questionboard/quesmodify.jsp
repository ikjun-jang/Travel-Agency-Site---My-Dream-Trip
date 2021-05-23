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
		BoardVO vo = dao.selectOne(n);
			//화면에 출력하는 기능.
		%>
		
		<form action = "quesmodifyOk.jsp" id="forms" method="post">
		<table>
			<tr>
				<th>게시물 번호</th>
				<td><%=vo.getBno() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=vo.getId() %>
				<input type="hidden" name="bno" value="<%=vo.getBno()%>"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="" value = "<%=vo.getTitle()%>"/ size="40"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows ="20" cols="50" name="content" ><%=vo.getContent() %></textarea></td>
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
				<td colspan="2">
					
				<input type="submit" value="수정" />

					<input type="button" value="뒤로" onclick="history.back();"/>
					
					<a href = "../userMenu.jsp?type=2"><input type="button" value="홈으로" /></a>
				</td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
	
	
	

</body>
</html>