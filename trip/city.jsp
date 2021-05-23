<%@page import="vo.CountryVO"%>
<%@page import="dao.CountryDAO"%>
<%@page import="dao.CityDAO"%>
<%@page import="vo.CityVO"%>
<%@page import="vo.PackageVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PackageDAO"%>
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

#content {
	
	position : relative;
	background: #ebeff1; 
	
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
	
#top {
	width: 100%;
	height:200px;
	position: relative; 
	/* font-size: 30px; 이미추가후 폰트사이즈 삭제 */
	overflow : hidden;
}

#left {
	width: 200px;
	height:130px;
	background-color: white;
	float: left;
	border : solid skyblue 2px;
	/* position: absolute;
	top:300px;
	left:300px; */
}
#right {
	width: 770px; 
	height:1800px;
	background-color: white;
	list-style: none;
	float: right;
	/* position: absolute;
	left:530px;
	top:300px; */
}
.img{
	width:200px;
	height: 150px;
}
#nation-bg{
	width:100%;
	height:200px;
}

#topContainer{
		position: absolute;
		top: 0;
		left: 50%;
		padding-top:60px;
}
span{
	font-size:20px;
}
p{
	color:black;
	font-size:35px;
	font-weight:700;
	margin-top:10px;
	 text-shadow: 2px 2px white;
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
	
	#vote{
		font-size: 2px;
	}
	
	#right .tour-list {
		margin: 0;
		width: auto;
	}
	
	.tour-list li {
 		float: left;
		padding: 20px;
		width: 695px;
		height: auto;
		border-bottom: 1px solid #ebeff1;
		overflow: hidden;
	}
	
	.tour-list .img {
		display : block;
		float: left;
		margin-right: 18px;
	}
	
	.tour-list .tour-information.left {
		float: left;
		padding: 8px 0 0 0;
		width: 280px;
		height: auto;
		border: 0;
	}
	
	#right span {
		display: block;
		line-height: 23px;
		font-weight: 700;
		color: #010101;
	}
	
	.tour-information .right {
		float: right;
		padding: 8px 0 0 0;
		height: auto;
		text-align: right;
		border: 0;
	}
	
	.title {
		margin-bottom: 8px;
	}
	
	.text {
		display: block;
		line-height: 22px;
		font-size: 12px;
		font-weight: 400;
		color: #6d6e76;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<%
		String cityn = request.getParameter("cityNo");
		String historica = request.getParameter("historical");
		String scener = request.getParameter("scenery");
		String shoppin = request.getParameter("shopping");
		String healin = request.getParameter("healing");
		int historical;
		int scenery;
		int shopping;
		int healing;
		ArrayList<PackageVO> pList = new ArrayList<PackageVO>();
		ArrayList<CityVO> cList = new ArrayList<CityVO>();
		CityDAO cDao = new CityDAO();
		
		CountryDAO countryDAO = new CountryDAO();
	
		cList = cDao.selectAll();
		CityVO cityVO = null;
		CountryVO countryVO = null;
		if (cityn != null) {
			int cityNo = Integer.parseInt(cityn);
			cityVO = cDao.selectOne(cityNo);
			PackageDAO pDao = new PackageDAO();
			countryVO = countryDAO.selectOne(cityVO.getCountryNo());
			if (historica == null && scener == null && shoppin == null
					&& healin == null) {
				pList = pDao.selectAll(cityNo);
			} else if (historica != null || scener != null
					|| shoppin != null || healin != null) {
				if (historica == null) {
					historical = 0;
				} else {
					historical = 1;
				}
				if (scener == null) {
					scenery = 0;
				} else {
					scenery = 1;
				}
				if (shoppin == null) {
					shopping = 0;
				} else {
					shopping = 1;
				}
				if (healin == null) {
					healing = 0;
				} else {
					healing = 1;
				}
				pList = pDao.selectAll(cityNo, historical, scenery,
						shopping, healing);
			}
		}
	%>
	
	<%@ include file = "header.jsp" %>
	<div id="top">
		<div id="nation-bg">
			<img src="<%=cityVO.getBigImg() %>" alt="도시 대표 이미지" />
		</div>
		<div id="topContainer">
				<img src="<%=countryVO.getImg() %>" alt="국기"/>
				<span><%=countryVO.getName() %></span>
				<p><%=cityVO.getCityName() %></p>
		</div>
		도시 이미지 추가
	</div>
	
	
	<div id="content">
		<div class = "container clear">
			<form action="">
				<div id="left">
					<select name="cityNo" id="cityselect">
						<%
							for (CityVO vo : cList) {
						%>
						<option value="<%=vo.getCityNum()%>"><%=vo.getCityName()%></option>
						<%
							}
						%>
					</select><br /> <input type="checkbox" name="historical" id="" value="1" />역사문화<br />
					<input type="checkbox" name="scenery" id="" value="1" />자연<br /> <input
						type="checkbox" name="shopping" id="" value="1" />쇼핑<br /> <input  
						type="checkbox" name="healing" id="" value="1" />휴식<br /> <input
						type="submit" value="검색" />
				</div>
			</form>
			<div id="right">
				<ul class = "tour-list clear">
					<%
						for(PackageVO vo : pList){
					%>	
						<li>
							<img src="<%=vo.getImg1() %>" class="img">
							<div class = "tour-information left">
								<a href="package.jsp?pno=<%=vo.getPackageNum()%>"><span class="title" style="font-size='20px'"><%=vo.getTitle() %></span></a>
								<span class="shortdesc"><%=vo.getShortDesc() %></span>
					<%
									if(vo.getHistorical()==1){
					%>
										<a href="city.jsp?cityNo=<%=vo.getCityNum() %>&historical=<%=vo.getHistorical() %>">역사문화</a>&nbsp;
					<% 					
									}
					%>
					<%
									if(vo.getScenery()==1){
					%>
										<a href="city.jsp?cityNo=<%=vo.getCityNum() %>&Scenery=<%=vo.getScenery() %>">자연경관</a>&nbsp;
					<% 					
									}
					%>
					<%
									if(vo.getShopping()==1){
					%>
										<a href="city.jsp?cityNo=<%=vo.getCityNum() %>&shopping=<%=vo.getShopping() %>">쇼핑</a>&nbsp;
					<% 					
									}
					%>
					<%
									if(vo.getHealing()==1){
					%>
										<a href="city.jsp?cityNo=<%=vo.getCityNum() %>&healing=<%=vo.getHealing() %>">휴식</a>&nbsp;
					<% 					
									}
					%>
								<div class="scorebox" >
								
									<p id="vote">평점</p>
									<%
										int voteGrade = vo.getVoteGrade();
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
						</div>
						<div class = "tour-information right">
							<p class="price"><span>1인 <%=vo.getPrice() %></span></p>
						</div>
					</li>
					
					<% 
						}
					%>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>