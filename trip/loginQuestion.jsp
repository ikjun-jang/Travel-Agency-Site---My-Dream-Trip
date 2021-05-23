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
<%
	String id2 = request.getParameter("id");
	//ArrayList<UserVO> list = new ArrayList<UserVO>();
	UserVO vo = new UserVO();
	UserDAO dao = new UserDAO();
	vo = dao.selectOne(id2);
%>
	<h2>Password 확인</h2>
	<p>가입시 설정한 질문에 답해주세요.</p><br/>
	<form action="questionCheck.jsp">
		<p>질문: <%=vo.getQuestion() %></p>
		<input type="hidden" name="id" value="<%=vo.getId() %>" />
		<input type="text" name="answer" id="answer" /><br/><br/>
		<input type="submit" value="  확  인  " />
		<input type="button" value="  취  소  " onclick="goLogin();" />
	</form>
</div>
</body>
</html>