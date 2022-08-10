<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoard2DAO, com.mycgv2.vo.CgvBoard2VO, java.util.ArrayList" %>

<%
	CgvBoard2DAO dao = new CgvBoard2DAO();
	ArrayList<CgvBoard2VO> list = (ArrayList<CgvBoard2VO>)dao.select();
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
		<h1>게시판-리스트</h1>
		<table class="board">
			<tr>
				<td colspan="4">
					<a href="board_write.jsp">
					<button type="button" class="btn_style">글쓰기</button>
					</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<%
				if(list.size() == 0){
			%>
			<tr>
				<td colspan = "4">등록된 게시글이 없습니다.</td>
			</tr>
			<%
				} else {
					for(CgvBoard2VO vo : list){
			%>
			<tr>
				<td><%= vo.getRno() %></td>
				<td><a href="board_content.jsp?bid=<%= vo.getBid() %>"><%= vo.getBtitle() %></a></td>
				<td><%= vo.getBdate() %></td>
				<td><%= vo.getBhits() %></td>
			</tr>
			<%		
					}
				}
			%>
			<tr>
				<td colspan="4"> << 1 2 3 4 5 >> </td>
			</tr>
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







