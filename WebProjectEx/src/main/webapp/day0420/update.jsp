<%@page import="mysql.data.ShopDao"%>
<%@page import="mysql.data.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글엔코딩
request.setCharacterEncoding("UTF-8");
//데이타읽기
String num=request.getParameter("unum");
String sangpum=request.getParameter("usangpum");
String color=request.getParameter("ucolor");
String photo=request.getParameter("uphoto");
String ipgoday=request.getParameter("uipgoday");
int price=Integer.parseInt(request.getParameter("uprice"));
int cnt=Integer.parseInt(request.getParameter("ucnt"));
System.out.println(num+","+sangpum);
//dto
ShopDto dto=new ShopDto();
dto.setNum(num);
dto.setSangpum(sangpum);
dto.setColor(color);
dto.setPhoto(photo);
dto.setPrice(price);
dto.setCnt(cnt);
dto.setIpgoday(ipgoday);

//dao 호출  1. dao에 업데이트 쓰고 2. jsp에서 dto와 dao호출 업데이트에 넣기
ShopDao dao=new ShopDao();
dao.shopUpdate(dto);

%>