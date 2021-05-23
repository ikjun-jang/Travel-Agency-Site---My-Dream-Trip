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
	#wrap{
	position: absolute;
	top:100px;
	left:500px;
	}
	

</style>
</head>
<body>
		<div id ="wrap">
		<form action ="queswriteOk.jsp">
		<table>
			<tr>
				<th>작성자</th>
				<td><%=session.getAttribute("theID") %></td>
			</tr>
			<tr>
			<th>제목</th>
				<td><input type="text" name="title" id="" size="40"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows ="20" cols="50" name="content" ></textarea>   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성" />
					<input type="button" value="되돌아가기" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
</body>
</html>