<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.data.ShopDto"%>
<%@page import="mysql.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//디테일 페이지로부터 num 읽기
String num=request.getParameter("num");
//dao 선언
ShopDao dao=new ShopDao();
//dao 로부터 num에 해당하는 dto 읽기 //자바dto를 제이슨으로 바꾸기
ShopDto dto=dao.getSangpum(num);
//json 으로변환 //한개니까 어래이 ㄴㄴ 오브젝트
JSONObject ob= new JSONObject();
ob.put("num",dto.getNum());
ob.put("sangpum",dto.getSangpum());
ob.put("color",dto.getColor());
ob.put("price",dto.getPrice());
ob.put("ipgoday",dto.getIpgoday());
ob.put("photo",dto.getPhoto());
ob.put("cnt",dto.getCnt());

//읽어보면 http://localhost:9000/WebProjectEx/day0420/DetailJson.jsp?num=4 나오고 넘이 4라고쳐보면 오브젝트 4번째꺼 나옴,

%>
<%=ob.toString()%>