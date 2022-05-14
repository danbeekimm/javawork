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
 background-image: url("../image/존메이어.jpg");
 background-repeat: no-repeat;
 background-size: 100%;

 }
 div.reboard{
 	font-family: 'Jua';
 	}
</style>
</head>
<body>
<br>
<div class="reboard"  >
	<h3>[총 ${totalCount} 개의 글이 있습니다]</h3>
	<table class="table table-bordered" style="width: 800px; margin-left: 130px; background-color: #dcaca9;  text-align: left;">
		<caption><b>답변형게시판</b></caption>
		<tr style="background-color: #dcaca9">
			<th style="width: 50px">번호</th> 
			<th style="width: 400px">제목</th> 
			<th style="width: 70px">작성자</th> 
			<th style="width: 150px">작성일</th> 
			<th style="width: 50px">조회</th> 
			<th style="width: 50px">추천</th> 
			</tr>
		<c:if test="${totalCount==0}"> 
			<tr style="background-color: white;">
				<td colspan="6" align="center">
					<b>등록된 글이 없습니다</b>
				</td>
			</tr>
		</c:if>

			<c:if test="${totalCount>0}">
				<c:forEach var="dto" items="${list}">
					<tr style="background-color: white;">
						<td>${no}</td>
						<c:set var="no" value="${no-1}" />
						<!-- 제목 -->
						<td>
							<!-- 답글인경우만 해당 --> <c:if test="${dto.relevel>0 }">
								<!-- level 1당 빈칸3개 -->
								<c:forEach begin="1" end="${dto.relevel}">
								&nbsp;&nbsp;
							</c:forEach>
								<img src="../image/re.png" style="width: 20px; height: 20px;">
							</c:if> <!-- 제목출력 content는 목록갓다가 다시올때 그대로 13페이지에있어야함--> <a
							href="content?num=${dto.num}&currentPage=${currentPage}">
								${dto.subject} </a> &nbsp; <c:if test="${dto.photos!='no' }">
								<span class="glyphicon glyphicon-picture"
									style="color: gray; font-size: 0.8em;"></span>
							</c:if> <!-- 댓글개수출력 --> <c:if test="${dto.acount>0}">
								<a
									href="content?num=${dto.num}&currentPage=${currentPage}#alist"
									style="color: red;">[${dto.num}] </a>
							</c:if>

						</td>

						<td>${dto.name}</td>
						<td><fmt:formatDate value="${dto.writeday}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.readcount}</td>
						<td>${dto.totalchu}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="paging" >
			<ul class="pagination">
			<!-- 이전 -->
			
				<c:if test="${startPage>1}">
						<li><a href="list?currentPage=${startPage-1}">이전</a></li>
					</c:if>
					
					
				<c:forEach var="pp" begin="${startPage}" end="${endPage}"> <!-- 1,2.3,4,....가 pp로넘어옴 -->
					<c:if test="${pp==currentPage}">
						<li class="active"><a href="list?currentPage=${pp}">${pp}</a></li>
						
					</c:if>  
					
					
					<c:if test="${pp!=currentPage}">
						<li><a href="list?currentPage=${pp}">${pp}</a></li>
						
					</c:if>  
				
				</c:forEach>
				
			<!-- 이후 -->
				
					<c:if test="${endPage<totalPage}">
						<li><a href="list?currentPage=${endPage+1}">다음</a></li>
					</c:if>
			
			</ul>
		</div>
		<!-- 글쓰기버튼은로그인해야보인다 -->
		<c:if test="${sessionScope.loginok!=null}">
			<button type="button" class="btn btn-success" style="width: 100px;"
				onclick="location.href='form'"> <!-- 버튼누르면 form이동 -->
				<span class="	glyphicon glyphicon-pencil"></span>&nbsp;글쓰기
			</button>
		</c:if>

	</div>
</body>
</html>