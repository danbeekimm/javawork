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
body{
  background-image: url("../image/제목_없는_아트워크_1.png");
 background-repeat: no-repeat;
 background-size: cover;
 }
   table.boardform{
      font-family: 'Jua';
      font-size: 1.3em;
   }
   
</style>

</head>
<body>
<c:if test="${sessionScope.loginok==null}">
   <script type="text/javascript">
      alert("다시 로그인 후 글쓰기를 시도해 주세요");
      location.href='../login/form'
   </script>
</c:if>
<form action="insert" method="post" enctype="multipart/form-data">
   <!-- hidden 5개 -->
   <input type="hidden" name="currentPage" value="${currentPage}">
   <input type="hidden" name="num" value="${num}">
   <input type="hidden" name="reg" value="${reg}">
   <input type="hidden" name="restep" value="${restep}">
   <input type="hidden" name="relevel" value="${relevel}">

   <table class="table table-bordered boardform" style="width: 500px">
      <caption><b>${num==0?"글쓰기":"답글쓰기"}</b></caption>
         <tr>
            <th style="width: 100px; background-color: #ddd">제 목</th>
            <td>
               <input type="text" name="subject" class="form-control"
               required="required" autofocus="autofocus"
               placeholder="제목을 써주세요">
            </td>
         </tr>
         <tr>
            <th style="width: 100px; background-color: #ddd">사진들</th>
            <td>
               <input type="file" name="upload" class="form-control"
               multiple="multiple">
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <textarea style="width: 100%; height: 100px;" name="content"
               class="form-control" required="required"></textarea>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit" class="btn btn-default"
               style="width: 100px;">글저장</button>
            </td>
         </tr>
   </table>
</form>
</body>
</html>