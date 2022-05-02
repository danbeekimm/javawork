<%@page import="java.util.List"%>
<%@page import="mysql.data.GuestDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mysql.data.GuestDao"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//json 배열타입으로 나오도록 코딩
//날짜는 년월일 시분까지만 나오게 simpleDateFormat

//목록가져오기
	GuestDao dao=new GuestDao();

List<GuestDto> list=dao.getAllGuest();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm");

JSONArray arr=new JSONArray();
for(GuestDto dto:list)
{
//JSONArray arr=new JSONObject(); //날짜는 타임스템프라 심플데이터 포멧으로바꿔줘야함.
JSONObject ob= new JSONObject();
ob.put("num",dto.getNum());
ob.put("writer",dto.getWriter());
ob.put("avata",dto.getAvata());
ob.put("content",dto.getContent());
ob.put("writeday",sdf.format(dto.getWriteday()));
//arr에 추가
arr.add(ob);
}
%>
<%=arr.toString()%>