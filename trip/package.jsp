<%@page import="vo.CityVO"%>
<%@page import="dao.CityDAO"%>
<%@page import="vo.CountryVO"%>
<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="dao.CountryDAO"%>
<%@page import="java.util.ArrayList"%>
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
		font-family: "Nanum Gothic","ëëęł ë";
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
		background-color: skyblue;
		position : relative;
		font-weight: 700;
		color: #fff;
	}
	
	#maincontent{
		position : relative;
		background: #ebeff1; 
		z-index: 10;
	}
	
	#right{
		display:block;
		width: 25%;
		float : right;
		background-color: white;
	}
	
	#detail{
		display:block;
		width: 70%;
		background-color: white;
		float : left;
	}
	
	#img1,#img2,#img3{
		width : 180px;
		height : 120px;
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
	<%
	String pno = request.getParameter("pno");
	int packageNum = 0;
	if(pno!=null){
		packageNum = Integer.parseInt(pno);
	}
	
	/////////íě¤í¸///////
	//packageNum = 2;
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
	
	String packageMainImg = packageVO.getImg1();
	String packageImg1 = packageVO.getImg1();
	String packageImg2 = packageVO.getImg2();
	String packageImg3 = packageVO.getImg3();
	
	if(packageVO.getHistorical() == 1){
		tags.add("ě­ěŹëŹ¸í");
	}
	if(packageVO.getScenery() == 1){
		tags.add("ěě°");
	}
	if(packageVO.getShopping() == 1){
		tags.add("ěźí");
	}
	if(packageVO.getHealing() == 1){
		tags.add("í´ě");
	}
	
	
	%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$imgMain = $("#imgMain");
		$("#img1").mouseover(function(){
			$imgMain[0].src="<%=packageImg1 %>";
		});
		$("#img2").on('mouseover',function(){
			$imgMain[0].src="<%=packageImg2 %>";
		});
		$("#img3").on('mouseover',function(){
			$imgMain[0].src="<%=packageImg3 %>";
		});
		
	});

	function login(){
		alert("ëĄęˇ¸ě¸ í ě´ěŠ ę°ëĽ íŠëë¤.");
		location.href="login.jsp";
	}
	
	function go(){
		var $headCount = $("#headCount");
		if($headCount.val() == ""){
			$headCount.focus();
			alert("ě¸ěě ěë Ľí´ ěŁźě¸ě.");
			return;
		}else if(isNaN($headCount.val())){
			$headCount.focus();
			alert("ěŤěëĽź ěë Ľíě¸ě.");
			return;
		}
		
		var $rYear = $("#rYear");
		if($rYear.val() == ""){
			$rYear.focus();
			alert("ëëëĽź ěë Ľí´ ěŁźě¸ě.");
			return;
		}else if(isNaN($rYear.val())){
			$rYear.focus();
			alert("ěŤěëĽź ěë Ľíě¸ě.");
			return;
		}else if($rYear.val().length != 4){
			$rYear.focus();
			alert("4ěëŚŹ ëëëĽź ěë Ľíě¸ě.");
			return;
		}
		
		var $rMonth = $("#rMonth");
		if($rMonth.val() == ""){
			$rMonth.focus();
			alert("ěěëĽź ěë Ľí´ ěŁźě¸ě.");
			return;
		}else if(isNaN($rMonth.val())){
			$rMonth.focus();
			alert("ěŤěëĽź ěë Ľíě¸ě.");
			return;
		}else if($rMonth.val().length != 2){
			$rMonth.focus();
			alert("2ěëŚŹ ěěëĽź ěë Ľíě¸ě.");
			return;
		}
		
		var $rDay = $("#rDay");
		if($rDay.val() == ""){
			$rDay.focus();
			alert("ěźěëĽź ěë Ľí´ ěŁźě¸ě.");
			return;
		}else if(isNaN($rDay.val())){
			$rDay.focus();
			alert("ěŤěëĽź ěë Ľíě¸ě.");
			return;
		}else if($rDay.val().length != 2){
			$rDay.focus();
			alert("2ěëŚŹ ěźěëĽź ěë Ľíě¸ě.");
			return;
		}
		$("#f").submit();
	}
</script>
</head>
<body>

	<%@ include file = "header.jsp" %>
	<div id="content">
		<div id="top">
			<div id="top-bg">
				<img class = "blur" alt="ëí ě´ëŻ¸ě§" src="<%=packageImg1%>"
				 style = "margin-top:-200px" />
			
			</div>
			<div class="container">
				<div id = "nav">
					<img src="<%=countryImg %>" alt="ęľ­ę¸°"/>
					<p class = "nation" >
						<span><%=countryName %></span>
					</p>
				</div>
				<h2 class = "title" ><%=packageTitle %></h2>
				<div class = "scorebox">
					<p>íě </p>
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
		
		String shortDesc = packageVO.getShortDesc();
		String descript = packageVO.getDescript();
		
		int delay = packageVO.getDelay();
		int price = packageVO.getPrice();
		
		
		
		// ěë Ľ
		int headCount = 0; 
		int rYear = 0;
		int rMonth = 0;
		int rDay = 0;
		
		int packagenum = 0;
		int citynum = 0;
		%>
		
		<div id = "maincontent">
			<div class = "container clear">
				<form action="reservation.jsp" id="f">
				<div id="right">
					<table>
						<tr>
							<th colspan="6">ě¸ě</th>
						</tr>
						<tr>
							<td colspan="3"><input type="text" name="headCount" id="headCount" size=2/></td>
							<td colspan="3">ëŞ</td>
						</tr>
						<tr>
							<th colspan="6">íŹě´ íŹë§ěź</th>
						</tr>
						<tr>
							<td><input type="text" name="rYear" id="rYear" size=4/></td>
							<td>ë</td>
							<td><input type="text" name="rMonth" id="rMonth" size=2/></td>
							<td>ě</td>
							<td><input type="text" name="rDay" id="rDay" size=2/>
								<input type="hidden" name="pno" value="<%=packageNum %>" />
							</td>
							<td>ěź</td>
						</tr>
						<tr>
							<td colspan="6">ëšěź/íëŁ¨ ě  ěě˝ě ëśę°ëĽ íŠëë¤.
								
							</td>
						</tr>
						<tr>
							<%
								String checkLogin = loginOk ? "'go();'" : "'login();'";
							%>
							<td colspan="6"><input type="button" value="ěě˝ íę¸°" onclick=<%=checkLogin %> /></td>
						</tr>
					</table>
				</div>
				</form>
				
				<div id = "detail">
					<table id = "imgT">
						<tr>
							<td rowspan = "4"><img src="<%=packageMainImg %>" alt="imgMain" id="imgMain"/></td>
						</tr>
						<tr>
							<td><img src="<%=packageImg1 %>" id="img1" /></td>
						</tr>
						<tr>
							<td><img src="<%=packageImg2 %>" id="img2" /></td>
						</tr>
						<tr>
							<td><img src="<%=packageImg3 %>" id="img3" /></td>
						</tr>
					</table>
				
					<div  id="contents">	
						<h1><%=shortDesc %></h1>
						<p><%=descript %></p><br/>
						
						<table>
							<tr>
								<td>ěě ěę°</td>
								<td><%=delay %></td>
							</tr>
							<tr>
								<td>ěę¸</td>
								<td><%=price %></td>
							</tr>
						</table>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>