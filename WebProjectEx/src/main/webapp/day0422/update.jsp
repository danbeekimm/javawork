<%@page import="mysql.data.GuestDao"%>
<%@page import="mysql.data.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//num넣으면업데이트 안넣으면인서트
	//앤코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이타읽기
	String num = request.getParameter("num");
	String writer = request.getParameter("writer");
	String avata = request.getParameter("avata");
	
	String content = request.getParameter("content");
	
	//dto에 넣기 위에 네개 디폴트로 생성하고 set으로 넣어줌
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setAvata(avata);
	dto.setContent(content);
	//dao 선언
	GuestDao dao = new GuestDao();
	//insert메서드 호출
	dao.guestUpdate(dto);
%>

