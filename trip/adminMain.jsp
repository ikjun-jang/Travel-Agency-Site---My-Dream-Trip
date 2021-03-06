<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.AdminPackageVO"%>
<%@page import="vo.CityVO"%>
<%@page import="dao.CityDAO"%>
<%@page import="vo.PackageVO"%>
<%@page import="vo.ReservationVO"%>
<%@page import="dao.PackageDAO"%>
<%@page import="dao.ReservationDAO"%>
<%@page import="java.util.ArrayList"%>
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
		font-family: "Nanum Gothic","ëëęł ë";
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
		z-index: 10;
		background-color: white; 
	}
	
ul.tabs {
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
ul.tabs li {
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
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
    
}

.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 800px;
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
 #containers {
    width: 800px;
    margin: 0 auto;
}
#container{
	position: absolute;
	left:300px;
	top:100px;
}
.boardtable{
	width:780px;
	border: 1px solid skyblue;
}

img{
	margin : 0px;
	padding : 0px;
}
#searchImg{
	widht:20px;
	height:20px;
}

.rImg{
	width : 100px;
	height : 100px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".statusChange").on('change',function(){
			$("#status").submit();
		});
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
		console.log("ë˛íźëëŚź")
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
</script>
</head>

<body>
<%@ include file = "header.jsp" %>
<%
	BoardDAO boardDAO = new BoardDAO();
	String cpage = request.getParameter("currentPage");
	String keyword = request.getParameter("searchKeyword");
	String type_s = request.getParameter("type");
	if(type_s != null){
		int type = Integer.parseInt(type_s);
%>
	<script>
		$(document).ready(function(){
			$(function () {
				var type = <%=type%>;
				$(".tab_content").hide();
			    $(".tab_content:first").show();
				if($("#tab-"+type).className == "active"){
					
				}else{
					
					$("ul.tabs li").removeClass("active").css("color", "#333");
					//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			        $("#tab-"+type).addClass("active").css("color", "darkred");
			        $(".tab_content").hide()
			        var activeTab = "tab"+type;
			        $("#" + activeTab).fadeIn();
						   		
				}
			});
		});
	</script>
<%
	}
	
	if(keyword==null)keyword="";
	int totalRecordCount = boardDAO.getTotalCount(keyword);
	
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
	// ěě ë˛í¸ 
	int startNum = (currentPage-1)*recordPerPage + 1;
	// ëë˛í¸
	int endNum = currentPage*recordPerPage;
	
	
	//////////////////////////////////////////////////////////////////////////
	
	 
	ReservationDAO reservationDAO = new ReservationDAO();
	PackageDAO packageDAO = new PackageDAO();
	ArrayList<ReservationVO> resList = reservationDAO.selectAll();
		


%>

	<div id="container">
	    <ul class="tabs">
	        <li class="active" rel="tab1" id="tab-1">ę˛ěí</li>
	        <li rel="tab2" id="tab-2">ěě˝ę´ëŚŹ</li>
	        <li rel="tab3" id="tab-3">í¨í¤ě§ ę´ëŚŹ</li>
	    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <ul>
                <li>
                	<div id="containers">



	<form action="">
	<div>
	<table class="boardtable">
		<tr id = tabletr>
			<th id= "ck"><input type="checkbox" name=""/></th>		
			<th>ë˛í¸</th>
			<th>ě ëŞŠ</th>
			<th>ěěąě</th>
			<th>HITS</th>
			<th>ěěąěźě</th>
		</tr>
