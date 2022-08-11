<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String join_result = request.getParameter("join");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:9000/mycgv2/css/mycgv.css">
<script src="http://localhost:9000/mycgv2/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/mycgv2/js/mycgv_jquery.js"></script>
<script>
	$(document).ready(function(){
		let join_result = '<%= join_result %>';
		if(join_result == "fail"){
			alert("회원가입에 실패하였습니다.");
		}
		
		//아이디 중복확인 버튼 정리
		$("#idCheck").click(function(){
			//아이디 값의 체크 - 유효성 체크(Validation Check)
			if($("#id").val() == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			}else{
				//AJAX를 통해 서버로 요청/응답
				//jQuery의 메소드 $.ajax();
				//ajax 혼자서 작업하지 못하며, jQuery를 통해 작업이 가능함
				$.ajax({
					//url : "요청 서버 페이지",
					//success : function(실행 결과)	-> 다른 곳으로 절대 못 보내고 무조건 실행 결과로 결과값을 반환 받게 된다.
					url : "idCheckController.jsp?id="+$("#id").val(),
					//콜백 함수
					success : function(data){	//Network 와 Network 간의 데이터 이동은 String 형태로만 가능하다.
						//AJAX에는 무조건 String 형태로 데이터를 보낼 수 있지만 javascript에서는 데이터에 따라서 자동으로 데이터형이 정해진다.
						//alert("data -> " + data);
						if(data == 1){
							//jQuery에서는 요소가 존재하지 않아도 자동적으로 객체를 만들어 반환하기 때문에 요소가 있는걸로 뜬다.
							//따라서 요소가 존재하는지 하지 않는지는 length를 통해 파악
							if($('#idCheckMsg').length == 0){
								$("#idCheck").after("<span id = 'idCheckMsg'>이미 사용중인 아이디입니다.</span>");
								$("#idCheckMsg")
								.css("color", "red").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});
							}else{
								$("#idCheckMsg").text("이미 사용중인 아이디입니다.")
								.css("color", "red").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});
							}
							/*$("#idCheckMsg").text("이미 사용중인 아이디입니다.")
							.css("color", "red").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});*/
						}else{
							if($("#idCheckMsg").length == 0){
								$("idCheck").after("<span id = 'idCheckMsg'>사용 가능한 아이디입니다!</span>");
								$("#idCheckMsg")
								.css("color", "blue").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});
							}else{
								$("#idCheckMsg").text("사용 가능한 아이디입니다!")
								.css("color", "blue").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});
							}
							/*$("#idCheckMsg").text("사용 가능한 아이디입니다!")
							.css("color", "blue").css({"font-size" : "12px", "margin-left" : "160px", "margin-top" : "5px"});*/
						}
					}
				});//AJAX()
			}
		});//idCheckbutton
	});//ready function
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>회원가입</h1>
		<form name="joinForm"  action="joinController.jsp"  method="post">
		
			<ul>
				<li>
					<label>아이디</label>
					<input type="text" name="id" id="id" placeholder="*영문자숫자포함 8자이상">
					<button type="button" class="btn_style" id="idCheck">중복확인</button>
					<!-- <span id = "idCheckMsg"></span> -->
				</li>
				<li>
					<label>비밀번호</label>
					<input type="password" name="pass" id="pass">
				</li>
				<li>
					<label>비밀번호 확인</label>
					<input type="password" name="cpass" id="cpass" >
					<span id="passCheckMsg">*비밀번호를 다시 입력해주세요</span>
				</li>
				<li>
					<label>성명</label>
					<input type="text" name="name" id="name">
				</li>
				<li>
					<label>성별</label>
					<input type="radio" name="gender" value="m"><span>남자</span>
					<input type="radio" name="gender" value="f"><span>여자</span>
				</li>
				<li>
					<label>이메일</label>
					<input type="text" name="email1" id="email1"><span>@</span>
					<input type="text" name="email2" id="email2">
					<select id="email3" >
						<option value="default">선택</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="daum.net">다음</option>
						<option value="self">직접입력</option>
					</select>
				</li>
				<li>
					<label>주소</label>
					<input type="text" name="zonecode" id="zonecode" placeholder="우편번호">
					<input type="text" name="addr1" id="addr1">
					<button type="button" class="btn_style" id="btnSearchAddr">주소찾기</button>
				</li>
				<li>
					<label>상세주소</label>
					<input type="text" name="addr2" id="addr2">
				</li>
				<li>
					<label>휴대폰</label>
					<div>
						<input type="radio" name="hp" value="SKT"><span>SKT</span>
						<input type="radio" name="hp" value="LGU+"><span>LGU+</span>
						<input type="radio" name="hp" value="KT"><span>KT</span>
					</div>
					<select name="pnum1" id="pnum1">
						<option value="default">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
					</select> - 
					<input type="text" name="pnum2" id="pnum2"> -
					<input type="text" name="pnum3" id="pnum3"> 
				</li>
				<li>
					<label>취미</label>
					<input type="checkbox" name="hobby" value="영화보기"><span>영화보기</span>
					<input type="checkbox" name="hobby" value="등산하기"><span>등산하기</span>
					<input type="checkbox" name="hobby" value="게임하기"><span>게임하기</span>
					<input type="checkbox" name="hobby" value="잠자기"><span>잠자기</span>
	
				</li>
				<li>
					<label>자기소개</label>
					<textarea name="intro">*200자 이내로 작성해주세요</textarea>
				</li>
				<li>				
					<button type="button" class="btn_style" id="btnJoin">가입하기</button>
					<button type="reset" class="btn_style">다시입력</button>				
				</li>
			</ul>	
		</form>	 
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







