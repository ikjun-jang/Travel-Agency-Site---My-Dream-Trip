<%@page import="dao.PackageDAO"%>
<%@page import="vo.PackageVO"%>
<%@page import="dao.ReservationDAO"%>
<%@page import="vo.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#next").on('click',function(){
			var $a = $("input[name='score']");
			for(var i = 0; i<5; i++){
				if($a[i].checked){
					$("form").submit();
					return;
				}
			}
			alert("평점을 선택해주세요.");			
		});
	});

</script>
</head>
<body>
<% 
	String n = request.getParameter("no");
	ReservationVO rVO = new ReservationVO();
	ReservationDAO rDAO = new ReservationDAO();
	PackageVO pVO = new PackageVO();
	PackageDAO pDAO = new PackageDAO();
	if(n!=null){
		int no = Integer.parseInt(n);
		rVO = rDAO.selectOne(no);
		pVO = pDAO.selectOne(rVO.getPackageNum());
	}
%>
<form action="reservationPackageCheckCancelOk.jsp">
	<table>
		<tr>
			<th>예약번호</th>
			<td><%=rVO.getNo() %></td>
		</tr>
		<tr>
			<th>패키지명: </th>
			<td><%=pVO.getTitle() %></td>
		</tr>
		<tr>
			<th>예약 진행 상태</th>
			<td></td>
		</tr>
		<tr>
			<th>총 가격: </th>
			<td><%=rVO.getHeadCount()*pVO.getPrice() %></td>
		</tr>
		<tr>
			<th>여행 시작일: </th>
			<td><%=rVO.getStartDate() %></td>
		</tr>
		<tr>
			<th>신청 인원: </th>
			<td><%=rVO.getHeadCount() %></td>
		</tr>
<%
	if(rVO.getStatus()==0){
%>
		<tr>
			<th colspan="2">예약 진행 상태</th>
		</tr>
		<tr>
			<td colspan="2"><img src="../images/reservationstatus1.png" alt="좌석확인중" width="600px"/></td>
		</tr>
		<tr>
			<td colspan="2">현재 비행기표와 숙박시절 잔여 상태를 확인중입니다.
			</td>
		</tr>
		<tr>
			<td colspan="2">좌석이 확정되면 개별적으로 연락드리겠습니다.
			</td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="예약 취소하기" />
		<input type="hidden" name="no" value="<%=rVO.getNo()%>"/>
		</td>
		</tr>
<%
	}else if(rVO.getStatus()==1){		
%>
		<tr>
		<th colspan="2">예약 진행 상태</th>
		</tr>
		<tr>
			<td colspan="2"><img src="../images/reservationstatus2.png" alt="입금대기중" width="600px"/></td>
		</tr>
<%
		String[] airInfo = rVO.getAirInfo().split(",");
		String[] hotelInfo = rVO.getHotelInfo().split(",");
		%>
		<tr>
			<th colspan="2">교통편 안내</th>
		</tr>
		<tr>
			<th>출발: </th>
			<td><%=airInfo[0] %></td>
		</tr>
		<tr>
			<th>도착: </th>
			<td><%=airInfo[1] %></td>
		</tr>
		<tr>
			<th colspan="2">숙소 안내</th>
		</tr>
<%
		for(int i = 0; i<hotelInfo.length; i++){
%>
		<tr>
			<th><%=i%>일차: <%=hotelInfo[i] %></th>
<% 			
		}
%>
		<tr>
			<th>입금계좌: </th>
			<td>국민은행 : 182-123813-12391</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="예약 취소하기" />
			<input type="hidden" name="no" value="<%=rVO.getNo()%>"/>
		</td>
		</tr>
<%	
	}else if(rVO.getStatus()==2){
		%>
		<tr>
		<th colspan="2">예약 진행 상태</th>
		</tr>
		<tr>
			<td colspan="2"><img src="../images/reservationstatus3.png" alt="예약 완료" width="600px"/></td>
		</tr>
<%
		String[] airInfo = rVO.getAirInfo().split(",");
		String[] hotelInfo = rVO.getHotelInfo().split(",");
		%>
		<tr>
			<th colspan="2">교통편 안내</th>
		</tr>
		<tr>
			<th>출발: </th>
			<td><%=airInfo[0] %></td>
		</tr>
		<tr>
			<th>도착: </th>
			<td><%=airInfo[1] %></td>
		</tr>
		<tr>
			<th colspan="2">숙소 안내</th>
		</tr>
<%
		for(int i = 0; i<hotelInfo.length; i++){
%>
		<tr>
			<th><%=i+1%>일차: </th>
			<td><%=hotelInfo[i] %></td>
		</tr>
<% 			
		}
%>
		<tr>
			<th colspan="2">여행에 만족하셨나요? 만족도를 평가해주세요.</th>
		</tr>
<%
		if(rVO.getVoteCheck()==0){

%>
		<tr>
			<td>
			<input type="radio" name="score" id="" value="2"/>최악이에요
			<input type="radio" name="score" id="" value="4"/>그저 그래요
			<input type="radio" name="score" id="" value="6"/>평범해요
			<input type="radio" name="score" id="" value="8"/>괜찮았어요
			<input type="radio" name="score" id="" value="10"/>정말 좋아요</td>
			<td colspan="2"><input type="button" id="next" value="평가하기" />
			<input type="hidden" name="no" value="<%=rVO.getNo()%>"/>
			<input type="hidden" name="packageNo" value="<%=rVO.getPackageNum()%>"/>
		</td>
		</tr>
<%			
		}else{
%>
		<tr>
		<th>이미 평가하셨습니다.</th>
		</tr>
<%			
		}
	}else if(rVO.getStatus()==3){
		%>
		<tr>
		<th colspan="2">예약 진행 상태</th>
		</tr>
		<tr>
			<td colspan="2"><img src="../images/reservationstatus4.png" alt="취소" width="600px"/></td>
		</tr>
		<tr>
			<th colspan="2">예약이 취소되었습니다. </th>
		</tr>
<%			
	}
%>
	</table>	
	</form>
</body>
</html>