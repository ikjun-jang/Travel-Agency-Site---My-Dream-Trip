<%@page import="vo.PackageVO"%>
<%@page import="vo.AdminPackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CityVO"%>
<%@page import="dao.CityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>My real Trip</title>
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
	#main-img{
		width : 100%;
		height : 410px;
		min-height : 427px;
		text-align : center;
		overflow : hidden;
		z-index: 10;
	}
	#main-img .container{
		position: absolute;
		top: 0;
		left: 50%;
		margin: 0 0 0 -490px;
		padding-top: 95px;
		text-align: center;
		z-index: 20;
	}
	#back-img{
		margin: 0 auto;
		min-width: 1200px;
		text-align: center;
	}
	
	#title{
		left : 20px;
		color: white;
		font-style: oblique;
	}
	#sub-title{
	
		color: white;
		font-style: oblique;
	}
	#main-img legend{
		color : white;
	}
	#main-img .container #search {
		padding: 15px 0 0 15px;
		margin: 0 auto;
		width: 610px;
		height: 63px;
		border-radius: 4px;
	}
	.main-city{
		height : 190px;
		text-align: center;
		overflow : hidden;
		z-index : 9;
	}
	
	.main-tour{
		overflow : hidden;
	}
	
	.main-city .city-list{
		width:1010px;
	}
	
	.main-city .city-list a{
		display:block;
		float:left;
		margin-right:24px;
		width:76px;
	}
	.main-city .city-list .city{
		display:block;
		margin-bottom:10px;
	}
	.main-city .city-list span{
		display:block;
		font-weight:700;
		font-size:14px;
		color:#333;
	}
	.main-city .city-list a:hover span{
		color:#2980b9;
	}
	
	
	#search{  
		size : 150px;
	}
	
	.main-tour{
		background:#ebeff1;
		overflow:hidden;
		/* position: absolute;
		top:670px;
		width:100%;
		height: 800px; */
	}
	
	.main-tour .title{
		
		height: 45px;
		font-weight: 700;
		font-size: 20px;
		color: #000;
  
		/* height:45px;
		font-weight:700;
		font-size:20px;
		color:#000;
		position: absolute;
		left:300px; */
	
	}
	.main-tour .title span{
		margin-left:10px;
		font-size:14px;
		color:#63625c;
	}

	.main-tour .title span.ico
	{

		margin:0 3px 0 0;
		width:100px;
		height:22px;
		line-height:22px;
		vertical-align:middle;
		text-align:center;
		font-weight:700;
		font-size:10px;
		color:#fff;
		background:#00b4ff;
		*display:inline;
		zoom:1;
		letter-spacing:0;

	}
	.main-tour .title a.outlink{
		color:#666;
		font-size:12px;

	}
	
	.main-tour .container{
		padding:0px 0 70px 0;
	}
	
	.main-tour .tour-list{
		margin-bottom: 40px;
  		width: 1010px;
	}
	
	.tour-list li{
		position: relative;
		float: left;
		margin-right: 25px;
		width: 280px;
		height: 444px;
		background: #fff;
	}
	
	ul{
		display: block;
		list-style-type: disc;
		-webkit-margin-before: 1em;
		-webkit-margin-after: 1em;
		-webkit-margin-start: 0px;
		-webkit-margin-end: 0px;
		-webkit-padding-start: 40px;
	}
	.shadow-border {
		box-shadow: 0 0 4px 0 rgba(0,0,0,0.2);
	}
	
	.clear:before, .clear:after {
		content: " ";
		display: table;
	}
	
	.clear:after {
		clear: both;
	}
	
	.tour-list .img{
		display: block;
	}
	
	.image-wrapper {
		display: block;
		position: relative;
		overflow: hidden;
		z-index: 10;
	}
	
	.main-tour .tour-list .image-wrapper {
		width: 280px;
		height: 233px;
	}
	
	.tour-list .img img {
		position: relative;
		display: block;
	}
	
	.tour-information {
		padding: 13px 15px;
		height: 99px;
	}
	
	.main-tour .tour-list .tour-information{
		border-bottom: 1px solid #edf1f2;
	}
	
	.tour-information .link span {
		display: block;
		line-height: 23px;
		font-weight: 700;
		color: #010101;
	}
	
	.tour-information .price {
		line-height: 20px;
		font-weight: 700;
		color: #e67e22;
	}
	
	.tour-information .price span {
		margin-left: 2px;
		font-size: 12px;
		font-weight: 400;
 		color: #999;
	}
	

