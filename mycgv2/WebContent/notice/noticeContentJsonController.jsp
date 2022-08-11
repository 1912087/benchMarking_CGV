<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNotice2DAO, com.mycgv2.vo.CgvNotice2VO"%>
<%@ page import = "com.google.gson.*"%>
<%
	String nid = request.getParameter("nid");
	CgvNotice2DAO dao = new CgvNotice2DAO();
	CgvNotice2VO vo = dao.select(nid);
	
	//Json 객체로 변환
	JsonObject jo = new JsonObject();
	Gson gson = new Gson();
	
	jo.addProperty("nid", vo.getNid());
	jo.addProperty("ntitle", vo.getNtitle());
	jo.addProperty("ncontent", vo.getNcontent());
	jo.addProperty("nhits", vo.getNhits());
	jo.addProperty("ndate", vo.getNdate());
	
	out.write(gson.toJson(jo));
%>