<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMember2DAO" %>
<%
	String id = request.getParameter("id");
	CgvMember2DAO dao = new CgvMember2DAO();
	int result = dao.idCheck(id);
	
	//호출한 곳 : (ajax로 결과 값을 전송) :: 반드시 문자로
	out.write(String.valueOf(result));	//out.write는 바이트 단위의 char(문자 한 개)만 보낼 수 있음
%>