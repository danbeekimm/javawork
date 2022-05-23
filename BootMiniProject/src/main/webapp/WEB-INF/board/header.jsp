<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta charset="UTF-8">
<title>모두의 밥상</title>


<style>
body * {
	font-size: 15px;
	margin: 0px;
	padding: 0px;
}

.heshi {
	position: absolute;
	right: 5%;
	top: 130px;
	font-size: 20px;
}

.search {
	position: absolute;
	top: 150px;
	left: 550px;
}

ul.menu {
	list-style: none;
	text-align: center;
}

a:visited {
	color: black;
	text-decoration: none;
}

ul.menu {
	margin-bottom: 30px;
	padding-left: 380px;

}



ul.menu li {
	width: 130px;
	float: left;
	height: 30px;
	line-height: 30px;
	margin-right: 10px;
	text-align: center;
	cursor: pointer;
	font-family: 'Hahmlet';
	font-size: 13px;
	font-weight: bold;
	
}
ul.menu li:hover{
	background-color: white;
	
}

input {
	background: transparent;
	font-size: 28px;
	color: #333;
	font-weight: bold;
	border: 2px solid #888;
	border-width: 0 0 2px 0;
	padding: 10px 30px 18px;
	width: 600px;
}
    ul, ol, li { list-style:none; margin:0; padding:0; }
   
    ul.myMenu {}
    ul.myMenu > li { display:inline-block; width:80px; padding:5px 10px; background:#eee; text-align:center; position:relative; }
    ul.myMenu > li ul.submenu { /* display:none;*/ position:absolute; top:30px; left:0; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:80px; padding:5px 10px; background:#eee; text-align:center; }
</style>
</head>
<script type="text/javascript">
$(function () {
	
});
</script>
<body>
	<header class="header">
		<div class="header" id="header" >
			<!-- 로고 및 검색창 -->
			<div class="header_logo" style="margin-left: 50px;">
				<a href="../"><img alt="모두의 밥상" src="../img/logo.png"
					style="width: 300px; height: 300px; "> </a>
				<div class="search" style="font-size: 2rem;">
					<input type="text" name="s_value" id="s_value" value="검색어를 입력해주세요"
						maxlength="30" placeholder="" title="검색어를 입력해주세요.">&nbsp;&nbsp;&nbsp;
					<img src="../img/se.png" style="width: 65px; height: 65px;"></img>
				</div>

			</div>


			<!-- hash태그 -->
			<div class="heshi" style="color: black;">
				<a href="#"
					onclick="document.topfrm.s_value.value='라면';document.topfrm.submit();">#라면</a>
				<br>
				<a href="#"
					onclick="document.topfrm.s_value.value='김치찌개';document.topfrm.submit();">#김치찌개</a>
				<br>
				<a href="#"
					onclick="document.topfrm.s_value.value='오뎅탕';document.topfrm.submit();">#오뎅탕</a>
			</div>
		</div>
		
		<ul class="myMenu">
    <li class="menu1">메뉴 1</li>
    <li class="menu2">
        메뉴 2
        <ul class="menu2_s submenu">
            <li>메뉴 2-1</li>
            <li>메뉴 2-2</li>
            <li>메뉴 2-3</li>
        </ul>   
    </li>
    <li class="menu3">
        메뉴 3
        <ul class="menu3_s submenu">
            <li>메뉴 3-1</li>
            <li>메뉴 3-2</li>
            <li>메뉴 3-3</li>
        </ul>   
    </li>
    <li class="menu4">메뉴 4</li>
    <li class="menu5">메뉴 5</li>   
</ul>
	
	

		
	</header>
</body>
</html>