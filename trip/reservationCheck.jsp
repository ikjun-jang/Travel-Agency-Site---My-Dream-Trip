<%@page import="vo.UserReservationVO"%>
<%@page import="vo.ReservationVO"%>
<%@page import="dao.ReservationDAO"%>
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
</head>
<body>
	<%
		Object ido = session.getAttribute("theID");
		String theID = ido.toString();
		ReservationDAO rDAO = new ReservationDAO();
		ArrayList<UserReservationVO> pList = new ArrayList<UserReservationVO>();
		pList = rDAO.selectAll(theID);
	%>
	<div id="rightTop">
		<img src="../images/a.png" alt="로고" />
		<h1>여행자 메뉴</h1>
	</div>
	<div id="rightBottom">
		<div class="right">
			<table id="imgul">
				<%
					for (UserReservationVO vo : pList) {
				%>

				<tr class="tour-information">


					<td rowspan="4"><img src="<%=vo.getImg1()%>" width="100px" class="img"></td>
					<td><a href="userMenu.jsp?no=<%=vo.getNo()%>"><span
							class="title"><%=vo.getTitle()%></span></a></td>
					<td class="price">총 가격: <span><%=vo.getPrice()*vo.getHeadCount()%></span></td>
				</tr>
				<tr>	
					<td><span class="shortdesc"><%=vo.getShortDesc()%></span></td>
					<td>시작일: <%=vo.getStartDate() %></td>
				</tr>
				<tr>
					<td>특징: 
					<%
						if (vo.getHistorical() == 1) {
					%>
					역사문화
					<%
						}
					%>
					<%
						if (vo.getScenery() == 1) {
					%>
					  자연경관
					<%
						}
					%>
					<%
						if (vo.getShopping() == 1) {
					%>
					  쇼핑
					<%
						}
					%>
					<%
						if (vo.getHealing() == 1) {
					%>
					  휴식
					<%
						}
					%>
					</td>
					<td>신청인원: <%=vo.getHeadCount() %>명</td>
				</tr>
				<tr>
					<td class="scorebox">평점: <span class=score-total><%=vo.getVoteGrade()%></span></td>
					<td>예약상태: 
					<%
					int status = vo.getStatus();
					String a = "";
					if(status == 0)a="좌석확인중";
					if(status == 1)a="입금대기중";
					if(status == 2)a="완료";
					if(status == 3)a="취소";
					%>
					<%=a %></td>
				</tr>
					
				<%
					}
				%>
			</table>
		</div>


	</div>
</body>
</html>