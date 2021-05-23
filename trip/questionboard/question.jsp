<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#boardtable ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 300px;
    font-family:"dotum";
    font-size:12px;
}
#boardtable ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
#boardtable ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
    
}

.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 700px;
    background: #FFFFFF;
    
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
    width: 800px;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
#boardtable #containers {
	width: 650px;
    margin: 0 auto;
}
#boardtable #container{
	/* position: absolute;
	left:300px;
	top:100px; */
}
#boardtable{
	width:650px;
	border: 1px solid skyblue;
}

#tableW{
	width : 570px;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
   			});
		});
		var ck = document.getElementById("ck");
		ck.onclick=toggleSelectAll;
		$("#deleteBtn").on('click',deleteAction);	
	});
	function deleteAction(){
		console.log("버튼눌림")
		var $v = $("form");
		$v[0].action="questionboard/quesdeleteOk.jsp";
		$v[0].method="get";
		$v[0].submit();
	}
	
	function toggleSelectAll(){
		var f = document.frm;
		for(var i=1; i<f.length; i++){
		if(!document.frm[i].checked){
			document.frm[i].checked = true;
		}else{
			document.frm[i].checked = false;
			}
		}
	};
	
	$(document).ready(function(){
		$("#searchBtn").on('click',function(){
			var str = "userMenu.jsp?type=2&searchKeyword="+$("#searchKeyword").val();
			location.href=str;
		});
	});
</script>
</head>

<body>

<%
	BoardDAO dao = new BoardDAO();
	String cpage = request.getParameter("currentPage");
	String keyword = request.getParameter("searchKeyword");
	if(keyword==null)keyword="";
	int totalRecordCount = dao.getTotalCount(keyword);
	
	int recordPerPage = 10;
	int totalPage = 
		(totalRecordCount%recordPerPage==0)?
			totalRecordCount/recordPerPage: 
			totalRecordCount/recordPerPage +1 ;
	int currentPage = 0  ;
	
	if(cpage != null){
		 currentPage = Integer.parseInt(cpage);
	}else {
		currentPage = 1;
	}
	// currentPage = 2 
	// 시작 번호 
	int startNum = (currentPage-1)*recordPerPage + 1;
	// 끝번호
	int endNum = currentPage*recordPerPage;

%>
	<div id="rightTop">
		<img src="../images/a.png" alt="로고" />
		<h1>게시판</h1>
	</div>


	<div id="bcontainer">
	    <ul class="tabs">
	        <li class="active" rel="tab1"></li>
	        <!-- <li rel="tab2">예약관리</li>
	        <li rel="tab3">공지사항</li> -->
	    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <ul>
                <li>
                	<div id="containers">



	
	<div id="tableW">
	<form>
	<table id="boardtable">
		<tr id = tabletr>
			<th id= "ck"><input type="checkbox" name=""/></th>		
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>HITS</th>
			<th>작성일시</th>
		</tr>
<%
	ArrayList<BoardVO> list = null;
 	list = dao.selectAll(keyword, startNum, endNum);
	 	
	for(BoardVO vo : list) {
		
%>
		<tr>
			<td><input type="checkbox" name="checkno" value=<%=vo.getBno() %> /></td>	
			<td><%=vo.getBno() %></td>
	<td>
	<%
		if(vo.getLevel() > 1){
			for(int i = 1; i < vo.getLevel(); i++){
	%>
				<img src="../images/reply.gif" alt="댓글" />
	<%
			}
		}
	%>
		<a href="questionboard/quesdetail.jsp?bno=<%=vo.getBno() %>" ><%=vo.getTitle() %></a>
	</td>
			<td><%=vo.getId() %></td>
			<td><%=vo.getHits() %></td>
			<td><%=vo.getWdate() %></td>
		</tr>
<%
	}
%>
	<tr>
		<td colspan="5">
		<%	
		int searchStart = 0 ;
		int searchEnd  = 0 ;
		// 현재 페이지가 5보다 작고 ,
		//현재 페이지가 총페이지보다 작을때 

			
		
		for(int i=currentPage-4;i<=currentPage+4;i++){
			if(i<=0){
				continue;
			}else if(i>totalPage){
				break;
			}else{
				out.println("<a href='userMenu.jsp?type=2&currentPage="+i
						+"&searchKeyword="+keyword+"'>"+"["+i+"]</a>");
			}
		}
		%>
		</td>
	</tr>
	
	</table>
	</form>
	<div>
		<a href="./questionboard/queswriteForm.jsp"><input type="button" value="글쓰기" /></a>
		<input type ="button" value="글삭제" id="deleteBtn"/>
		
		
		
		<!-- <input type="button" value="공지사항 등록"/> --> <!-- 관리자 전용 버튼 적용 해야함. -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="searchKeyword" id="searchKeyword" />
		<input type="button" value="검색" id="searchBtn"/>
	</div>
	</div>	
	</div>
                </li>

            </ul>
            
            
            
        </div><!--  첫번째 탭 종료 -->
        <!-- #tab1 -->
        
        
        
        
        
        
        
      <!--  <div id="tab2" class="tab_content"></div> -->
        <!-- #tab2 -->
       <!-- <div id="tab3" class="tab_content"></div> -->
        <!-- #tab3 -->
    </div>
    <!-- .tab_container -->
</div>

	

</body>
</html>