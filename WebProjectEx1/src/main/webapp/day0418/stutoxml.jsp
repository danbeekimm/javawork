<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mysql.data.StuDto"%>
<%@page import="java.util.List"%>
<%@page import="mysql.data.StuDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp를 xml 처리하는 방법 -->
  
<%
   StuDao dao=new StuDao();
   List<StuDto> list = dao.getAllDatas();
   
%>  
<list>
   <%
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   for(StuDto dto:list)
   {%>
      <stu>
      <num><%=dto.getNum()%></num>
      <name><%=dto.getName()%></name>
      <hp><%=dto.getHp()%></hp>
      <photo><%=dto.getPhoto()%></photo>
      <addr><%=dto.getAddr() %></addr>
      <writeday><%=sdf.format(dto.getWriteday()) %></writeday>
      </stu>
   <%}
   %>
</list>

