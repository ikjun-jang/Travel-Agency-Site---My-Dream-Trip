<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.eventDAO"%>
<%@page import="vo.eventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color:black;
}
#back{
	position:absolute;
	top:50px;
	left:220px;
}
img{
	width:1000px;
	height:600px;
}
#dctable{
	position:absolute;
	width: 50px;
	height: 50px;
	top:100px;
	left:250px;
}
table{
	width:400px;
	height:400px;
	border:1px solid black;
}
td{
	font-size:15px;
	font-weight:bold;
}
.name{
	width:250px;
	text-align:center;
}
#title{
	text-align:center;
	font-size:20px;
	color:darkblue;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name='back']").on('click', function(){
			location.href="mainpage.jsp";
		});
		$("input[name='go']").on('click', function(){
			location.href="package.jsp?pno=31";
		});
	});

</script>
</head>
<body>
	<%
		PackageDAO dao = new PackageDAO();
	%>
		<div id="back">
			<img src="../images/eventbg1.jpg" alt="" />
		</div>
		<div id="dctable">
			<table>
				<tr>
		<%
			PackageVO vo = dao.selectOne(31); 
		%>
					<td colspan="2"  id="title"><%=vo.getTitle() %></td>
				</tr>
				<tr>
					<td class="name">기간</td>
					<td><%=vo.getDelay()%>일</td>
				</tr>
				<tr>
					<td class="name">원래 가격</td>
					<td><%=(int)(vo.getPrice()*1.2)%>원</td>
				</tr>
				<tr>
					<td class="name">할인 가격</td>
					<td><%=vo.getPrice()%>원</td>
				</tr>
				<tr>
					<td><input type="button" value="돌아가기" name="back"/></td>
					<td><input type="button" value="상세보기" name="go"/></td>
				</tr>
			</table>
		</div>
</body>
</html>