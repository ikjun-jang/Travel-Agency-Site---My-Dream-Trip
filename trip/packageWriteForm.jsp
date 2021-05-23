<%@page import="vo.CountryVO"%>
<%@page import="dao.CountryDAO"%>
<%@page import="vo.CityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<%
	String countryNo = request.getParameter("countryNo");
	String cityNo = request.getParameter("cityNo");
	CountryDAO coDAO = new CountryDAO();
	CityDAO ciDAO = new CityDAO();
	ArrayList<CountryVO> coList = new ArrayList<CountryVO>();
	ArrayList<CityVO> ciList = new ArrayList<CityVO>();

	if(countryNo==null){
		countryNo="";
	}else{
		int countryNum = Integer.parseInt(countryNo);
		ciList = ciDAO.selectAll(countryNum);
		if(cityNo==null){
	cityNo="";
		}
	}
	coList = coDAO.selectAll();
%>
<script type="text/javascript">
	$(document).ready(function(){
		var titleCheck = false;
		var shortDescCheck = false;
		var delayCheck = false;
		var priceCheck = false;
		var descriptCheck = false;
		var scheduleCheck = false;
		var cityno = <%=cityNo%>
		
		$("#back").on('click',function(){
			location.href="adminPackage.jsp";
		});
		
		$("#title").on('keyup', function(){
			if($("#title").val().length>30){
				titleCheck=false;
				$("#titlespan").show();			
				$("#titlespan").html("글자 한도를 초과하였습니다.("+$("#title").val().length+"/30)");				
			}else if($("#title").val().length==0){
				titleCheck=false;
				$("#titlespan").show();			
				$("#titlespan").html("제목을 입력하세요");			
			}else{
				titleCheck=true;
				$("#titlespan").hide();			
			};
		});
		
		$("#shortdesc").on('keyup', function(){			
			if($("#shortdesc").val().length>200){
				shortDescCheck=false;
				$("#shortdescspan").show();			
				$("#shortdescspan").html("글자 한도를 초과하였습니다.("+$("#shortdesc").val().length+"/200)");				
			}else if($("#shortdesc").val().length==0){
				shortDescCheck=false;
				$("#shortdescspan").show();			
				$("#shortdescspan").html("한줄소개를 입력하세요");			
			}else{
				shortDescCheck=true;
				$("#shortdescspan").hide();			
			};
		});

		$("#delay").on('keyup', function(){		
			console.log()
			if($("#delay").val().length>5){
				delayCheck=false;
				$("#delayspan").show();			
				$("#delayspan").html("값이 너무 큽니다. ("+$("#delay").val()+"/99999)");				
			}else if($("#delay").val().length==0){
				delayCheck=false;
				$("#delayspan").show();			
				$("#delayspan").html("여행기간을 입력하세요");			
			}else{
				try {
					var b = $("#delay").val();
					var a = parseInt(b) || error;
					if (a == 0) {
						delayCheck=false;
						$("#delayspan").show();			
						$("#delayspan").html("여행기간은 0이 될 수 없습니다.");			
					}else if(isNaN(a)){
						delayCheck=false;
						$("#delayspan").html("숫자만 입력하세요");			
						$("#delayspan").show();								
					}else{
						delayCheck=true;
						$("#delayspan").hide();			
					}
				} catch (e) {
					$("#delayspan").show();			
					$("#delayspan").html("숫자만 입력하세요");			
				}
			};
		});
		
		$("#price").on('keyup', function(){		
			console.log()
			if($("#price").val().length>10){
				priceCheck=false;
				$("#pricespan").show();			
				$("#pricespan").html("값이 너무 큽니다. ("+$("#price").val()+"/9999999999)");				
			}else if($("#price").val().length==0){
				priceCheck=false;
				$("#pricespan").show();			
				$("#pricespan").html("가격을 입력하세요");			
			}else{
				try {
					var b = $("#price").val();
					var a = parseInt(b) || error;
					if (a == 0) {
						priceCheck=false;
						$("#pricespan").show();			
						$("#pricespan").html("가격은 0이 될 수 없습니다.");			
					}else if(isNaN(a)){
						priceCheck=false;
						$("#pricespan").html("숫자만 입력하세요");			
						$("#pricespan").show();								
					}else{
						priceCheck=true;
						$("#pricespan").hide();			
					}
				} catch (e) {
					$("#pricespan").show();			
					$("#pricespan").html("숫자만 입력하세요");			
				}
			};
		});

		$("#descript").on('keyup', function(){			
			if($("#descript").val().length>2000){
				descriptCheck=false;
				$("#descriptspan").show();			
				$("#descriptspan").html("글자 한도를 초과하였습니다.("+$("#descript").val().length+"/2000)");				
			}else if($("#descript").val().length==0){
				descriptCheck=false;
				$("#descriptspan").show();			
				$("#descriptspan").html("한줄소개를 입력하세요");			
			}else{
				descriptCheck=true;
				$("#descriptspan").hide();			
			};
		});

		$("#schedule").on('keyup', function(){			
			if($("#schedule").val().length>2000){
				scheduleCheck=false;
				$("#schedulespan").show();			
				$("#schedulespan").html("글자 한도를 초과하였습니다.("+$("#schedule").val().length+"/1000)");				
			}else if($("#schedule").val().length==0){
				scheduleCheck=false;
				$("#schedulespan").show();			
				$("#schedulespan").html("한줄소개를 입력하세요");			
			}else{
				scheduleCheck=true;
				$("#schedulespan").hide();			
			};
		});
		
		$("#next").on('click',function(){			
			if(!titleCheck){
				$("#title").focus();
				console.log("1");
				return;
			}
			if(!shortDescCheck){
				$("#shortdesc").focus();
				console.log("2");
				return;
			}
			if(!delayCheck){
				$("#delay").focus();
				console.log("3");
				return;
			}
			if(!priceCheck){
				$("#price").focus();
				console.log("4");
				return;
			}
			if(!descriptCheck){
				$("#descript").focus();
				console.log("5");
				return;
			}
			if(!scheduleCheck){
				$("#schedule").focus();
				console.log("6");
				return;
			}
			if($("#cityNo").val()==""){
				$("#cityNo").focus();
				$("#cityspan").html("도시를 선택하세요.");
				console.log("7");
				return;				
			}
			console.log($("#img1").val());
			if($("#img1").val()==""){
				$("#img1").focus();
				$("#imgspan").html("이미지 세개를 모두 선택하세요.");
				console.log("8");
				return;				
			}
			console.log($("#img2").val());
			if($("#img2").val()==""){
				$("#img2").focus();
				$("#imgspan").html("이미지 세개를 모두 선택하세요.");
				console.log("8");
				return;				
			}

			console.log($("#img3").val());
			if($("#img3").val()==""){
				$("#img3").focus();
				$("#imgspan").html("이미지 세개를 모두 선택하세요.");
				console.log("8");
				return;				
			}

			$("form").submit();
		});
	});

