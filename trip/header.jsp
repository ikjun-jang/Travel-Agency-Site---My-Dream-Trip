<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#searchHeader-img").on('click',function(){
			var keyword = $("#headerTxt").val();
			location.href="search.jsp?keyword="+keyword;
		});
		
	});
	
	function logout() { 
		location.href="logout.jsp";
	}
	
	function goMyMenu(){
		location.href="userMenu.jsp?type=1";
	}
 
</script>


	<%
		boolean loginOk = false;	// 로그인 확인 
		String id = null;
		
		//session.setAttribute("id", "m2000jh");
		//out.println(request.getHeader("referer"));
	%>
	<div id ="headdiv">
		<div class = "container">
			<div id = head-Img>
				<a href = "mainpage.jsp"><img src="../images/header_logos.png"/></a>
			</div>
			<div id="head-search">
				<input type="text" name="" id="headerTxt" />
				<img src="../images/search.gif" id="searchHeader-img" />
			</div>
			<div id="head-login">
	<%
	
	if(session.getAttribute("theID") == null){
		loginOk = false;
	%>
		<ul>
			<li><a href='join.jsp'>회원가입</a></li>
			<li><a href='login.jsp'>로그인</a></li>
		</ul>
	<%
	
	}else{
		
		loginOk = true;
		
		id = (String)session.getAttribute("theID");
		
		UserDAO userDAO = new UserDAO();
		UserVO userVO = userDAO.selectOne(id);
	%>
		<!-- <img src="../images/header_logo.gif" class="headImg"/>
		<input type="text" name="" id="headerTxt" />
		<img src="../images/search.gif" id="searchHeader" /> -->
		<ul>
			<li><%=userVO.getName()%> 님 안녕하세요!</li>
			<li>
				<input type="button" value="마이 메뉴" onclick = "goMyMenu();" />
				<input type="button" value="Logout" onclick="logout();"/>
			</li>
		</ul>
	<%
		
	}
	
	%>
			</div>
		</div>
		
	</div>
