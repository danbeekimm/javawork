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
<form action="form">
   <b>이 름 : </b>
   <input type="text" name="name" class="form-control" style="width:120px;">
   <br>
   <b>나 이 : </b>
   <input type="text" name="age" class="form-control" style="width:120px;">
   <br>
   <b>여행하고싶은나라 : </b>
   <select name="nara">
   	<option value="하와이">하와이</option>
   	<option value="미국">미국</option>
   	<option value="프랑스">프랑스</option>
   	<option value="집">집</option>
   </select>
   <br>
   <button type="submit">전송</button>
</form>
<!-- param=parameter, param.name이 비어있지 않을 경우에만 출력하라 -->
<c:if test="${!empty param.name }">
이 름 : ${param.name}<br>
나 이 : ${param.age}<br>
</c:if>
<!-- 나이가 20세 이상이면 파랑생으로 xxx님은 성인입니다.
20세 미만이면 빨강색으로 xxx님은 미성년자입니다. 라고 출력 -->
<c:if test="${param.age>=20 }">
   <h2 style="color:blue">${param.name }님은 성인입니다.</h2>
</c:if>
<c:if test="${param.age<20 }">
   <h2 style="color:red">${param.name }님은 미성년자입니다.</h2>
</c:if>
<c:set var="nara" value="${param.nara}"/>
<h2>선택한 나라는 ${nara}입니다</h2>
<c:if test="${nara=='미국'}">
	<h3 style="background-color: orange">미국은 아름다운나라입니다</h3>
</c:if>

<c:if test="${nara=='하와이'}">
	<h3 style="background-color: pink">하와이가고싶어</h3>
</c:if>

<c:if test="${nara=='프랑스'}">
	<h3 style="background-color: yellow">프랑스가고시퍼..</h3>
</c:if>

<c:if test="${nara=='집'}">
	<h3 style="background-color: gray;">집은 너무진짜 너무가고싶어</h3>
</c:if>
<hr>
<c:choose>
	<c:when test="${nara=='미국' }">
	<h1>다음달에 미국가</h1>
	</c:when>
	
	<c:when test="${nara=='하와이' }">
	<h1>다음달에 하와이가</h1>
	</c:when>
	
	<c:otherwise>
		<h1>${nara}언제가?</h1>
	</c:otherwise>
	
</c:choose>
<hr>
<c:if test="${nara=='미국'  or nara=='하와이'}">
<h1>선택한나라는 ${nara}입니다</h1>
</c:if>
<!-- 나이가 20~50 이면 상금 50만원드립니다 출력 -->
<c:if test="${param.age>19 and param.age<51 }">
<h1>상금 50만원드립니다!!</h1>
</c:if>
</body>
</html>