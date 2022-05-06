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
<link
   href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap"
   rel="stylesheet">

<!-- add menu -->
<c:set var="root" value="<%=request.getContextPath()%>" />

<style type="text/css">
body {
   font-size: 2rem;
   font-family: 'Jua';
}

ul.menu {
   list-style: none;
}

ul.menu li {
   width: 130px;
   float: left;
   border: 1px solid black;
   height: 60px;
   line-height: 60px;
   margin-right: 10px;
   text-align: center;
   font-size: 22px;
   font-family: 'Jua';
   background-color: #FFFACD;
   cursor: pointer;
}

ul.menu li.select1 {
   background-color: #db7093;
   color: #FFFACD;

ul.menu li a {
   color: gray;
   text-decoration: none;
}
</style>

<script type="text/javascript">
   $(function(){
      $("ul.menu li a").mouseover(function(e){
         $(this).parent().siblings().removeClass("select1");
         $(this).parent().addClass("select1");
      });
   });
</script>


</head>

<body>
   <ul class="menu">
      <li><span class="glyphicon glyphicon-home"></span> <a
         href="${root}/"><b>Home</b></a></li>
      <li><a href="${root}/shop/form"><b>상품등록</b></a></li>
      <li><a href="${root}/board/list"><b>게시판</b></a></li>
      <li><a href="${root}/member/list"><b>회원가입</b></a></li>
      <li><a href="${root}/load/map"><b>오시는길</b></a></li>
   </ul>
</body>
</html>