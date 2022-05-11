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
body {
 font-size: 2rem;
 font-family: 'Jua';
  background-image: url("../image/존메이어.jpg");
 background-repeat: no-repeat;
 background-size: cover;
 }
 div.layout div{
 		border: 0px solid black;
 		}
 a:link {
	text-decoration: none;
	color: black;
}
 a:hover {
	text-decoration: none;
	
}
div.layout div.title a{
	
	color: black;
	
	}
div.layout div.title{
	position:absolute;
	top: 10px;
	left: 300px;
	
	}
	
div.layout div.menu{
position:absolute;
	top: 100px;
	left: 300px;

	}
div.layout div.info{
	position: absolute;
	left: 30px;
	top:250px;
	width: 200px;
	height: 200px;
	}
div.layout div.main{
	position: absolute;
	left: 400px;
	top:230px;
	width: 1000px;
	height: 500px;
	font-family: 'Jua';
	}
</style>
</head>
<body><!-- 타일스의이름과일치해야함 -->
	<div class="layout"> 
	
		<div class="title">
			<tiles:insertAttribute name="title2"/>
		</div> 
		
		<div class="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
</body>
</html>