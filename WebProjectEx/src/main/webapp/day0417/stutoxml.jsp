<?xml version="1.0" encoding="UTF-8"?> <%--반드시 1행 1열로 넣고 밑에 엑스엠엘로바꾸기 --%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="mysql.data.StuDao"%>
<%@page import="mysql.data.StuDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	StuDao dao= new StuDao();
	List <StuDto> list=dao.getAllDatas();
%>
<list>
<%
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
    for(StuDto dto:list)
    {%>
    <stu>
	    <num><%=dto.getNum()%></num>
	    <name><%=dto.getName()%></name>
	    <hp><%=dto.getHp()%></hp>
	    <photo><%=dto.getPhoto()%></photo>
	    <addr><%=dto.getAddr()%></addr>
	    <writeday><%=sdf.format(dto.getWriteday())%></writeday>
    </stu>
    <%}
    %>
    </list>