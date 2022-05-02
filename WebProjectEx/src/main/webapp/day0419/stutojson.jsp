<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mysql.data.StuDto"%>
<%@page import="java.util.List"%>
<%@page import="mysql.data.StuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
StuDao dao=new StuDao();
List<StuDto> list=dao.getAllDatas();

StringBuffer sb=new StringBuffer();

	sb.append("[");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	for(StuDto dto:list)
	{ //라이브없으면 이걸로해?
		sb.append("{\"num\":"+dto.getNum()+",");
		sb.append("\"name\":\""+dto.getName()+"\",");
		sb.append("\"photo\":\""+dto.getPhoto()+"\",");
		sb.append("\"hp\":\""+dto.getHp()+"\",");
		sb.append("\"addr\":\""+dto.getAddr()+"\",");
		sb.append("\"writeday\":\""+(sdf.format(dto.getWriteday()))+"\"");
		sb.append("},");
		}	
	//마지막 , 제거하기
	sb.deleteCharAt(sb.length()-1); //0부터 시작이라 -1함.
	
	sb.append("]");
	%>
	<%=sb.toString()%>