<%
	ArrayList<BoardVO> list = null;
 	list = boardDAO.selectAll(keyword, startNum, endNum);
	 	
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
				<img src="../images/reply.gif" alt="ëę¸" />
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
		// íěŹ íě´ě§ę° 5ëł´ë¤ ěęł  ,
		//íěŹ íě´ě§ę° ě´íě´ě§ëł´ë¤ ěěë 

			
		
		for(int i=currentPage-4;i<=currentPage+4;i++){
			if(i<=0){
				continue;
			}else if(i>totalPage){
				break;
			}else{
				out.println("<a href='adminMain.jsp?type=1&currentPage="+i
						+"&searchKeyword="+keyword+"'>"+"["+i+"]</a>");
			}
		}
		%>
		</td>
	</tr>
	
	</table>
	<div>
		<a href="questionboard/queswriteForm.jsp"><input type="button" value="ę¸ě°ę¸°" /></a>
		<input type ="button" value="ę¸ě­ě " id="deleteBtn"/>
		
		
		
		<!-- <input type="button" value="ęłľě§ěŹí­ ëąëĄ"/> --> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="searchKeyword" id="" />
		<input type="submit" value="ę˛ě" />
	</div>
	</div>
	</form>	
	</div>
                </li>

            </ul>
            
            
            
        </div><!--  ě˛Ťë˛ě§¸ í­ ě˘ëŁ -->
        <!-- #tab1 -->
        
        
        
        
        
        
        
        <div id="tab2" class="tab_content">
			<ul>
                <li>
                	<div id="containers">
	        <table class="boardtable">
				<tr>
					<td colspan="5">
						<input type="text" name="searchTxt" id="searchTxt" />
						<img alt="ę˛ě" src="../images/search.gif" id="searchImg"/>
					</td>
				</tr>
				<tr>
					<td>ěě˝ë˛í¸</td>
					<td>í¨í¤ě§ě ëł´</td>
					<td>ě ëŞŠ</td>
					<td>íěěě´ë</td>
					<td>ěě˝ěí</td>
				</tr>
			<%
				for(ReservationVO x : resList){
					PackageVO pvo = packageDAO.selectOne(x.getPackageNum());
			%>
				<tr>
					<td><%=x.getNo() %></td>
					<td><img src="<%=pvo.getImg1() %>" alt="í¨í¤ě§ě´ëŻ¸ě§" class="rImg"/></td>
					<td><%=pvo.getTitle() %></td>
					<td><%=x.getId() %></td>
					<td>
					<form action="reservationChangeOk.jsp" id="status">
						<input type="hidden" name="no" value="<%=x.getNo()%>"/>
					<select name="status" class="statusChange">
						<option value="0" 
					<%
						if(x.getStatus()==0){
					%>
						selected="selected"
					<% 
						}
					%>
						>ě˘ěíě¸ě¤</option>
						<option value="1" 
					<%
						if(x.getStatus()==1){
					%>
						selected="selected"
					<% 
						}
					%>
						>ěę¸ëę¸°ě¤</option>
						<option value="2" 
					<%
						if(x.getStatus()==2){
					%>
						selected="selected"
					<% 
						}
					%>
						>ěëŁ</option>
						<option value="3" 
					<%
						if(x.getStatus()==3){
					%>
						selected="selected"
					<% 
						}
					%>
						>ěˇ¨ě</option>
					</select>
					</form>
					</td>
				</tr>
			<%	
				}
			
			%>
	       
	        </table>
	        		</div>
	        	</li>
	        </ul>
         </div>
        <!-- #tab2 -->
       
		
		
        <div id="tab3" class="tab_content">
        	<ul>
                <li>
                	<div id="containers">
                		<%
							PackageDAO pDao = new PackageDAO();
							CityDAO cDao = new CityDAO();
							ArrayList<PackageVO> pList = new ArrayList<PackageVO>();
							ArrayList<CityVO> cList = new ArrayList<CityVO>();
							cpage = request.getParameter("currentPage");
							keyword = request.getParameter("searchKeyword");
							cList = cDao.selectAll();
							currentPage = 0;
							totalRecordCount = 0;
							
							if(keyword=="" || keyword == null){	
								totalRecordCount= pDao.getTotalCount();
							}else{
								totalRecordCount = pDao.getCount(keyword);
								if(totalRecordCount==0){
									totalRecordCount=10;
								}
							}
							
							recordPerPage = 10;
							totalPage = (totalRecordCount%recordPerPage==0)?
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
							// ěě ë˛í¸
							startNum = (currentPage-1)*recordPerPage+1;
							// ëë˛í¸
							endNum = currentPage*recordPerPage;
							
						%>
					<script type="text/javascript">
						$(document).ready(function(){
							$("#searchKeyword").on('change',function(){
								
								location.href="adminMain.jsp?type=3&searchKeyword=" + $("#searchKeyword").val();
							});
						});
					</script>
							<div>
								<form action="">
									<select name="searchKeyword" id="searchKeyword">
										<option value="">ě ě˛´ëł´ę¸°</option>
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
						<%-- 	ě ě˛´ ë°ě´í° ęą´ě : <%=totalRecordCount %><br/>
							í íě´ě§ëš ë ě˝ë ęą´ě : <%=recordPerPage %><br/>
							íěŹ íě´ě§ ë˛í¸: <%=currentPage %><br/>
							ěěë˛í¸: <%=startNum %><br/>
							ëë˛í¸: <%=endNum %><br/>
						 --%>	
								<table>
									<tr>
										<th>í¨í¤ě§ ë˛í¸</th>
										<th>ëěëŞ</th>
										<th>í¨í¤ě§ëŞ</th>
										<th>ěŹí ę¸°ę°</th>
										<th>ěěąěź</th>
										<th>ę°ę˛Š</th>
										<th>ěĄ°íě</th>
										<th>íě </th>
									</tr>
								<%
									ArrayList<AdminPackageVO> aList = null;
										aList = pDao.selectAll(keyword, startNum, endNum);				
										for(AdminPackageVO vo : aList){
								%>			
										<tr>
											<td><%=vo.getPackageNum() %></td>
											<td><%=vo.getCityname() %></td>
											<td><a href="packageModifyForm.jsp?packageNo=<%=vo.getPackageNum()%>&currentPage=1"><%=vo.getTitle() %></a></td>
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
										for(int i=currentPage-4;i<=currentPage+4;i++){
											if(i<=0){
												continue;
											}else if(i>totalPage){
												break;
											}else{
												out.println("<a href='adminMain.jsp?type=3&currentPage="+i
														+"&searchKeyword="+keyword+"'>"+"["+i+"]</a>");
											}
										}
											
										%>		
										</td> 
									 </tr>
								 
								</table>
								<div>
									<a href = "packageWriteForm.jsp">
										<input type="button" value="í¨í¤ě§ ëąëĄ" />
									</a>
								</div>
								</form>
                	</div>
                	
                </li>
            </ul>
        </div>
        <!-- #tab3 -->
    </div>
    <!-- .tab_container -->
</div>
	

</body>
</html>