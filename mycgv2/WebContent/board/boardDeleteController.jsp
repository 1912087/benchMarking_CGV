<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoard2DAO" %>

<%
	String bid = request.getParameter("bid");
	CgvBoard2DAO dao = new CgvBoard2DAO();
	int result = dao.delete(bid);
	if(result == 1){
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("errorPage.jsp");
	}
%>