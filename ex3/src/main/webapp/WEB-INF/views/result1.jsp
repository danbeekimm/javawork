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
<h2>HomeController 로부터 포워드</h2>
<h3>메세지 : ${requestScope.message}</h3>
<!--requestScope 는 생략가능  -->
<h3>메세지 2 : ${message }</h3>
<h2> 세션에 저장된  id  값 출력하기</h2>
<h3> 로그인한 아이디: ${sessionScope.myid}</h3>
<hr>
<c:set var="su1" value="7"/>
<c:set var="su2" value="4"/>

<table class="table table-bordered" style="width: 300px;">
	<caption>연산자</caption>
	<tr>
		<th>\${su1+su2}</th>
		<td>${su1+su2}</td>
	</tr>
	<tr>
		<th>\${su1-su2}</th>
		<td>${su1-su2}</td>
	</tr>
	<tr>
		<th>\${su1*su2}</th>
		<td>${su1*su2}</td>
	</tr>
	<tr>
		<th>\${su1/su2}</th>
		<td>${su1/su2}</td>
	</tr>
	<tr>
		<th>\${su1%su2}</th>
		<td>${su1%su2}</td>
	</tr>
	<tr>
		<th>\${su1 div su2}</th>
		<td>${su1 div su2}</td>
	</tr>
	<tr>
		<th>\${su1 mod su2}</th>
		<td>${su1 mod su2}</td>
	</tr>
	<tr>
		<th>\${empty sul }</th>
		<td>${empty sul }</td>
	</tr>
	
</table>
</body>
</html>












