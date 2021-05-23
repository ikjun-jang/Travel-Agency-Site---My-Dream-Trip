<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	}
	
	
	a:-webkit-any-link {
		color: -webkit-link;
		text-decoration: underline;
		cursor: auto;
	}

	.container{
		position : relative;
		margin : 0 auto;
		width : 980px;
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


ul{
	width:200px;
	list-style: none;
	float:right;
	margin-top:30px;
	
}
li{
	float:left;
	margin-left:20px;
}

#content{
	position : relative;
}

#content .container{
	width:960px;
	margin:o auto;
	border: 2px solid skyblue;
}
table{
	width:700px;
	height:500px;
	margin-top:100px;
}
caption{
	float:left;
}
table,tr{
	font-size:13px;
	font-weight:bold;
}
table td{
	padding:9px; border:1px solid #fff;
}


.pn{
	width : 70px;
}

#back,#next{
	width:100px;
	height:50px;
	margin-top:50px;
	background-color:#ffffcc;
	border-radius:10px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
/* 
		function gogo(x){
		    if(x.form[0].selectedIndex == 1){
		    }else if(x.form[0].selectedIndex == 2){
		    }else if(x.form[0].selectedIndex == 3){
		  	}else if(x.form[0].selectedIndex == 4){
		    }else{
		  		$("#txt").show();
		    }
		  
		 } */
		 
		 
	/////////////////// 아이디 중복 체크 ///////////////////
	var idCheck = false;
		 
	$(document).ready(function(){
		$("#checkBtn").on('click',function(){
			 var id = $("#id").val();
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
						$("#sp").html("사용 가능 ID입니다. ");
						idCheck = true;
					}else{
						$("#sp").html("사용 불가능 ID입니다. ");
						idCheck = false;
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
		});
		
		$("#next").on('click',function(){
			
			var $em = $("#email");
			
			if(!idCheck){
				alert("아이디 중복 확인이 필요합니다.");
				return;
			}
			
			if($("#pw").val() == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
					
			if($("#pw").val() != $("#rpw").val()){
				
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			
			
			if($em.val().indexOf('@') == -1){
				alert('이메일 주소가 아니잖아 @.@');
				$em.value='';
				$em.focus();
				return;
			}
			
			if($("#name").val() == ""){
				alert('이름을 입력하세요');
				$("#name").focus();
				return;
			}
			
			if($("#birthnum").val() == ""){
				alert('생년월일을 입력하세요');
				$("#birthnum").focus();
				return;
			}
			
			if($("#answer").val() == ""){
				alert('답변을 입력하세요.');
				$("#answer").focus();
				return;
			}
			
			if($("#phone2").val() == "" || $("#phone3").val() == ""){
				alert('핸드폰 번호를 입력하세요');
				$("#phone2").focus();
				return;
			}
				
			
			$("form").submit();
		});
		
		$("#back").on('click',function(){
			location.href="mainpage.jsp"
		});
	});
		 
		 
</script>
</head>
<body>
<%@ include file = "header.jsp" %>

	
	<div id="content">
	<div class="container">
	<form action = "joinOk.jsp" method = "post">
	<table border="0" align="center">
		<caption><h2>회원가입</h2></caption>
		<tr>
			<td width="200" bgcolor="#ffffcc">이름</td>
			<td><input type="text" name="name" id="name" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">아이디</td>
			<td>
			<input type="text" name="id" id="id" />
			<input type="button" value="중복체크" id="checkBtn" /><span id="sp"></span>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">비밀번호</td>
			<td><input type="password" name="pw" id="pw" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">비밀번호 확인</td>
			<td><input type="password" name="" id="rpw" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">성별</td>
			<td>
				<input type="radio" name="gender" id="" value = "0"/>남
				<input type="radio" name="gender" id="" value = "1" checked />여
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">메일주소</td>
			<td>
				<input type="text" name="email" id="email" />
				<!-- <select onchange="gogo(this);" >
					<option>naver.com</option>
					<option >nate.com</option>
					<option>gmail.com</option>
					<option >직접입력</option>
					<input type="text" name="" id="txt"  style="display:none" />
				</select> -->
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">생년월일( 예시- 990101 )</td>
			<td><input type="text" name="birthnum" id="birthnum" /></td>
		
		</tr>
		<tr>
			<td bgcolor="#ffffcc">비밀번호 분실시 질문</td>
			<td>
				<select name = "question">
					<option>자신이 태어난 곳은 ? </option>
					<option>어머님 성함은 ? </option>
					<option>첫키스 장소는 ? </option>
				</select>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">답</td>
			<td><input type="text" name="answer" id="answer" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">핸드폰번호</td>
			<td>
				<select name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
				</select> -
				<input type="text" name="phone2" class="pn" id="phone2"/> -
				<input type="text" name="phone3" class="pn" id="phone3"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">결혼여부</td>
			<td>
				<input type="radio" name="m" id="" value="1"  checked/> 기혼
				<input type="radio" name="m" id="" value="0"/> 미혼
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
			<input type="button" value="홈으로" id="back"/>
			<input type="button" value="회원가입" id="next"/>
			</td>
		</tr>
	</table>
	</form>
	</div>
	</div>
</body>
</html>