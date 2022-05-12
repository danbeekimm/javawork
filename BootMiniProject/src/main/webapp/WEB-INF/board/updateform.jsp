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
   background-image: url("../image/존메이어.jpg");
 background-repeat: no-repeat;
 background-size: cover;
 }
   table.boardform{
      font-family: 'Jua';
      font-size: 1.0em;
   }
   
</style>

</head>
<body style="background-color: white;">
<br>
<c:if test="${sessionScope.loginok==null}">
   <script type="text/javascript">
      alert("다시 로그인 후 글수정을 시도해 주세요");
      location.href='../login/updateform';
   </script>
</c:if>
<form action="update" method="post" enctype="multipart/form-data">
   <!-- hidden 2개 -->
   <input type="hidden" name="currentPage" value="${currentPage}"> <!-- 자기가보던 페이지로가야함으로 -->
   <input type="hidden" name="num" value="${dto.num}"> <!-- 이따 dto로 넘길거라 dto.num -->
   

   <table class="table table-bordered boardform" style="width: 1000px; background-color: white;">
      <caption><b>글수정</b></caption>
         <tr>
            <th style="width: 100px; background-color: #ddd">제 목</th>
            <td>
               <input type="text" name="subject" class="form-control"
               required="required" autofocus="autofocus"
               value="${dto.subject}"
               placeholder="제목을 써주세요">
            </td>
         </tr>
         <tr>
            <th style="width: 100px; background-color: #ddd">사진들</th>
            <td>
            <b>사진을 업로드 하지않으면 기존 사진이 유지됩니다.</b><br>
               <input type="file" name="upload" class="form-control"
               multiple="multiple">
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <textarea style="width: 100%; height: 100px;" name="content"
               class="form-control" required="required">${dto.content}</textarea>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit" class="btn btn-default"
               style="width: 100px;">글수정</button>
               
               <button type="button" class="btn btn-default"
               style="width: 100px;" onclick="history.back()">이전</button><!-- onclick="history.back()":이전페이지로가도록 -->
            </td>
         </tr>
   </table>
</form>
</body>
</html>