<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style>
body {
	font-size: 2rem;
	font-family: 'Jua';
	text-align: left;
	overflow: hidden;
	float: left;
	
}


</style>

</head>
<body>
	<br>
	<br>
	<div style="width: 600px;">
		<b style="font-size: 30px;float: left;">${dto.sangpum}</b> 
		<br>
		<span class="day" style="float: right; overflow: hidden;">입고일 : ${dto.ipgoday}</span>
		<br>
		<br> 
		<b style="font-size: 20px;float: left; overflow: hidden;">단가 : 
		<fmt:formatNumber
				value="${dto.price}" type="currency"/>
				</b> 
		<b style="float: right; font-size: 14px;">${dto.color}</b>
		<div class="box" style="background-color: ${dto.color}"></div>
		<hr style="clear: both; height: 3px; background-color: gray;">${dto.content}<br>
		<br>

		<button type="button" class="btn btn-default" 
			onclick="location.href='list?currentPage=${currentPage}'">상품목록</button>
		<button type="button" class="btn btn-default delete" id="btn"
			onclick="" >상품삭제</button>

	</div>
<script type="text/javascript">

		
		$("#btn").click(function(){
		     var ok = confirm("삭제를 원하시면 [확인]을 눌러주세요");
		     var del = "delete?num=${dto.num}&currentPage=${currentPage}"
		     if(ok){
		     location.assign(del);
		     alert("삭제되었습니다.");
		     };
		     });
</script>


</body>
</html>