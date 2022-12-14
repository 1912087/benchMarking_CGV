<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.vo.CgvNotice2VO, com.mycgv2.dao.CgvNotice2DAO" %>
<%
	String nid = request.getParameter("nid");
	CgvNotice2DAO dao = new CgvNotice2DAO();
	CgvNotice2VO vo = dao.select(nid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/mycgv2/css/mycgv.css">
<script src="http://localhost:9000/mycgv2/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mycgv2/js/mycgv_jquery.js"></script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>공지사항-수정하기</h1>
		<form name="boardUpdateForm" action="adminUpdateNoticeController.jsp" method="post">
			<input type = "hidden" name = "nid" value = <%= vo.getNid() %>>
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="ntitle" id="ntitle" value="<%= vo.getNtitle() %>">
				</li>
				<li>
					<label>내용</label>
					<textarea name="ncontent"><%= vo.getNcontent() %></textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
				</li>
				<li>
					<button type="button" class="btn_style" id="btnNoticeUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="admin_notice_content.jsp?nid=<%= vo.getNid() %>"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="admin_notice_list.jsp"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