</script>

</head>
<body>
	<%
			
	%>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#countryNo").on('change', function() {
				location.href = "packageWriteForm.jsp?countryNo=" + $("#countryNo").val();
			});
			$("#cityNo").on('change', function() {
				location.href = "packageWriteForm.jsp?countryNo=" + $("#countryNo").val() + "&cityNo=" + $("#cityNo").val();
			});
		});
	</script>
	<form action="packageWriteOk.jsp" enctype="multipart/form-data" method="post">
		<div id="upperdesc">
			<table>
				<tr>
					<th></th>
					<td>
						<select name="countryNo" id="countryNo">
							<option value="">국가를 선택하세요</option>
							<%
								for (CountryVO vo : coList) {
							%>
							<option value="<%=vo.getCountryNo()%>"
								<%String a = "" + vo.getCountryNo();
									if (countryNo.trim().equals(a.trim())) {%>
							selected="selected" <%}%>><%=vo.getName()%></option>
							<%
								}
							%>
						</select>      
						<select name="cityNo" id="cityNo">
							<option value="">도시를 선택하세요</option>
							<%
								for (CityVO vo : ciList) {
							%>
							<option value="<%=vo.getCityNum()%>"
								<%String a = "" + vo.getCityNum();
									if (cityNo.trim().equals(a.trim())) {%>
							selected="selected" <%}%>><%=vo.getCityName()%></option>

							<%
								}
							%>
						</select>
						<span id="cityspan"></span>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title" />   <span id="titlespan"></span></td>
				</tr>
				<tr>
					<th>한줄 소개</th>
					<td>
						<textarea rows="3" cols="80" name="shortdesc" id="shortdesc" draggable="false"></textarea>   
						<span id="shortdescspan"></span>
					</td>
				</tr>
				<tr>
					<th>소요기간</th>
					<td>
						<input type="text" name="delay" id="delay" />   
						<span id="delayspan"></span>
					</td>
				</tr>
				<tr>
					<th>1인당 가격</th>
					<td>
						<input type="text" name="price" id="price" />   
						<span id="pricespan"></span>
					</td>
				</tr>
				<tr>
					<th>특징</th>
					<td>
						<input type="checkbox" name="historical" id="historical" value="1" />역사 
						<input type="checkbox" name="scenery" id="scenery" value="1" />경치 
						<input type="checkbox" name="shopping" id="shopping" value="1" />쇼핑 
						<input type="checkbox" name="healing" id="healing" value="1" />휴식
					</td>
				</tr>
				<tr>
					<th>상세 설명</th>
					<td>
						<textarea name="descript" id="descript" cols="80" rows="25"></textarea>   
						<span id="descriptspan"></span>
					</td>
				</tr>
				<tr>
					<th>상세 일정</th>
					<td>
						<textarea name="schedule" id="schedule" cols="80" rows="15"></textarea>   
						<span id="schedulespan"></span>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="img1" id="img1" />
						<input type="file" name="img2" id="img2" />
						<input type="file" name="img3" id="img3" />   
						<span id="imgspan"></span>
					</td>
				</tr>
				<tr>
					<td align="right"><input type="button" name="next" id="next" value="확인" /><input type="button" value="목록" id="back"/>
					</td>
				</tr>
			</table>
		
		</div>
	</form>
</body>
</html>