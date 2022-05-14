<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.data.ShopDto"%>
<%@page import="mysql.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	// 디테일페이지로부터 num 읽기
	String num = request.getParameter("num");
	// dao 선언
	ShopDao dao = new ShopDao();
	//dao 로 부터 num에 해당하는 dto 얻기
	ShopDto dto = dao.getSangpum(num);
	//json 으로 변환
	JSONObject ob = new JSONObject();
	ob.put("num",dto.getNum());
	ob.put("sangpum",dto.getSangpum());
	ob.put("color",dto.getColor());
	ob.put("price",dto.getPrice());
	ob.put("ipgoday",dto.getIpgoday());
	ob.put("photo",dto.getPhoto());
	ob.put("cnt",dto.getCnt());
	%>
	<%=ob.toString()%>