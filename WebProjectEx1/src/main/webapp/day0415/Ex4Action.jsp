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
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

</head>
<%
//한글 엔코딩
request.setCharacterEncoding("UTF-8"); //항상 읽기 전에 준다. 

String fcolor = request.getParameter("fcolor");
String birth = request.getParameter("birth");
String[] hobby = request.getParameterValues("hobby");
//여러개를 읽어올 경우 getParameterValues, 선택 안할시 null
String[] photo = request.getParameterValues("photo");
%>
<body>
	<div style="color: <%=fcolor%>">
		글자색 :
		<%=fcolor%><br> 생년월일 :
		<%=birth%><br> 나의취미 :
		<%
	if (hobby == null) {
	%>

		<%
		} else {
		for (String h : hobby) {
		%>
		[<%=h%>]&nbsp;
		<%
		}
		}
		%>
		<br> 인형목록 :
		<%
		if (photo == null) {
		%>
		없음
		<%
		} else {
		for (String p : photo) {
		%>
		<img src="<%=p%>">
		<%
		}
		}
		%>
	</div>
</body>
</html>