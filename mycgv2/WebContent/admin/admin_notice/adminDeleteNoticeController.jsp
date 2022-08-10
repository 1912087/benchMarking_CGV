<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.vo.CgvNotice2VO, com.mycgv2.dao.CgvNotice2DAO" %>
<%
	String nid = request.getParameter("nid");
	CgvNotice2DAO dao = new CgvNotice2DAO();
	int result = dao.delete(nid);
	if(result == 1){
		response.sendRedirect("admin_notice_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>