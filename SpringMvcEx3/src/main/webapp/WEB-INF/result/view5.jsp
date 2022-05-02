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
	<h1>
		   <pre>
      이  름 : ${personDto.name }
      사  진 : <img src = "${personDto.photo}" width="120"> <!--이렇게해도됨 "../${personDto.photo}"> -->
      자바점수 : ${personDto.java}점
      스프링점수 : ${personDto.spring}점
      총  점 : ${personDto.java+personDto.spring}점 <!-- ${tot} -->
      평  균 : <fmt:formatNumber value="${(personDto.java+personDto.spring)/2}" pattern="0.0"/>점
  			 </pre>
	</h1>
</body>
</html>