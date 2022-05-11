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

 font-size: 0.2rem;
 font-family: 'Jua';
 
 height: 100px;
 background-color: #dcaca9;
 }
 img{
 width: 100px;
 height: 60px;
 position: relative;
 right: 200px;
 left: 3px;
 }
 .b{
 text-align: center;
 position: absolute;
 bottom: 30px;
 }


div.login{
	position: absolute;
	left: 600px;
	top: 30px;
	width: 200px;
	
	}

</style>

</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
   <a href="/">
   <b>
   <b style="float: right; background-color: #dcaca9; width: 800px; height: 160px;  text-align: center;"><img src="${root}/image/love.png" >SpringBoot+Tiles+Mybatis Project</b>
   </b></a>
   <div class="login">
      <c:if test="${sessionScope.loginok==null}">
         <button type="button" class="btn btn-success" style="width: 100px;" 
            onclick="location.href='${root}/login/form'">Login</button>
      </c:if>               <!-- location.href=""의 좌표는 절대좌표로 고정시키기..이유는..뭐 바뀔 수 있어서..?? -->
      
      <c:if test="${sessionScope.loginok!=null}">   
       
         <b>${sessionScope.loginname}(${sessionScope.loginid}) 님</b>
         &nbsp;&nbsp;
         <button type="button" class="btn btn-info" style="width: 100px;" 
            onclick="logout()">Logout</button>
      </c:if>
   </div>
   <script type="text/javascript">
   function logout() {
	   $.ajax({
		   type:"get",
		   dataType:"text",
		   url:"${root}/login/logout",
		   success:function(){
			   location.reload();
		   }
	   });
	
}
   
   </script>
</body>

</html>