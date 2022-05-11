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

 font-family: 'Jua';

 }
</style>
</head>
<body>
<br>
	<div class="content" style="width: 800px; text-align: left;" >
		<h1>
			<b>${dto.subject}</b>
		</h1>
		<span class="glyphicon glyphicon-user"></span>&nbsp;<b>${dto.name}</b>
		&nbsp;&nbsp; <span style="color: gray;"> <fmt:formatDate
				value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" />
		</span> <br> <br>
		<pre style="background-color: #d3bc99; border: none;">
			<b>${dto.content}</b>
		</pre>
		<br>
		<br>
		<c:if test="${dto.photos!='no'}">
			<c:forTokens var="photo" items="${dto.photos}" delims=",">
			<a href="../save/${photo}" target="_new" style="cursor: pointer;">
				<img src="../save/${photo}" style="max-width: 300px;"
					border="1px soild black;"></a>
				<c:if test="${n.count%2==0 }">
					<br>
					<br>
				</c:if>

			</c:forTokens>
		</c:if>
		<br><br>
		<div class="buttons" style="text-align: center;">
			<button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			<button type="button" class="btn btn-default" 
			onclick="location.href='form?num=${dto.num}&reg=${dto.reg}&restep=${dto.restep }&relevel=${dto.relevel }&currentpage=${currentpage}'">답글</button>
			<button type="button" class="btn btn-default" >수정</button>
			<button type="button" class="btn btn-default">삭제</button>
		
		</div>
	</div>
</body>
</html>