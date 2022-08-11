<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/mycgv2/css/mycgv.css">
<script src = "http://localhost:9000/mycgv/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		//페이지 호출 후 바로 AJAX를 이용하여 공지사항 리스트가 뜨도록 함
		$.ajax({
			url : "noticeListJsonController.jsp",
			success : function(result){
				//서버에서 데이터를 주고 받을 때는 String 형식으로 주고 받는다. 따라서 콜백 함수에 반환된 값은 문자열이므로 JSON 객체로 변환할 필요가 있다.
				let dataset = JSON.parse(result);

				output = "<table class='board'>";
				output += "<tr><th>번호</th><th>제목</th><th>작성 일자</th><th>조회수</th></tr>";
				for(data of dataset.list){
					output += "<tr>";
					output += "<td>" + data.rno + "</td>";
					output += "<td><a href='#' class='bclass' id = '" + data.nid + "'>" + data.ntitle + "</a></td>";
					output += "<td>" + data.ndate + "</td>";
					output += "<td>" + data.nhits + "</td>";
					output += "</tr>";
				}
				
				output += "<tr>";
				output += "<td colspan = '4'> << 1 2 3 4 5 >> </td>";
				output += "</tr>";
				
				output += "</table>";
				
				//브라우저에 출력
				$("h1").after(output);
				
				//이벤트 처리 : 콜백함수로 받은 파라미터 값은 콜백함수 내에서만 처리가 가능함
				//요소가 다 생성이 되고 난 후에 이벤트 처리를 진행할 것
				$(".bclass").click(function(){
					//외부 함수 호출 : 좀 더 알아보기 쉬워져서 유지보수가 수월해진다.
					noticeContent($(this).attr("id"));
				});//click Event
			}//success
		});//ajax
		
		function noticeContent(nid){
			//상세보기 데이터를 AJAX를 통해 받아온다.
			$.ajax({
				url : "noticeContentJsonController.jsp?nid="+nid,
				success : function(data){
					let dataset = JSON.parse(data);
					output = "<table class='boardContent'>";
					output += "<tr>";
					output += "<th>등록일자</th>";
					output += "<td>" + dataset.ndate + "</td>";
					output += "<th>조회수</th>";
					output += "<td>" + dataset.nhits + "</td>";
					output += "</tr>";

					output += "<tr>";
					output += "<th>제목</th>";
					output += "<td colspan = '3'>" + dataset.ntitle + "</td>";
					output += "</tr>";

					output += "<tr>";
					output += "<th>내용</th>";
					output += "<td colspan = '3'>" + dataset.ncontent + "</td>";
					output += "</tr>";
					
					output += "<tr>";
					output += "<td colspan = '4'><button type = 'button' class='btn_style' id='backList'>리스트</button>";
					output += "<button type = 'button' class='btn_style' id='backHome'>홈으로</button></td>";
					output += "</tr>";
					output += "</table>";
					
					//브라우저에 출력
					$("table.board").remove();
					$("h1").after(output);
					
					//리스트 이벤트 처리
					$("#backList").click(function(){
						$(location).attr("href", "notice_list.jsp");
					}).css("cursor", "pointer");
					
					//홈으로 이벤트 처리
					$("#backHome").click(function(){
						$(location).attr("href", "../index.jsp");
					}).css("cursor", "pointer");
				}
			});
		}
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
		<h1>공지사항</h1>
	<!-- 	<table class="board">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="notice_content.jsp">7월 마지막 이벤트 입니다~ ^^</a></td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>2</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>3</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>4</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>5</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>6</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>7</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>8</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>9</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>10</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td colspan="4"> << 1 2 3 4 5 >> </td>
			</tr>
		</table>	 -->
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







