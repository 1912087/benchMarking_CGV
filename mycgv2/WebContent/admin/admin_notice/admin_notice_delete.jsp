<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nid = request.getParameter("nid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/mycgv2/css/mycgv.css">
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>공지사항-삭제하기</h1>
		<form name="boardDeleteForm" action="adminDeleteNoticeController.jsp" method="post">
			<input type = "hidden" name = "nid" value = <%= nid %>>
			<ul>
				<li>
					<img src="http://localhost:9000/mycgv2/images/delete.jpg"> <!-- 휴지통 이미지 -->					
				</li>				
				<li>
					<div>정말로 삭제하시겠습니까?</div>
				</li>
				<li>
					<button type="submit" class="btn_style">삭제완료</button>					
					<a href="admin_notice_content.jsp?nid=<%= nid %>"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="admin_notice_list.jsp"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







