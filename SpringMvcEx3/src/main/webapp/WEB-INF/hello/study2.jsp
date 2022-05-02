<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'Jua';
		font-size: 2em;
		}
</style>


</head>
<body>
<h1>go1페이지로부터 포워드된 jsp파일</h1>
이름: ${name}<br>
주소: ${addr}<br>
<hr> <!-- go1기준으로보고 작성ㅎ야함 -->
<h3>resources 폴더의 c6.png 이미지출력</h3>
<img src="res/c6.png" width="130">
<h3>avata 폴더의 s6.JPG 이미지출력</h3>
<img src="avata/s6.JPG" width="130">
<h3>image 폴더의 12.jpg 이미지출력</h3>
<img src="image/12.jpg" width="130">
</body>
</html>