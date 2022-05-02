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
</head>
<body>
<c:if test="${state=='cart'}">
	<h2 style="color: green">${num} 번상품을 장바구니에 담았습니다</h2>
	<h3>장바구니에 담은 ${num}번 이미지</h3>
	
</c:if>

<c:if test="${state=='pay'}">
	<h2 style="color: blue">${num} 번상품을 구입했습니다</h2>
	<h3>구입한 ${num}번 이미지</h3>
	
</c:if>

<c:if test="${state=='cancel'}">
	<h2 style="color: red">${num} 번상품을 취소했습니다</h2>
	<h3>취소한 ${num}번 이미지</h3>
	
</c:if>
<img src="../../res/image/${num=='1'?'K-052':num=='2'?'K-049':'K-039'}.png">
</body>
</html>