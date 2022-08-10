<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNotice2DAO, com.mycgv2.vo.CgvNotice2VO" %>
<%
	String nid = request.getParameter("nid");
	CgvNotice2DAO dao = new CgvNotice2DAO();
	CgvNotice2VO vo = dao.select(nid);
	
	//쿠키 불러오기
	Cookie[] cookieList = request.getCookies();
	
	//쿠키를 담을 변수 생성
	String cookie_member = null;
	
	//쿠키 세션 입력
	if(session.getAttribute(nid + ":cookies") == null){
		//등록된 쿠키가 없으면 새로운 쿠키 생성
		session.setAttribute(nid + ":cookies", nid + ";" + cookie_member);
	}else{
		//등록된 쿠키가 있으면 비교할 쿠키 세션 생성
		session.setAttribute(nid + ":cookies ex", nid + ":" + cookie_member);
		
		//등록된 쿠키의 값과 현재의 쿠키 값이 일치하지 않으면 새롭게 생성
		if(!session.getAttribute(nid + ":cookies").equals(nid + ":" + cookie_member)){
			session.setAttribute(nid + ":cookies", nid + ":" + cookie_member);
		}
	}
	
	//조회수 카운트
	if(!session.getAttribute(nid + ":cookies").equals(session.getAttribute(nid + ":cookies ex"))){
		int result = dao.updateHits(nid);
		//정상적으로 조회수가 업데이트 되었으면 가시적으로 게시글의 조회수도 업데이트
		if(result == 1){
			vo.setNhits(vo.getNhits() + 1);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/mycgv2/css/mycgv.css">
<style>
	.background{
		position : fixed;
		top:0;
		left : 0;
		background-color : rgba(0, 0, 0, 0.3);
		width : 100%;
		height : 100vh;
		z-index : -1;
		display : hidden;
		opacity : 0;
	}
	.window {
		position : relative;
		width : 100%;
		height : 100%;
		z-index : -1;
	}
	.popup {
	    background-color: white;
	    width: 500px;
	    height: 500px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
		z-index : -1;
	    transform: translate(-50%, -30%);
	    border-radius: 15px;
	    box-shadow : 3px 10px 7px 2px rgba(0, 0, 0, 0.5);
	}
	.show {
		opacity : 1;
		z-index : 10;
		display : block;
	    transition: all 0.5s;
	}
	.show .popup{
		z-index : 10;
	    transform: translate(-50%, -50%);
	    transition: all 0.5s;
	}
</style>
<script src = "http://localhost:9000/mycgv2/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		//let height = $(document).outerHeight(true);
		//$(".background").css("height", height);
		//alert(height);
		$("#delete_Btn").click(function(){
			$(".background").addClass("show");
			$(".window").addClass("show");
		});
		$("#close_modal").click(function(){
			$(".background").removeClass("show");
			$(".window").removeClass("show");
		});
	});
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>공지사항-상세보기</h1>
		<table class="boardContent">	
			<tr>				
				<th>등록일자</th>
				<td><%= vo.getNdate() %></td>
				<th>조회수</th>
				<td><%= vo.getNhits() %></td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="3"><%= vo.getNtitle() %></td>
			</tr>
			<tr>				
				<th>내용</th>
				<td colspan="3"><%= vo.getNcontent() %><br><br><br><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="admin_notice_update.jsp?nid=<%= vo.getNid() %>"><button type="button" class="btn_style">수정하기</button></a>
					<%-- <a href="admin_notice_delete.jsp?nid=<%= vo.getNid() %>"> --%>
						<button type="button" class="btn_style" id = "delete_Btn" style = "cursor : pointer;">삭제하기</button>
					<!-- </a> -->
					<a href="admin_notice_list.jsp">
						<button type="button" class="btn_style">리스트</button></a>
					<a href="http://localhost:9000/mycgv2/admin/admin.jsp"><button type="button" class="btn_style">관리자홈</button></a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<div class = "background">
		<div class = "window">
			<div class = "popup">
				<form name="boardDeleteForm" action="adminDeleteNoticeController.jsp" method="post" style = "width : 100%; height : 100%;">
					<input type = "hidden" name = "nid" value = <%= nid %>>
					<ul style = "width : 100%; height : 100%; padding : 0; border : none;">
						<li>
							<img src="http://localhost:9000/mycgv2/images/delete.jpg" style = "width: 65%; margin-top: 50px;"> <!-- 휴지통 이미지 -->					
						</li>				
						<li>
							<div>정말로 삭제하시겠습니까?</div>
						</li>
						<li>
							<button type="submit" class="btn_style">삭제완료</button>					
							<%-- <a href="admin_notice_content.jsp?nid=<%= nid %>"> --%>
								<button type="button" class="btn_style" id = "close_modal">닫기</button>
							<!-- </a> -->
							<a href="admin_notice_list.jsp"><button type="button" class="btn_style">리스트</button></a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







