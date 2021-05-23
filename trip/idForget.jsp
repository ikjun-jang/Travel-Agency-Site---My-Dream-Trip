<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color: black;
}
#box1{
	position: absolute;
	top: 100px;
	left:250px;
}
#box2{
	position: absolute;
	right: 400px;
	top: 300px;
	font-weight: bold;
	font-family: "나눔고딕";
}
#header{
	background-color: white;
}
</style>
<script>
function goLogin() {
	location.href = "login.jsp"	;
}
</script>

</head>
<body>
<div id="header"><%@include file="header.jsp" %></div>
<div id="box1">
	<img src="../images/effel_tower.png" alt="" />
</div>
<div id="box2">
	<h1>ID 확인</h1>
	<p>가입시 설정한 정보를 입력하세요.</p><br/>
	
	<form action="idForgetCheck.jsp">
		<table>
		<tr>
		<td>생년월일:</td>
		<td><input type="text" name="birth" id="birth" /></td>
		</tr>
		<tr>
		<td>Email:</td>
		<td><input type="text" name="email" id="email" /></td>
		</tr>
		<tr>
		<td colspan="2" >
		<input type="submit" value="  확  인  " />
		<input type="button" value="  취  소  " onclick="goLogin();" />
		</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>