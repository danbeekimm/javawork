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
body{
	font-size: 2rem;
	font-family: 'Jua';
}

</style>

</head>
<body> <!-- post방식 -->
	<form action="result" method="post" class="form-inline">
		<table class="table table-bordered" style="width: 400px">
			<caption>
				<b>폼시험</b>
			</caption>
			<tr>
				<th width="100" bgcolor="#ddd">이름</th>
				<td>
					<input type="text" name="name" class="form-control"
					required="required" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ddd">사진</th>
				<td>
					<select name="photo" class="form-control">
						<option value="../image/16.jpg">인형1</option>
						<option value="../image/18.jpg">인형2</option>
						<option value="../image/17.jpg">인형3</option>
						<option value="../image/20.jpg">인형4</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ddd">자바점수</th>
				<td>
					<input type="text" name="java" class="form-control"
					required="required" >
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ddd">스프링점수</th>
				<td>
					<input type="text" name="spring" class="form-control"
					required="required" >
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn bnt-info">전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>