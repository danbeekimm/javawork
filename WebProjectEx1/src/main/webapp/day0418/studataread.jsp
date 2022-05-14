<%@page import="mysql.data.StuDao"%>
<%@page import="mysql.data.StuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
//한글 엔코딩(post 방식)
request.setCharacterEncoding("utf-8");
//값 읽기
String name = request.getParameter("name");
String hp = request.getParameter("hp");
String addr = request.getParameter("addr");
String photo = request.getParameter("photo");

//dto에 넣기
StuDto dto = new StuDto();
dto.setName(name);
dto.setHp(hp);
dto.setAddr(addr);
dto.setPhoto(photo);
//dao 선언
StuDao dao = new StuDao();
//insert 
dao.insertStudent(dto);
%>