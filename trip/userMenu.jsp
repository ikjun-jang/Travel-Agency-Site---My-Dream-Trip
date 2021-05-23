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
		height : 1000px;
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
		background-color: white; 
	} 

#wrap{
	width:1000px;
	margin:0 auto;
	position:relative;
}

#container{
	margin-top:10px;
	width:1000px;
	height : 1000px;
	/* position:relative; */
	background-color:#EBEFF1;
}
#left{
	width:250px;
	height:800px;
	margin-left:10px;
	float:left;
}
#leftTop{
	width:250px;
	height:200px;
	margin-top:30px;
} 
#leftBottom{
	width:250px;
	height:500px;
	float:left;
	margin-top:30px;
}
#leftTop{
	margin-left:30px;
}
/* ul{
	float:left;
} */
#right{
	width:650px;
	height:800px;
	margin-left:20px;
	margin-top:30px;
	float:left;
}
#rightTop{
	width:700px;
	height:200px;
	background-color:white;
}
#rightBottom{
	width:700px;
	height:500px;
	margin-top:10px;
	background-color:white;
}
/* img{
	margin-top:30px;
	float:left;
} */
h1{
	margin-top:35px;
	margin-left:10px;
	float:left;
}
.btn{
	width:200px;
	height:50px;
	background-color:white;
	margin:0 30px;
	border:  1px solid black;	
}
.btn:hover{
		background-color: #B2EBF4;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		$("#reservationbtn").on('click', function(){
			location.href = "userMenu.jsp?type=1";
		});
		$("#boardbtn").on('click', function(){
			location.href = "userMenu.jsp?type=2";
		});
		$("#idchangebtn").on('click', function(){
			location.href = "userMenu.jsp?type=3";
		});
	});
	
</script>



</head>
<body>

<%@ include file = "header.jsp" %>

	<div id="wrap">
		<div id="container">
			<div id="left">
				<div id="leftTop" >
				<img src="../images/dream.jpg" alt="My Dream Trip">
				</div>
				<div id="leftBottom">
					<!-- <ul>
						<li>여행자 메뉴</li>
						<li>문의 게시판</li>
						<li>계정 설정</li>
					</ul> -->
					<input type="button" value="예약메뉴" class="btn" value="1" id="reservationbtn"/><br />
					<input type="button" value="문의 게시판" class="btn" value="2" id="boardbtn"/><br />
					<input type="button" value="계정 설정" class="btn" value="3" id="idchangebtn"/> 
				</div>
			</div><!-- left end -->
			<div id="right">
			<%
			String typ = request.getParameter("type");
			String no = request.getParameter("no");
			if(typ!=null){
				int type = Integer.parseInt(typ);
				if(type==1){
			%>
				<jsp:include page="reservationCheck.jsp" flush="true"/>
			<%
				}else if(type==2){
			%>
				<jsp:include page="questionboard/question.jsp" flush="true"/>	
			<% 
				}else if(type==3){
			%>
				<jsp:include page="joinModify.jsp" flush="true"/>
			<%		
				}
			}else if(no!=null){
				String a = "reservationPackageCheck.jsp?no="+no;
				
			%>			
				<jsp:include page="<%=a %>" flush="true"/>
			<%	
			}
			%>
 							 
			</div><!-- right end -->
						
		</div><!-- container end -->
	</div> <!-- wrap end -->
</body>
</html>