<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMember2DAO, com.mycgv2.vo.CgvMember2VO, java.util.ArrayList" %>

<%
	String rpage = request.getParameter("rpage");
	CgvMember2DAO dao = new CgvMember2DAO();

	//페이징 처리
	int startCount = 0;
	int endCount = 0;
	int pageSize = 5;
	int reqPage = 1;
	int pageCount = 1;
	int dbCount = dao.totalCount();
	
	//페이지 전체 조회
	
	
	ArrayList<CgvMember2VO> list = (ArrayList<CgvMember2VO>)dao.selectAll(startCount, endCount);
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
		<h1>회원관리-리스트</h1>
		<table class="board">			
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>연락처</th>
				<th>가입날짜</th>
			</tr>
			<% for(CgvMember2VO vo : list) { %>
			<tr>
				<td><%= vo.getRno() %></td>
				<td><a href="admin_member_content.jsp?id=<%= vo.getId()%>"><%= vo.getId() %></a></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getPnumber() %></td>
				<td><%= vo.getMdate() %></td>
			</tr>
			<% } %>
			<tr>
				<td colspan="5"> << 1 2 3 4 5 >> </td>
			</tr>
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







