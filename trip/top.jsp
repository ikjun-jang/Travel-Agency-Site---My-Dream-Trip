<%@page import="vo.CityVO"%>
<%@page import="dao.CityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CountryVO"%>
<%@page import="vo.PackageVO"%>
<%@page import="dao.CountryDAO"%>
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
	
	%>

		<div id="top">
			<table>
				<tr>
					<td><img src="<%=countryImg %>" alt="국기"/></td>
					<td><%=countryName %></td>
				</tr>
				<tr>
					<td colspan="2"><%=packageTitle %></td>
				</tr>
				<tr>
					<td colspan="2"><%=voteGrade %></td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							for(String s : tags){
								out.println(s + " ");
							}
						%>
					</td>
				</tr>
			</table>
		</div>

</body>
</html>