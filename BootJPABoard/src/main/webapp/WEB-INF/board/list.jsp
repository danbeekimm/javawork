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
 }
</style>
</head>
<body> <!-- 앞 board는같아서 writeform 만 적음 -->
<div style="margin: 50px 200px">
	<button type="button" class="btn btn-success" onclick="location.href='writeform'">글쓰기</button>
	<br>
	<h2>총 ${count} 개의 게시글이 있습니다</h2>
	<br>
	<table class="table table-striped" style="width: 800px;">
		<tr bgcolor="#ddd">
			<th width="50">번호</th>
			<th width="500">제목</th>
			<th width="100">작성자</th>
			<th width="300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</th>
		</tr>
		<c:if test="${count==0}">
			<tr>
				<td colspan="4" align="center">
					<b>등록된글이없습니다</b>
					</td>
				
			</tr>
		</c:if>
		<c:if test="${count>0}">
				<c:forEach var="dto" items="${list}" varStatus="i">
					<c:set var="n" value="${count-i.index}" />
					<tr align="center">
						<td>${n}</td>
						<td align="left">
							<a href="detail?num=${dto.num}" style="color: black;">
								${dto.subject}
							</a>
							
							&nbsp;
							<span class="glyphicon glyphicon-picture"
							style="color: gray; font-size: 0.8em;"></span>
							
						</td>
						<td>${dto.writer}</td>
						<td>
							<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
	</table>
</div>
</body>
</html>