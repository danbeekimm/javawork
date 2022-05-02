<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.data.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("num");
String pass=request.getParameter("pass");

//dao 선언
GuestDao dao= new GuestDao();
boolean b=dao.isEqualPass(num, pass);
//비번맞을경우삭제
if(b){
	dao.guestDelete(num);
}
JSONObject ob= new JSONObject();
ob.put("result", String.valueOf(b));

%>
<%=ob.toString()%>