<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap"
   rel="stylesheet">
<style type="text/css">
   body {
   font-size: 1.5rem;
   font-family: 'Gowun Dodum';
   }
</style>

</head>
<body>
<br>
<br>
   <h3 class="alert alert-info" style="width: 700px;">
      총 ${totalCount} 개의 상품이 등록되어있습니다
   </h3>
   <table class="table table-bordered">
      <caption><h3>전체 상품 목록</h3></caption>
      <tr bgcolor="#ddd">
         <th width="60">번호</th>
         <th width="400">상품명</th>
         <th>입고일</th>
      </tr>
      <c:forEach var="dto" items="${list}">
         <tr>
            <td>${no}</td>
            <c:set var="no" value="${no-1}"/>
            <td>
            <!-- 사진이 들어가있는 경우 출력 -->
            <c:if test="${dto.photo !=''}">
            	<img src="../${dto.photo}" width="80" height="80" border="1">
            	&nbsp;&nbsp;
            
            </c:if>
               <a href="detail?num=${dto.num}&currentPage=${currentPage}"
               style="color: black;">${dto.sangpum}</a>
            </td>
            <td>${dto.ipgoday}</td>
         </tr>
      </c:forEach>
   </table>
   
   <div class="paging" style="margin-left: 300px;">
         <ul class="pagination">
         
         <!-- 이전 -->
            <c:if test="${startPage>1}">
               <li><a href="list?currentPage=${startPage-1}">이전</a></li>
            </c:if>

            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
               <c:if test="${pp==currentPage}">
                  <li class="active"><a href="list?currentPage=${pp}">${pp}</a></li>
               </c:if>
               <c:if test="${pp!=currentPage}">
                  <li><a href="list?currentPage=${pp}">${pp}</a></li>
               </c:if>
            </c:forEach>
            
         <!-- 다음 -->
         <c:if test="${endPage<totalPage}">
            <li><a href="list?currentPage=${endPage+1}">다음</a></li>
         </c:if>
         </ul>
      </div>
         <!-- 글쓰기 버튼은 로그인을 해야만 보인다 -->
         <c:if test="${sessionScope.loginok!=null}">
          <button type="button" class="btn btn-success"
          style="width: 100px;" onclick="location.href='form'">
             <span class="glyphicon glyphicon-pencil">글쓰기</span>
          </button>
         </c:if>
   </div>
</body>
</html>