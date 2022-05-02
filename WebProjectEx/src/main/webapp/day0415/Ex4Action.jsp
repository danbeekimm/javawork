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
<%
//한글엔코딩
request.setCharacterEncoding("UTF-8"); //한글깨짐해결 첫줄에줘야함 읽기전에

String fcolor=request.getParameter("fcolor");
String birth=request.getParameter("birth"); //하나값넘어올땐 겟파라미터
String []hobby=request.getParameterValues("hobby"); //선택안할시 null
String []photo=request.getParameterValues("photo"); //여러개는겟파라미터벨류
%>
<body>
	<div style="color: <%=fcolor%>">
		글자색 :
		<%=fcolor%><br> 생년월일 :
		<%=birth%><br> 나의취미 :
		<%
	if (hobby == null) {
	%>
		없음
		<%
	} else {
	for (String h : hobby) { //하비배열에 있는걸 h가받아서출력해주겠다
	%>
		[<%=h%>]&nbsp;
		<%
		}
		}
		%><br>
		
	인형목록 :
	<%
	if (photo == null) 
	{%>
		없음
		
	<%} else {
	for (String p : photo) 
	{%> 
	<img src="<%=p %>">
	<%}
		}%>	

	</div>
</body>
</html>