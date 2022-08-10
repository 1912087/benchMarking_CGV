<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoard2DAO" %>
<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvBoard2VO"/>
<jsp:setProperty name = "vo" property = "*"/>
<%
	CgvBoard2DAO dao = new CgvBoard2DAO();
	int result = dao.update(vo);
	
	if(result == 1){
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("errorPage.jsp");
	}
%>