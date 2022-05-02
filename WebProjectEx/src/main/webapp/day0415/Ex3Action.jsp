<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<style>
body * {
	font-size: 2rem;
	font-family: 'Jua';
}
</style>

</head>

<%
//form tag 읽기-get방식 
String name = request.getParameter("name");
String email = request.getParameter("email");
String driver = request.getParameter("driver");
%>
<body>
	<b>이름 : <%=name%></b><br>
	<b>이메일 : <%=email%></b><br>
	<b>운전면허 : <%=driver==null?"없음":"있음"%></b><br>

</body>
</html>