<%@page import="mysql.data.GuestDao"%>
<%@page import="mysql.data.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//앤코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이타읽기
	String writer = request.getParameter("writer");
	String avata = request.getParameter("avata");
	String pass = request.getParameter("pass");
	String content = request.getParameter("content");
	
	//dto에 넣기
	GuestDto dto = new GuestDto(writer, avata, content, pass);
	//dao 선언
	GuestDao dao = new GuestDao();
	//insert메서드 호출
	dao.guestInsert(dto);
%>

