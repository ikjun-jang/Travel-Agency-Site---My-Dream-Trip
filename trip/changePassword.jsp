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
	right: 350px;
	top: 300px;
	font-weight: bold;
	font-family: "나눔고딕";
}
span{
	color: brown;
}
#header{
	background-color: white;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#btn").on('click',function(){
		
 		if($("#id").val() == ""){
			alert('아이디를 입력하세요');
			$("#id").focus();
			return;
		} 
		
		if($("#pw").val() == ""){
			alert('패스워드를 입력하세요');
			$("#pw").focus();
			return;
		}
		
		if($("#pw2").val() == ""){
			alert('패스워드를 재입력하세요');
			$("#pw2").focus();
			return;
		}
		
		if($("#pw").val() != $("#pw2").val()){
			
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		$("#frm").submit();
	});
});
</script>

</head>
<body>
<div id="header"><%@include file="header.jsp" %></div>
<div id="box1">
	<img src="../images/effel_tower.png" alt="" />
</div>
<div id="box2">
<form id="frm" action="changePwOk.jsp">
	<table>
	<caption><h3>Password 변경</h3></caption>
	<tr>
		<th>ID</th> 
		<td><input type="text" name="id" id="id" /> <span id="spId"></span></td>
	</tr>
	<tr>
		<th>Password 입력</th> 
		<td><input type="text" name="pw" id="pw" /> <span id="spPw"></span></td>
	</tr>
	<tr>
		<th>Password 확인</th>
		<td><input type="text" name="pw2" id="pw2" /> <span id="spPw2"></span></td> 
	</tr>
		<td colspan="2">
		<span id="spAlarm"></span><br/>
		</td>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="확인" id="btn" />
		</td>
	</tr>
	</table>
</form>
</div>
</body>
</html>