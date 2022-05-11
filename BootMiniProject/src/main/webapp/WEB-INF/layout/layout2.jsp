<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
 <!-- 타일추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
div.main{
	width: 100%;
	}
body{

background-size:cover;
background-repeat: no-repeat;
 background-image: url("../image/존메이어.jpg");
 background-repeat: no-repeat;
 background-size: cover;
}
</style>
</head>
<body style="color: white;"><!-- 타일스의이름과일치해야함 -->
	<div class="layout"> 
	
		<div class="title">
			<h1>오시는길...</h1>
		</div> 
		
		<div class="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="main">
			<tiles:insertAttribute name="main"/>
		</div>
		
	</div>
</body>
</html>