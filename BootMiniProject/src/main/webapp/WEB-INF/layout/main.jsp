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
<style>
body {
 font-size: 2rem;
 font-family: 'Jua';
 background-image: url("../image/wallpaperbetter.jpg");
 background-repeat: no-repeat;
 background-size: cover;

 }
 img.mainimage{
 	width: 120px;
 	height: 120px;
 	border: 3px solid black; 
 	margin-right: 10px;
 	margin-bottom: 10px;
 	}

</style>
</head>
<body>
<h2  class="a" style='background-color: #8b4513;' "color: white; font-family: 'Lobster'" >[NIKE NEW Trending Now]</h2>
<c:forEach var="a" begin="1" end="20">
		<img src="image/${a}.jpg" class="mainimage">
		<c:if test="${a%5==0}"><br></c:if>
</c:forEach>
</body>
</html>