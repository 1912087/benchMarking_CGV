<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoard2DAO, com.mycgv2.vo.CgvBoard2VO" %>
<%
	String bid = request.getParameter("bid");
	CgvBoard2DAO dao = new CgvBoard2DAO();
	CgvBoard2VO vo = dao.select(bid);
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
		<h1>게시판-수정하기</h1>
		<form name="boardUpdateForm" action="boardUpdateController.jsp" method="get">
			<input type = "hidden" name = "bid" value = <%= vo.getBid() %>>
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="btitle" id="btitle" value="<%= vo.getBtitle() %>">
				</li>
				<li>
					<label>내용</label>
					<textarea name="bcontent"><%= vo.getBcontent() %></textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
				</li>
				<li>
					<button type="button" class="btn_style" id="btnBoardUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="board_content.jsp?bid=<%= bid %>"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="board_list.jsp"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







