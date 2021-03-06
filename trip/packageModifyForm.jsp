<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
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
	String packageNum = request.getParameter("packageNo");
	CountryDAO coDAO = new CountryDAO();
	CityDAO ciDAO = new CityDAO();
	ArrayList<CountryVO> coList = new ArrayList<CountryVO>();
	ArrayList<CityVO> ciList = new ArrayList<CityVO>();
	PackageDAO pDAO = new PackageDAO();
	PackageVO pVO = pDAO.selectOne(Integer.parseInt(packageNum));
	int cityNo = pVO.getCityNum();
	CityVO ciVO = ciDAO.selectOne(cityNo);
	int countryNo = ciVO.getCountryNo();
	coList = coDAO.selectAll();
	ciList = ciDAO.selectAll(countryNo);
%>
<script type="text/javascript">
	$(document).ready(function(){
		var titleCheck = false;
		var shortDescCheck = false;
		var delayCheck = false;
		var priceCheck = false;
		var descriptCheck = false;
		var scheduleCheck = false;
		var cityno = <%=cityNo%>;
		
		$("#img1change").on('click',function(){
			$("#img1").val();
			$("#img1").attr("type", "file");
			$("#img1change").hide();
			$("#oldimg1").hide();
			
		});
		$("#img2change").on('click',function(){
			$("#img2").val();
			$("#img2").attr("type", "file");
			$("#img2change").hide();
			$("#oldimg2").hide();
		});
		$("#img3change").on('click',function(){
			$("#img3").val();
			$("#img3").attr("type", "file");
			$("#img3change").hide();
			$("#oldimg3").hide();
		});
		
		$("#back").on('click',function(){
			location.href="adminMain.jsp?type=3";
		});
		$("#title").on('keyup', function(){
			if($("#title").val().length>30){
				titleCheck=false;
				$("#titlespan").show();			
				$("#titlespan").html("?????? ????????? ?????????????????????.("+$("#title").val().length+"/30)");				
			}else if($("#title").val().length==0){
				titleCheck=false;
				$("#titlespan").show();			
				$("#titlespan").html("????????? ???????????????");			
			}else{
				titleCheck=true;
				$("#titlespan").hide();			
			};
		});
		
		$("#shortdesc").on('keyup', function(){			
			if($("#shortdesc").val().length>200){
				shortDescCheck=false;
				$("#shortdescspan").show();			
				$("#shortdescspan").html("?????? ????????? ?????????????????????.("+$("#shortdesc").val().length+"/200)");				
			}else if($("#shortdesc").val().length==0){
				shortDescCheck=false;
				$("#shortdescspan").show();			
				$("#shortdescspan").html("??????????????? ???????????????");			
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
				$("#delayspan").html("?????? ?????? ?????????. ("+$("#delay").val()+"/99999)");				
			}else if($("#delay").val().length==0){
				delayCheck=false;
				$("#delayspan").show();			
				$("#delayspan").html("??????????????? ???????????????");			
			}else{
				try {
					var b = $("#delay").val();
					var a = parseInt(b) || error;
					if (a == 0) {
						delayCheck=false;
						$("#delayspan").show();			
						$("#delayspan").html("??????????????? 0??? ??? ??? ????????????.");			
					}else if(isNaN(a)){
						delayCheck=false;
						$("#delayspan").html("????????? ???????????????");			
						$("#delayspan").show();								
					}else{
						delayCheck=true;
						$("#delayspan").hide();			
					}
				} catch (e) {
					$("#delayspan").show();			
					$("#delayspan").html("????????? ???????????????");			
				}
			};
		});
		
		$("#price").on('keyup', function(){		
			console.log()
			if($("#price").val().length>10){
				priceCheck=false;
				$("#pricespan").show();			
				$("#pricespan").html("?????? ?????? ?????????. ("+$("#price").val()+"/9999999999)");				
			}else if($("#price").val().length==0){
				priceCheck=false;
				$("#pricespan").show();			
				$("#pricespan").html("????????? ???????????????");			
			}else{
				try {
					var b = $("#price").val();
					var a = parseInt(b) || error;
					if (a == 0) {
						priceCheck=false;
						$("#pricespan").show();			
						$("#pricespan").html("????????? 0??? ??? ??? ????????????.");			
					}else if(isNaN(a)){
						priceCheck=false;
						$("#pricespan").html("????????? ???????????????");			
						$("#pricespan").show();								
					}else{
						priceCheck=true;
						$("#pricespan").hide();			
					}
				} catch (e) {
					$("#pricespan").show();			
					$("#pricespan").html("????????? ???????????????");			
				}
			};
		});

		$("#descript").on('keyup', function(){			
			if($("#descript").val().length>2000){
				descriptCheck=false;
				$("#descriptspan").show();			
				$("#descriptspan").html("?????? ????????? ?????????????????????.("+$("#descript").val().length+"/2000)");				
			}else if($("#descript").val().length==0){
				descriptCheck=false;
				$("#descriptspan").show();			
				$("#descriptspan").html("??????????????? ???????????????");			
			}else{
				descriptCheck=true;
				$("#descriptspan").hide();			
			};
		});

		$("#schedule").on('keyup', function(){			
			if($("#schedule").val().length>2000){
				scheduleCheck=false;
				$("#schedulespan").show();			
				$("#schedulespan").html("?????? ????????? ?????????????????????.("+$("#schedule").val().length+"/1000)");				
			}else if($("#schedule").val().length==0){
				scheduleCheck=false;
				$("#schedulespan").show();			
				$("#schedulespan").html("??????????????? ???????????????");			
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
				$("#cityspan").html("????????? ???????????????.");
				console.log("7");
				return;				
			}
			console.log($("#img1").val());
			if($("#img1").val()==""){
				$("#img1").focus();
				$("#imgspan").html("????????? ????????? ?????? ???????????????.");
				return;				
			}
			if($("#img2").val()==""){
				$("#img2").focus();
				$("#imgspan").html("????????? ????????? ?????? ???????????????.");
				return;				
			}
			if($("#img3").val()==""){
				$("#img3").focus();
				$("#imgspan").html("????????? ????????? ?????? ???????????????.");
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
	<form action="packageModifyOk.jsp" enctype="multipart/form-data" method="post">
		<div id="upperdesc">
			<table>
				<tr>
					<th></th>
					<td>
						<select name="countryNo" id="countryNo">
							<option value="">????????? ???????????????</option>
							<%
								for (CountryVO vo : coList) {
							%>
							<option value="<%=vo.getCountryNo()%>"
								<%int a = vo.getCountryNo();
									if (countryNo==a) {%>
							selected="selected" <%}%>><%=vo.getName()%></option>
							<%
								}
							%>
						</select>      
						<select name="cityNo" id="cityNo">
							<option value="">????????? ???????????????</option>
							<%
								for (CityVO vo : ciList) {
							%>
							<option value="<%=vo.getCityNum()%>"
								<%int a = vo.getCityNum();
									if (cityNo==a) {%>
							selected="selected" <%}%>><%=vo.getCityName()%></option>

							<%
								}
							%>
						</select>
						<span id="cityspan"></span>
					</td>
				</tr>
				<tr>
					<th>??????</th>
					<td><input type="text" name="title" id="title" value="<%=pVO.getTitle()%>"/>   <span id="titlespan"></span></td>
				</tr>
				<tr>
					<th>?????? ??????</th>
					<td>
						<textarea rows="3" cols="80" name="shortdesc" id="shortdesc"><%=pVO.getShortDesc()%></textarea>   
						<span id="shortdescspan"></span>
					</td>
				</tr>
				<tr>
					<th>????????????</th>
					<td>
						<input type="text" name="delay" id="delay" value="<%=pVO.getDelay()%>"/>   
						<span id="delayspan"></span>
					</td>
				</tr>
				<tr>
					<th>1?????? ??????</th>
					<td>
						<input type="text" name="price" id="price" value="<%=pVO.getPrice()%>"/>   
						<span id="pricespan"></span>
					</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>
						<input type="checkbox" name="historical" id="historical" value="1"
						<%
						if(pVO.getHistorical()==1){
						%>
						checked="checked"
						<%
						}
						%>
						/>?????? 
						<input type="checkbox" name="scenery" id="scenery" value="1" 
						<%
						if(pVO.getScenery()==1){
						%>
						checked="checked"
						<%
						}
						%>
						/>?????? 
						<input type="checkbox" name="shopping" id="shopping" value="1" 
						<%
						if(pVO.getShopping()==1){
						%>
						checked="checked"
						<%
						}
						%>
						/>?????? 
						<input type="checkbox" name="healing" id="healing" value="1" 
						<%
						if(pVO.getShopping()==1){
						%>
						checked="checked"
						<%
						}
						%>
						/>??????
					</td>
				</tr>
				<tr>
					<th>?????? ??????</th>
					<td>
						<textarea name="descript" id="descript" cols="80" rows="25"><%=pVO.getDescript()%></textarea>   
						<span id="descriptspan"></span>
					</td>
				</tr>
				<tr>
					<th>?????? ??????</th>
					<td>
						<textarea name="schedule" id="schedule" cols="80" rows="15"><%=pVO.getSchedule() %></textarea>   
						<span id="schedulespan"></span>
					</td>
				</tr>
				<tr>
					<th rowspan="3">????????????</th>
					<td>
					<%
					String image1 = pVO.getImg1();
					String image2 = pVO.getImg2();
					String image3 = pVO.getImg3();
					String[] img1 = image1.split("../images/package/");
					String[] img2 = image2.split("../images/package/");
					String[] img3 = image3.split("../images/package/");
					%>
						<span id="oldimg1"><%=img1[1]%></span>
						<input type="button" value="change" id="img1change"/>
						<input type="hidden" name="img1" id="img1" value="<%=img1[1]%>"/>
						<span id="img1span"></span>
					</td>
				</tr>
				<tr>
					<td>
						<span id="oldimg2"><%=img2[1]%></span>
						<input type="button" value="change" id="img2change"/>
						<input type="hidden" name="img2" id="img2" value="<%=img2[1]%>"/>
						<span id="img2span"></span>
					</td>
				</tr>
				<tr>
					<td>
						<span id="oldimg3"><%=img3[1]%></span>
						<input type="button" value="change" id="img3change"/>
						<input type="hidden" name="img3" id="img3" value="<%=img3[1]%>"/>   
						<span id="img2span"></span>
					
					</td>
				</tr>
				<tr>
					<td align="right">
					<input type="button" name="next" id="next" value="modify" />
					<input type="button" value="??????" id="back"/>
					<input type="hidden" name="packageNo" value="<%=packageNum%>"/>
					</td>
				</tr>
			</table>
		
		</div>
	</form>
	<form action="packageDeleteOk.jsp">
		<input type="submit" name="delete" id="delete" value="????????? ??????" />
					<input type="hidden" name="packageNo" value="<%=packageNum%>"/>
	</form>			
</body>
</html>