<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.vo.CgvMember2VO, com.mycgv2.dao.CgvMember2DAO" %>

<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvMember2VO" />

<jsp:setProperty property = "*" name = "vo"/>

<%
	CgvMember2DAO dao = new CgvMember2DAO();
	int result = dao.insert(vo);
	if(result == 1){
		response.sendRedirect("../login/login.jsp?join=ok");
	}else{
		response.sendRedirect("../join/join.jsp?join=fail");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <p>id : <%= vo.getId() %></p>
	<p>pass : <%= vo.getPass() %></p>
	<p>name : <%= vo.getName() %></p>
	<p>gender : <%= vo.getGender() %></p>
	<p>email : <%= vo.getEmail() %></p>
	<p>zonecode : <%= vo.getZonecode() %></p>
	<p>addr1 : <%= vo.getAddr1() %></p>
	<p>addr2 : <%= vo.getAddr2() %></p>
	<p>hp : <%= vo.getHp() %></p>
	<p>pnumber : <%= vo.getPnumber() %></p>
	<p>hobbyList : <%= vo.getHobbyList() %></p>
	<p>intro : <%= vo.getIntro() %></p>
	<p>Mdate : <%= vo.getMdate() %></p> --%>
</body>
</html>