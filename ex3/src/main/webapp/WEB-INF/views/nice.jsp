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
	body*{
		font-size: 3rem;
		font-family: 'Jua';
		}
</style>

</head>
<body>
<div>
${today}<br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm"/><br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd a hh:mm"/><br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd EEE"/><br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd EEEE"/><br>
<fmt:formatDate value="${today}" pattern="오늘은yyyy년MM월dd일입니다"/><br>
<hr>
<c:set var="su1" value="67800000"/>
<c:set var="su2" value="23.45678"/>
${su1}<br>
${su2}<br>
<fmt:formatNumber value="${su1}" type="number"/><br>
<fmt:formatNumber value="${su1}" type="currency"/><br>
<fmt:formatNumber value="${su2}" pattern="0.00"/><br>
<fmt:formatNumber value="3.2" pattern="0.00"/><br>
<fmt:formatNumber value="3.2" pattern="0.##"/><br>
<fmt:formatNumber value="3" pattern="0.0#"/><br>


</div>
</body>
</html>