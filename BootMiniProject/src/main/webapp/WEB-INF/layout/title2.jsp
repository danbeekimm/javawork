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

 font-size: 4rem;
 font-family: 'Jua';
 
 height: 100px;
 background-color: #F3F1E9;
 }
 img{
 width: 100px;
 height: 70px;
 }
 .b{
	text-align: center;
	}

.title{
text-align: center;
}
</style>

</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body style="font-size: 3rem;">
   <a href="/">
   <img src="${root}/image/love.png">
   <h3 class="title" >λμ μΈμ</h3></a>
</body>

</html>