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
body {
	font-family: 'Jua';
	font-size: 1.4rem;
}
div.box{
width: 30px;
height: 30px;
border: 1px solid black;
}
</style>
</head>
<body>
	<h1>${message}</h1>	
	<img src="s1.JPG"><img src="s2.JPG">
	<br><br>
	<button type="button" class="btn btn-default"
	 style="width: 130px;" onclick="location.href='form'">자동차정보추가</button>
	<br>
	<table class="table table-bordered" style="width: 900px;">
		<tr bgcolor="#ddd">
			<th style="width: 50px">번호</th>
			<th style="width: 150px">자동차명</th>
			<th style="width: 120px">가격</th>
			<th style="width: 80px">색상</th>
			<th style="width: 150px">구입일</th>
			<th style="width: 200px">등록일</th>
			<th>관리</th>			
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="i">
			<tr>
				<td align="center">${i.count}</td>
				<td>${dto.carname}</td>
				<td align="right">
					<fmt:formatNumber value="${dto.carprice}" type="currency"/>
				</td>
				<td align="center">
					<div class="box" style="background-color: ${dto.carcolor}"></div>
					<b>${dto.carcolor}</b>
				</td>
				<td align="center">${dto.carguip}</td>
				<td align="center">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td align="center">
					<button type="button" class="btn btn-info btn-xs"
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					
					<button type="button" class="btn btn-danger btn-xs"
					onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