</style>
<script>
function goEvent() {
	location.href = "eventOk.jsp";
}
</script>
</head>
<body>

	<%@ include file = "header.jsp" %>
	
	<%
		if(id!=null){
			if(id.equals("admin")){
				response.sendRedirect("adminMain.jsp");
			}
		}
		CityDAO cityDAO = new CityDAO();
		ArrayList<CityVO> cityList = cityDAO.selectAll();
	
	%>
	<div id = "content">
		<div id = "main-img">
			<div id ="backimg">
				<img src = "../images/mainimg.jpg" height = 400px; width = 100%;>
			</div>
			<div class = "container">
				
				<h1 id ="title" >당신을 위해 준비된 870가지의 진짜 여행</h1>
				<p id ="sub-title" >여행지를 가장 잘 아는 현지인 가이드와 함께, 마이드림티립</p>
			   
			    <div id="search">
			    	<form action = "search.jsp">
				        <fieldset>
				          <legend>도시 검색</legend>
				          <input type="text" title="떠나고 싶은 나라나 도시가 있으세요?" name="keyword" placeholder="떠나고 싶은 나라나 도시가 있으세요?" class="input-search">
				          <input type="submit" title="출발!" value="출발!">
				        </fieldset>
			        </form>
			    </div>
		    </div>
	    </div>
    
	<div class="main-city">
   	 	<div class="container">
    	 	 <div class="city-list"> 
   	 	 <%
   	 	 	int count = 0;
    	 	for(CityVO x : cityList){
    	 		if(++count > 11) break;
    	 		else if(x.getCityNum() == 3) continue;
    	 %>
    	 		<a href="city.jsp?cityNo=<%=x.getCityNum()%>">
    	 			<img src="<%=x.getImg() %>" alt="도시" class="city"/>
    	 			<span><%=x.getCityName() %></span>
    	 		</a>
    	 <%	
    	 	}
   	 	 %> 
         	 
	     </div>
       </div>
    </div>
    
    
    
	<div class="main-tour">
    	<div class="container">
	  		<h4 class="title">새로 준비된 여행
        		<span>
          			<span class="ico">REVIEW EVENT</span>가 달려있는 여행에 주목해 주세요! 특별한 혜택이 기다리고 있습니다.&nbsp;&nbsp;<a href="" class="outlink" target="_blank">자세히 알아보기&nbsp;&nbsp;></a>
        		</span>
      		</h4>
      
			<ul class="tour-list clear">
<%
	PackageDAO pDAO = new PackageDAO();
	ArrayList<AdminPackageVO> apList = new ArrayList<AdminPackageVO>();
	int end = pDAO.getTotalCount();
	int start = end-1;
	apList = pDAO.selectAll(start, end);
	PackageVO pVO = new PackageVO();
	pVO = pDAO.selectOne(31);
%>
 	  			<li class = "shadow-border">
 	  			
	 	  			<div class="imgsize">
			  
						<a class = "img">
							<span class="image-wrapper"><img src="../images/london_walk1.jpg" width="300px" onclick="goEvent();"></span>
						</a>
		 	  
					</div>
					
					<div class="tour-information">
				  	  	<a class="link"> <!-- 각 이미지에 맞는 여행 패키지 이동 -->
				      		<span><%=pVO.getTitle() %></span> 
				   	  	</a>
				   	  	<p class="price">
						1인 기준 할인가격 <%=pVO.getPrice() %>원 <br/><br/>
				   	  	
						</p>   
					</div>
				</li> 	  			
<%

	for(AdminPackageVO vo : apList){
%>
 	  			<li class = "shadow-border">
 	  			
	 	  			<div class="imgsize">
			  
						<a href="package.jsp?pno=<%=vo.getPackageNum()%>" class = "img">
							<span class="image-wrapper"><img src="<%=vo.getImg1() %>" width="300px"></span>
						</a>
		 	  
					</div>
					
					<div class="tour-information"> 
				  	  	<a href="package.jsp?pno=<%=vo.getPackageNum()%>" class="link"> <!-- 각 이미지에 맞는 여행 패키지 이동 -->
				      		<span><%=vo.getTitle() %></span> 
				   	  	</a>
				   	  	<p class="price">
						1인 기준 <%=vo.getPrice() %>원 <br/><br/>
				   	  	
						</p>   
					</div>
				</li>
<%
	}
%>
 		 	</ul>
		</div>
	</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>