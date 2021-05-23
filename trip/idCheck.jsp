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
	right: 370px;
	top: 300px;
	font-weight: bold;
	font-family: "나눔고딕";
}
#header{
	background-color: white;
}
</style>
</head>
<body>
<div id="header"><%@include file="header.jsp" %></div>
<div id="box1">
	<img src="../images/effel_tower.png" alt="" />
</div>
<div id="box2">
	<p>당신의 아이디는 <%=request.getParameter("id") %>입니다.</p>
	<p>추가적인 질문이 있을 시 관리자에게 문의해 주세요.</p><br/>
	<p>Email : admin@hbi.com</p>
	<p>Phone: 010-xxx-xxxx</p>
</div>
</body>

</html>