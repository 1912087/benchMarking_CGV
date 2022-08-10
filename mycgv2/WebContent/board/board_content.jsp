<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoard2DAO, com.mycgv2.vo.CgvBoard2VO" %>
<%

	//bid 값을 가져와야하는데, 게시글 전체 조회에서 사용하는 bid를 사용하도록 한다
	String bid = request.getParameter("bid");
	CgvBoard2DAO dao = new CgvBoard2DAO();
	CgvBoard2VO vo = dao.select(bid);
	
	//저장된 쿠키 불러오기
	Cookie[] cookies = request.getCookies();
	String cookies_member = null;
	
	//요청 정보로부터 쿠키를 가져온다. 여기서는 로그인 세션을 아직 만들지 않았으므로 그냥 첫번째 쿠키를 사용하도록 한다
	cookies_member = cookies[0].getValue();
	
	//쿠키 세션 입력
	if(session.getAttribute(bid+":cookies") == null){
		session.setAttribute(bid+":cookies", bid + ":" + cookies_member);
	}else{
		session.setAttribute(bid+":cookies ex", session.getAttribute(bid + ":cookies"));
		//bid:cookies는 게시글 번호만 같으면 이름은 계속 동일하지만, cookies_member는 사용자의 컴퓨터에 따라서 계속 변화할 수 있다.
		if(!session.getAttribute(bid+":cookies").equals(bid + ":" + cookies_member)){
			session.setAttribute(bid+":cookies", bid + ":" + cookies_member);
		}
	}
	
	//조회수 카운트
	if(!session.getAttribute(bid + ":cookies").equals(session.getAttribute(bid + ":cookies ex"))){
		int result = dao.updateHits(bid);
		if(result == 1){
			//실시간으로 조회수를 보여줌
			vo.setBhits(vo.getBhits() + 1);
			
		}
	}
	//System.out.println(cookies_member);
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
		<h1>게시판-상세보기</h1>
		<table class="boardContent">	
			<tr>				
				<th>등록일자</th>
				<td><%= vo.getBdate() %></td>
				<th>조회수</th>
				<td><%= vo.getBhits() %></td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="3"><%= vo.getBtitle() %></td>
			</tr>
			<tr>				
				<th>내용</th>
				<td colspan="3"><%= vo.getBcontent() %><br><br><br><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="board_update.jsp?bid=<%= vo.getBid() %>"><button type="button" class="btn_style">수정하기</button></a>
					<a href="board_delete.jsp?bid=<%= vo.getBid() %>"><button type="button" class="btn_style">삭제하기</button></a>
					<a href="board_list.jsp">
						<button type="button" class="btn_style">리스트</button>
					</a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







