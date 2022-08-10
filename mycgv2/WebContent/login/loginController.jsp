<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMember2DAO, com.mycgv2.vo.CgvMember2VO" %>

<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvMember2VO" />

<jsp:setProperty property = "*" name = "vo"/>

<%
	CgvMember2DAO dao = new CgvMember2DAO();
	int result = dao.select(vo);
	if(result == 2){
		response.sendRedirect("../index.jsp?login=ok");
	}else if(result == 1){
		response.sendRedirect("login.jsp?login=1");
	}else if(result == 0){
		response.sendRedirect("login.jsp?login=0");
	}else{
		response.sendRedirect("login.jsp?login=fail");
	}
%>