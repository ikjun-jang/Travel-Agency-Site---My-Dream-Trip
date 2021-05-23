<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* #header{
	width:1000px;
	height:100px;
	margin:o auto;
	padding:o;
	position:absolute;
	left:100px;
} */
#txt1{ 
	left:500px;
	margin:30px;
}
 #search{
	width:30px;
	height:30px;
	left:660px;
	margin:25px;
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

body{
	margin:o;
	padding:o;
	left:300px;
}

/* #header{
	width:1000px;
	height:100px;
	background-color:pink;
} */
#content{
 	width:700px;
	margin:o auto;
	border: 2px solid skyblue;
}
table{
	width:600px;
	/* margin:o auto; */	
	margin-top:25px;
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
		
		$("#next").on('click',function(){
			
			var $em = $("#email");
						
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
			
			if($("#phone1").val() == "" && $("#phone2").val() == ""){
				alert('핸드폰 번호를 입력하세요');
				$("#phone1").focus();
				return;
			}
				
			
			$("form").submit();
		});
	});
		 
		 
</script>
</head>
<body>

<%
	Object ido = session.getAttribute("theID");
	String theID = ido.toString();
	UserDAO uDAO = new UserDAO();
	UserVO uVO = uDAO.selectOne(theID);
%>
	<!-- <div id="header">
	<img src="../images/header_logo.gif" />
		<input type="text" name="txt1" id="txt1" />
		<img src="../images/search.gif" id="search" />
		<ul>
					<li><a href='#'>회원가입</a></li>
					<li><a href='#'>로그인</a></li>
		</ul>
	</div>  -->
	<div id="rightTop">
	<img src="../images/a.png" alt="로고" />
	<h1>회원 정보 수정</h1>
	</div>
	<div id="content">
	<form action = "joinModifyOk.jsp" method = "post">
	<table border="0" align="center">
		<tr>
			<td width="200" bgcolor="#ffffcc">이름</td>
			<td><input type="text" name="name" id="name" value="<%=uVO.getName()%>"/></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">아이디
			<input type="hidden" name="id" value="<%=uVO.getId()%>"/>
			</td>
			<td>
				<%=uVO.getId() %>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">비밀번호</td>
			<td><input type="text" name="pw" id="pw" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">비밀번호 확인</td>
			<td><input type="text" name="" id="rpw" /></td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">성별</td>
			<td>
				<input type="radio" name="gender" id="" value = "0"
			<%
			if(uVO.getSex()==0){
			%>
				checked="checked"				
			<%
			}
			%>
				/>남
				<input type="radio" name="gender" id="" value = "1" 
			<% 
				if(uVO.getSex()==1){
			%> 
				
				checked="checked" 
			<%
			}
			%>
				/>여
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">메일주소</td>
			<td>
				<input type="text" name="email" id="email" value="<%=uVO.getEmail()%>"/>
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
			<td><input type="text" name="birthnum" id="birthnum" value="<%=uVO.getBirthNum()%>"/></td>
		
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
			<%
			String phoneNo = uVO.getPhone();
			String[] phone = new String[3];
				phone = phoneNo.split("-");
			%>
			<td>
				<select name="phone1" id="phone1">
					<option
					<%
					if(phoneNo!=null){
						if(Integer.parseInt(phone[0])==010){	
					%>
					selected="selected"
					<%
						}
					}
					%>
					>010</option>
					<option
					<%
					if(Integer.parseInt(phone[0])==011){	
					%>
					selected="selected"
					<%
					}
					%>
					>011</option>
				</select> -
<%

%>
				<input type="text" name="phone2" class="pn" id="phone2" value="<%=phone[1]%>"/> -
				<input type="text" name="phone3" class="pn" id="phone3"value=" <%=phone[2]%>"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffcc">결혼여부</td>
			<td>
			
				<input type="radio" name="m" id="" value="1" 
				<%
				if(uVO.getMarried()==1){
				%>
				checked="checked"
				<%
				}
				%>
				/> 기혼
				<input type="radio" name="m" id="" value="0"
				<%
				if(uVO.getMarried()==0){
				%>
				checked="checked"
				<%
				}
				%>
				/> 미혼
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
			<input type="button" value="회원정보수정" id="next"/>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>