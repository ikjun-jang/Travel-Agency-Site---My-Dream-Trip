<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDir = request.getRealPath("/images/package");
	out.println(saveDir);
	int maxFileSize = 1024*1024*10; // 10mb
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());

	String cityN = mr.getParameter("cityNo");
	String packageN = mr.getParameter("packageNo");
	String title = mr.getParameter("title");
	String shortDesc = mr.getParameter("shortdesc");
	String dela = mr.getParameter("delay");
	String pric = mr.getParameter("price");
	String historica = mr.getParameter("historical");
	String scener = mr.getParameter("scenery");
	String shoppin = mr.getParameter("shopping");
	String healin = mr.getParameter("healing");
	String descript = mr.getParameter("descript");
	String schedule = mr.getParameter("schedule");
	String img1 = mr.getOriginalFileName("img1");
	String img2 = mr.getOriginalFileName("img2");
	String img3 = mr.getOriginalFileName("img3");
	if(img1 == null || img1==""){
		img1 = mr.getParameter("img1");
	}
	if(img2 == null || img2==""){
		img2 = mr.getParameter("img2");
	}
	if(img3 == null || img3==""){
		img3 = mr.getParameter("img3");
	}

	int cityNo = 0;
	int delay =0;
	int price = 0;
	int historical = 0;
	int scenery = 0;
	int shopping = 0;
	int healing = 0;
	int packageNo = 0;
	if(historica == null){
		historical = 0;
	}else{
		historical = Integer.parseInt(historica);
	}
	if(scener == null){
		scenery = 0;
	}else{
		scenery = Integer.parseInt(historica);
	}
	if(shoppin == null){
		shopping = 0;
	}else{
		shopping = Integer.parseInt(historica);
	}
	if(healin == null){
		healing = 0;
	}else{
		healing = Integer.parseInt(historica);
	}
	if(cityN != null){
		cityNo = Integer.parseInt(cityN);
	}
	if(dela != null){
		delay = Integer.parseInt(dela);
	}
	if(pric != null){
		price = Integer.parseInt(pric);
	}	
	if(packageN != null){
		packageNo = Integer.parseInt(packageN);
	}	

 	PackageDAO dao = new PackageDAO();
	PackageVO vo = new PackageVO(cityNo, "../images/package/"+img1, "../images/package/"+img2, "../images/package/"+img3, title, descript, schedule, delay, price, historical, scenery, shopping, healing, shortDesc, packageNo);
	dao.updateOne(vo);
	response.sendRedirect("adminMain.jsp?type=3");
%>