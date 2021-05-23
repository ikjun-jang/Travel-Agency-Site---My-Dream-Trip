<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#footer-img{
	position: absolute;
	left: 350px;
	top: 50px;
}
#footer-box{
	margin: 0px;
	padding: 0px;
	position: absolute;
	top: 1300px;
	width: 1700px;
	height: 300px;
	background-color: #252F38;
}
#footer-title{
	position: absolute;
	font-size: 40px;
	left: 620px;
	color:white;
}
#info{
	color:white;
	position: absolute;
	font-size: 13px;
	left: 600px;
	top: 130px;
}

#dev{
	color:white;
	position: absolute;
	font-size: 13px;
	left: 900px;
	top: 130px;
}
</style>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="footer-box">
<img src="../images/footerlogo.png" id="footer-img">
<p id="footer-title">MY DREAM TRIP</p>
<div id = "info">
마이드림트립<br/><br/>
email: admin@mydreamtrip.com<br/>
phone: 010-000-0000<br/>
예약문의: 010-999-9999<br/>
</div>
<div id= "dev">
<a href="developers.jsp"><font color="white">개발자들</font></a><br/><br/>
장익준<br/>
전정환<br/>
이상현<br/>
최대한<br/>
김보은<br/>
</div>
</div>
</body>
</html>