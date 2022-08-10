<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.vo.CgvNotice2VO, com.mycgv2.dao.CgvNotice2DAO" %>
<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvNotice2VO"/>
<jsp:setProperty name = "vo" property = "*"/>
<%
	CgvNotice2DAO dao = new CgvNotice2DAO();
	int result = dao.update(vo);
	if(result == 1){
		response.sendRedirect("admin_notice_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>