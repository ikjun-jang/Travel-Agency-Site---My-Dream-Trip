<%@page import="vo.PackageVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="sendMail.SMTPAuthenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>

<%
	request.setCharacterEncoding("UTF-8");

	int headCount = 0;
	String headCount_s = request.getParameter("headCount");
	headCount = headCount_s != null ? Integer.parseInt(headCount_s) : 0;
	String startDate = request.getParameter("date");
	startDate = request.getParameter("date");
	String id = request.getParameter("id");
	String pno = request.getParameter("pno");
	int packageNum = 0;
	if(pno!=null){
		packageNum = Integer.parseInt(pno);
	}
	
	UserDAO userDAO = new UserDAO();
	PackageDAO packageDAO = new PackageDAO();
	UserVO userVO = userDAO.selectOne(id);
	PackageVO packageVO = packageDAO.selectOne(packageNum);
	
	String sender = "mydreamtriphbi.gmail.com";
	String receiver = userVO.getEmail();
	String subject = "마이 드림 트립 예약 확인 메일입니다.";
	String content = "안녕하세요<br/> 마이 드림 트립 관리자 입니다. 예약 확인 하세요 <br/>";
	content += "패키지 번호 : " + packageNum + "<br/>";
	content += packageVO.getTitle() + "<br/>";
	content += "출발 날자 : " + startDate + "<br/>";
	content += "인원 : " + headCount + "<br/>";
	content += "금액 : " + (headCount*packageVO.getPrice()) + "원 <br/>" ;
	content += "비행기 좌석이 확정되면 연락 드리겠습니다.";  
	
	// 정보를 담기 위한 객체
	Properties p = new Properties();

	// SMTP 서버의 계정 설정
	// Naver와 연결할 경우 네이버 아이디 지정
	// Google과 연결할 경우 본인의 Gmail 주소
	p.put("mail.smtp.user", "mydreamtriphbi");

	// SMTP 서버 정보 설정
	// 네이버일 경우 smtp.naver.com
	// Google일 경우 smtp.gmail.com
	p.put("mail.smtp.host", "smtp.gmail.com");
	    
	// 아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try {
	    Authenticator auth = new SMTPAuthenticator();
	    Session ses = Session.getInstance(p, auth);

	    // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
	    //ses.setDebug(true);
	        
	    // 메일의 내용을 담기 위한 객체
	    MimeMessage msg = new MimeMessage(ses);

	    // 제목 설정
	    msg.setSubject(subject);
	        
	    // 보내는 사람의 메일주소
	    Address fromAddr = new InternetAddress(sender);
	    msg.setFrom(fromAddr);
	        
	    // 받는 사람의 메일주소
	    Address toAddr = new InternetAddress(receiver);
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	        
	    // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
	    msg.setContent(content, "text/html;charset=UTF-8");
	        
	    // 발송하기
	    Transport.send(msg);
	    
	    response.sendRedirect("reservationOk.jsp?pno="+
	    	packageNum+"&headCount=" + headCount +"&date="+startDate+
	    	"&id=" + id); 
	      
		
	} catch (Exception mex) {
	    mex.printStackTrace();
	    String script = "<script type='text/javascript'>\n";
	    script += "alert('메일발송에 실패했습니다.');\n";
	    script += "history.back();\n";
	    script += "</script>";
	    out.print(script);
	    return;
	}
	    
	/* String script = "<script type='text/javascript'>\n";
	script += "alert('메일발송에 성공했습니다.');\n";
	script += "</script>";
	script += "<meta http-equiv='refresh' content='0; url=MailForm.html' />";
	out.print(script); */
%>
