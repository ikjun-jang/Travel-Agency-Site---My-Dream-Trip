<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 

	* { 
	  -webkit-box-sizing: border-box;
	     -moz-box-sizing: border-box;
	          box-sizing: border-box;
	} 
	html, body {
		margin: 0px;
		padding: 0px;
		width: 100%;
		height: 100%;
		min-width: 980px;
		font-family: "Nanum Gothic","나눔고딕";
		letter-spacing: -1px;
	}
	
	li {
  		list-style: none;
		text-align: -webkit-match-parent;

	}
	
	
	a:-webkit-any-link {
		color: -webkit-link;
		text-decoration: underline;
		cursor: auto;
	}

	#content {
		position : relative;
		
	}
	.container{
		position : relative;
		margin : 0 auto;
		width : 980px;
	}
	
	.clear:after {
		clear: both;
	}
	
	.clear:before, .clear:after {
		content: " ";
		display: table;
	}
	
	#headdiv{
		position : relative;
		width : 100%;
		height : 90px;
		/* text-align : center; */
		overflow : hidden;
		z-index: 10;
		background-color: white; 
	}
	
body{
	background-color: black;
}
#box1{
	position: absolute;
	top: 100px;
	left : 0px;
}
#box2{
	position: absolute;
	left: 40%;
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
	var times = 0;
	$("#loginBtn").on('click',function(){
		 var id = $("#id").val();
		 var pw = $("#pw").val();
		 var idCheck = false;
		 var pwCheck = false;
		 
 		 $.ajax({
			type : "POST",
			async : true,
			url : "joinIdCheck.jsp",
			dataType : "html",
			// 전송받는 데이터 : html, xml, json
			// name=aaa&pw=bb
			data : {"id" : id},
			
			// 성공시 호출할 익명함수
			success : function(response, status, request){
				//alert("성공 !!!");
				var value = response.trim();
				console.log(value);
				if(value == "false"){
					$("#spId").html("존재하지 않는 ID 입니다.");
					
					times++;
					if(times==3){
						$("#frm").attr("action", "idForget.jsp");	 
						$("#frm").submit();
					}
					
					//$("#spAlarm").html("비밀번호 3회 실패시 인증 필요");
					
				}else{
					$("#spId").html("");
					idCheck = true;
					console.log(idCheck);
				}
			},
			// 에러 발생시 호출할 익명함수
			error : function(response, status, request){
				alert("에러발생 !!!");
			},
			// 완료후 실행할 익명함수
			complete : function(){
				//alert("완료 !!!");
			}
		}); 
		 
		 $.ajax({
				type : "POST",
				async : true,
				url : "loginPwCheck.jsp",
				dataType : "html",
				// 전송받는 데이터 : html, xml, json
				// name=aaa&pw=bb
				data : {"id" : id},
				
				// 성공시 호출할 익명함수
				success : function(response, status, request){
					//alert("성공 !!!");
					var value = response.trim();
					if(value == pw){
						$("#spPw").html("");
						pwCheck = true;
						
						 if(idCheck==true && pwCheck==true) 
							 $("#frm").attr("action", "loginOk.jsp");	 
							 $("#frm").submit();
						 
						 
						}else
							$("#spPw").html("ID 와 패스워드가 일치하지 않습니다.");
							if(idCheck==true){
								
								
								times++;
								if(times==3){
									$("#frm").attr("action", "loginQuestion.jsp");	 
									$("#frm").submit();
								}
								//$("#spAlarm").html("비밀번호 3회 실패시 인증 필요");								
								
							}
				},
				// 에러 발생시 호출할 익명함수
				error : function(response, status, request){
					alert("에러발생 !!!");
				},
				// 완료후 실행할 익명함수
				complete : function(){
					//alert("로그인성공 !!!");
				}
		});
	});
});

function goHome() {
	location.href = "mainpage.jsp"	;
}

function goPw() {
	var id = document.getElementById("id");
	if(id.value == ""){
		alert('ID를 입력하세요.');
		id.focus();
		return;
	} else {
		location.href = "loginQuestion.jsp?id=" + id.value	;
	}
}
</script>
</head>
<body>
<div id="header"><%@include file="header.jsp" %></div>
<div class = "container">
<div id="box1">
	<img src="../images/effel_tower.png" alt="" width="980px"/>
</div>
<div id="box2">
<form id="frm">
	<table>
	<caption><h1>LOGIN</h1></caption>
	<tr>
		<th>ID</th> 
		<td><input type="text" name="id" id="id" /> <span id="spId"></span></td>
	</tr>
	<tr>
		<th>PW</th>
		<td><input type="password" name="pw" id="pw" /> <span id="spPw"></span></td> 
	</tr>
	<tr>
		<td colspan="2">
		<span id="spAlarm">로그인 3회 실패시 인증 필요</span><br/>
<!-- 		<input type="checkbox" name="loginCheck" id="" />
		Keep logged in<br/> -->
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="Login" id="loginBtn" />
		<input type="button" value="Home" id="homeBtn" onclick="goHome();" />
		</td>
	</tr>
	</table>
	<p>
		<a href="idForget.jsp">Forgot ID</a> / 
		<a onclick="goPw();">
			<font color="purple">
				<u>Forgot Password</u>
			</font>
		</a>
	</p>
</form>
</div>
</div>
</body>
</html>