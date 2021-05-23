<%@page import="java.util.ArrayList"%>
<%@page import="vo.CountryVO"%>
<%@page import="vo.CityVO"%>
<%@page import="vo.PackageVO"%>
<%@page import="dao.CityDAO"%>
<%@page import="dao.CountryDAO"%>
<%@page import="dao.PackageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	function go(){
		$("#f").submit();
	}
	
	function login(){
		alert("로그인 후 이용 가능 합니다.");
		location.href="login.jsp";
	}
</script>
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
	 
	#top{
		width: 100%;
		height: 300px;
		overflow : hidden;
		background-color: skyblue;
		position : relative;
		font-weight: 700;
		color: #fff;
	}
	
	#main{
		position : relative;
	}
	
	.scorebox{
		padding: 0;
		margin-bottom: 5px;
		line-height: 22px;
		height: 34px;
	}
	
	.scorebox .score{
		display: block;
		float: left;
		margin: 2px 2px 0 0;
		margin-top: 0;
 		width: 22px;
		height: 22px;
	}
	
	.score span {
		display: block;
		width: 18px;
		height: 18px;
		background: url("../images/star.png") no-repeat;
	}
	
	.score.on span {
		background-position: -20px 0;
	}
	
	.score.half span {
		width: 9px;
		background-position: -20px 0;
	}
	
	img.blur {
		filter: blur(4px);
		-webkit-filter: blur(4px);
		-moz-filter: blur(4px);
		-o-filter: blur(4px);
		-ms-filter: blur(4px);
	}
	
	#top .container{
		position: absolute;
		top: 0;
		left: 50%;
		padding-top: 45px;
 		text-align: left;
		margin: 0 0 0 -490px;
	}
	
	#top-bg{
		margin: 0 auto;
		min-width: 1200px;
		text-align: center;
	}
	
	#top-bg img {
		width: 100%;
	}
	
	#nav{
		height : 29px;
	}
	
	#nav p {
		display: block;
		-webkit-margin-before: 1em;
		-webkit-margin-after: 1em;
		-webkit-margin-start: 0px;
		-webkit-margin-end: 0px;
	}
	
	.nation{
		text-shadow: 0 1px 2px rgba(0,0,0,0.3);
		display: inline-block;
		margin: 0;
		font-size: 16px;
		vertical-align: middle;
		zoom: 1;
	}
	
	#nav img{
		width: 35px;
 		height: 16px;
		margin: -2px 5px 0 0;
		vertical-align: middle;
		padding-right: 15px;
		margin-right: 8px;
	}
	
	#nav span{
		padding-right: 15px;
		margin-right: 8px;
	}
	
	.title {
		padding-top: 8px;
		margin-bottom: 20px;
		font-size: 29px;
		font-weight: 700;
		text-shadow: 0 1px 3px rgba(0,0,0,0.5);
	}
	
	.scorebox{
		padding: 0;
		margin-bottom: 5px;
		line-height: 22px;
		height: 34px;
	}
	
	.scorebox p{
		float: left;
		margin-right: 8px;
		font-weight: 700;
		font-size: 16px;
		color: #fff;
	}


</style>
</head>
<body>
	<%
	String pno = request.getParameter("pno");
	int packageNum = 0;
	if(pno!=null){
		packageNum = Integer.parseInt(pno);
	}
	
	/////////테스트///////
	//packageNum = 1;
	///////////////////
	
	PackageDAO packageDAO = new PackageDAO();
	CountryDAO countryDAO = new CountryDAO();
	CityDAO cityDAO = new CityDAO();
	
	PackageVO packageVO = packageDAO.selectOne(packageNum);
	CityVO cityVO = cityDAO.selectOne(packageVO.getCityNum());
	CountryVO countryVO = countryDAO.selectOne(cityVO.getCountryNo());

	String countryName = countryVO.getName();
	String countryImg = countryVO.getImg();
	String packageTitle = packageVO.getTitle();
	int voteGrade = packageVO.getVoteGrade();
	ArrayList<String> tags = new ArrayList<String>();
	
	String packageImg1 = packageVO.getImg1();
	
	%>
	<%@ include file = "header.jsp" %>
	<div id="content">
		<div id="top">
			<div id="top-bg">
				<img class = "blur" alt="대표 이미지" src="<%=packageImg1%>"
				 style = "margin-top:-200px" />
			
			</div>
			<div class="container">
				<div id = "nav">
					<img src="<%=countryImg %>" alt="국기"/>
					<p class = "nation" >
						<span><%=countryName %></span>
					</p>
				</div>
				<h2 class = "title" ><%=packageTitle %></h2>
				<div class = "scorebox">
					<p>평점</p>
					<%
						int count = 0;
						for(int i = 0; i < 5; i++){
							if(++count <= voteGrade){
								if(++count <= voteGrade){
					%>
						<span class = "score on">
							<span></span>
						</span>
					<%				
								}else{
					%>
						<span class = "score half">
							<span></span>
						</span>
					<%				
								}
							}else{
					%>
						<span class = "score">
							<span></span>
						</span>
					<%			
							}
						}
					
					%>
				</div>
				
						<%
							/* for(String s : tags){
								out.println(s + " ");
							} */
						%>
			</div>
		</div>
		<%
			
			String hc = request.getParameter("headCount");
			String rYear = request.getParameter("rYear");
			String rMonth = request.getParameter("rMonth");
			String rDay = request.getParameter("rDay");
			
			int headCount = 0;
			if(hc != null){
				headCount = Integer.parseInt(hc);
			}
			
			String date = rYear+"-"+rMonth+"-"+rDay;
		
		%>
		<div id="main">
			<div class = "container">
				<form action="sendMail.jsp" method="post" id="f">
					<p><%=packageVO.getTitle() %></p>
					<table>
						<tr>
							<td>인원</td>
							<td><%=headCount %></td>
							<td>여행 희망일</td>
							<td><%=date %></td>
						</tr>
						<tr>
							<td colspan = "4">요청 사항</td>
						</tr>
						<tr>
							<td colspan = "4">
							<textarea cols = 80, rows = 20 name="ask">
							
							</textarea>
							</td>
						</tr>
					</table>
					<br/>
					<div id="confirm">
						<input type="hidden" name="headCount" value="<%=headCount %>" />
						<input type="hidden" name="date" value="<%=date %>" />
						<input type="hidden" name="id" value="<%=id %>" />
						<input type="hidden" name="pno" value="<%=packageNum %>" />
						<%
							String checkLogin = loginOk ? "'go();'" : "'login();'";
						%>
						<input type="button" value="확인" onclick= <%=checkLogin %>/>
						<input type="button" value="취소" onclick="javascript:history.back()"/>
					</div>
				</form>		
		
			</div>
		</div>
	</div>

</body>
</html>