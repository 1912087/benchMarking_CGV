<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNotice2DAO, com.mycgv2.vo.CgvNotice2VO, java.util.ArrayList" %>
<%@ page import = "com.google.gson.*" %>
<%	
	//1. DB에 접근하여 데이터를 얻어옴
	CgvNotice2DAO dao = new CgvNotice2DAO();
	ArrayList<CgvNotice2VO> list = (ArrayList<CgvNotice2VO>)dao.select();
	// └ VO 객체를 담은 ArrayList 객체를 생성한 자바 객체 변수 list
	
	//2. 얻어온 데이터를 JSON을 변환
	JsonObject jobject = new JsonObject();		//객체를 Json 객체로 변환하거나 Json 객체를 새롭게 생성해준다
	JsonArray jarray = new JsonArray();			//배열로 만들어준다(Json이 아닌 데이터 가능)
	Gson gson = new Gson();						//자바 객체를 Json 형태로 만들어 주기 위하여 객체를 생성한다.
	
	//list에 담긴 VO 객체를 하나하나 JSON 객체로 변환한다
	for(CgvNotice2VO vo : list){				//자바는 for( : ) 이고 javaScript 가 for ~ of 이다. 헷갈리지 말 것
		JsonObject jo = new JsonObject();		//VO 객체를 하나하나 별도로 JSON 객체로 만들어주어야 하므로 JsonObject 객체를 생성
		jo.addProperty("rno", vo.getRno());		//addProperty(property, Java객체); -> 자바 객체에  Property를 추가한다 라고 생각하면 편할 듯
		jo.addProperty("nid", vo.getNid());		//json으로 변환할 때는 property가 꼭 들어가야 한다! (키 값은 필수)
		jo.addProperty("ntitle", vo.getNtitle());
		jo.addProperty("ncontent", vo.getNcontent());
		jo.addProperty("nhits", vo.getNhits());
		jo.addProperty("ndate", vo.getNdate());
		
		//배열에 JSON 으로 변환된 객체를 넣어준다
		jarray.add(jo);		//add(Json 객체)
	}
	
	jobject.add("list", jarray);	//add(property, Json 객체);
	
	out.write(gson.toJson(jobject));	//out.write는 jQuery 객체인 반면, JsonObject 객체 등은 'new'로 생성하였으므로 자바 객체이다.
										//따라서 한 번 더 별도로 jQuery가 읽을 수 있는 Json 객체로 변환해주어야 한다.
	
%>