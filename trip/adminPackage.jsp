<%@page import="vo.AdminPackageVO"%>
<%@page import="vo.PackageVO"%>
<%@page import="vo.CityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CityDAO"%>
<%@page import="dao.PackageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<%
	PackageDAO pDao = new PackageDAO();
	CityDAO cDao = new CityDAO();
	ArrayList<PackageVO> pList = new ArrayList<PackageVO>();
	ArrayList<CityVO> cList = new ArrayList<CityVO>();
	String cpage = request.getParameter("currentPage");
	String keyword = request.getParameter("searchKeyword");
	cList = cDao.selectAll();
	int currentPage = 0;
	int totalRecordCount = 0;
		if(keyword==null){	
			totalRecordCount= pDao.getTotalCount();
		}else{
			totalRecordCount = pDao.getCount(keyword);
			if(totalRecordCount==0){
				totalRecordCount=10;
			}
		}
	int recordPerPage = 10;
	int totalPage = (totalRecordCount%recordPerPage==0)?
			totalRecordCount/recordPerPage:
				totalRecordCount/recordPerPage+1;
	if(keyword==null){
		keyword="";
	}
	if(cpage!=null){
		currentPage = Integer.parseInt(cpage);
	}else{
		currentPage = 1;
	}
	// 시작 번호
	int startNum = (currentPage-1)*recordPerPage+1;
	// 끝번호
	int endNum = currentPage*recordPerPage;
	
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchKeyword").on('change',function(){
			
			location.href="adminPackage.jsp?searchKeyword=" + $("#searchKeyword").val();
		});
	});
</script>
	<div id="container">
	<div>
		<form action="">
			<select name="searchKeyword" id="searchKeyword">
				<option value="">전체보기</option>
	<%
			for(CityVO vo : cList){
	%>
				<option id="aaa" value="<%=vo.getCityName()%>" 
	<%
				if(keyword.equals(vo.getCityName())){
					%>
					selected="selected"
					<%
				}
					%>
				><%=vo.getCityName()%></option>
	<% 
			}
	%>
			</select>
		</form>
	</div>
	<form action="">
<%-- 	전체 데이터 건수 : <%=totalRecordCount %><br/>
	한 페이지당 레코드 건수 : <%=recordPerPage %><br/>
	현재 페이지 번호: <%=currentPage %><br/>
	시작번호: <%=startNum %><br/>
	끝번호: <%=endNum %><br/>
 --%>	
		<table>
			<tr>
				<th>패키지 번호</th>
				<th>도시명</th>
				<th>패키지명</th>
				<th>여행 기간</th>
				<th>작성일</th>
				<th>가격</th>
				<th>조회수</th>
				<th>평점</th>
			</tr>
		<%
			ArrayList<AdminPackageVO> list = null;
				list = pDao.selectAll(keyword, startNum, endNum);				
				for(AdminPackageVO vo : list){
		%>			
				<tr>
					<td><%=vo.getPackageNum() %></td>
					<td><%=vo.getCityname() %></td>
					<td><a href="packageModifyForm.jsp?packageNo=<%=vo.getPackageNum()%>"><%=vo.getTitle() %></a></td>
					<td><%=vo.getDelay() %></td>
					<td><%=vo.getWdate() %></td>
					<td><%=vo.getPrice() %></td>
					<td><%=vo.getHits() %></td>
					<td><%=vo.getVoteGrade() %></td>
				</tr>
		<% 		
				}	
		 %>
			 <tr>
				<td colspan="5">
				<%
				int searchStart = 0;
				int searchEnd = 0;
				if(currentPage-5<=0 && totalPage-currentPage<5){
					searchStart = 1;
					searchEnd = totalPage;
				}else if(currentPage-5<=0){					
					searchStart = 1;
					searchEnd = 10;
				}else if(totalPage-currentPage<5){
					searchStart = totalPage-9;
					searchEnd = totalPage;
				}else{
					searchStart = currentPage-4;
					searchEnd = currentPage+5;
				}
					for(int i = searchStart; i<=searchEnd; i++){
						out.println("<a href='adminPackage.jsp?currentPage=" + i + "&searchKeyword=" + keyword + "'>" +  "[" + i + "]</a>");
					}
					
				%>		
				</td> 
			 </tr>
		 
		</table>
		<div>
			<a href = "packageWriteForm.jsp">
				<input type="button" value="패키지 등록" />
			</a>
		</div>
		</form>
		
		</div>		
</body>
</html>