<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
</head>
<%String gender=request.getParameter("gender"); 
	String chk_mail=request.getParameter("chk_mail");
	String content=request.getParameter("content");
	String items[]=request.getParameterValues("item");
	String jobs[]=request.getParameterValues("job");

	
	%>

<body>
<table class="table table-bordered" style="width: 200px;">

	<b>성별 : <%=gender%></b><br>
	<b>메일정보수신여부 : <%=chk_mail==null?"없음":"있음"%></b><br>
	<b>가입인사 : <%=content%></b><br>
	<b>선택항목 :</b>
	<b>가장좋아하는착장:
	<% if (items == null) {
	%>
		없음
		<%
	} else {
	for (String i : items) { //하비배열에 있는걸 h가받아서출력해주겠다
	%>
		[<%=i%>]&nbsp;
		<%
		}
		}
		%></b><br>
		
	
	
	<b>직업:
<% if (jobs == null) {
	%>
		없음
		<%
	} else {
	for (String i : jobs) { //하비배열에 있는걸 h가받아서출력해주겠다
	%>
		[<%=i%>]&nbsp;
		<%
		}
		}
		%></b>
		
		
	
	
		
</body>
</html>