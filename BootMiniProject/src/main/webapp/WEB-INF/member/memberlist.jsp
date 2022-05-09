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
 background-image: url("../image/wallpaperbetter.jpg");
 background-repeat: no-repeat;
 background-size: cover;
 }
</style>
<script type="text/javascript">
	$(function() {
		$("#allcheck").click(function () {
			var chk=$(this).is(":checked");//체크상태확인
			console.log(chk);
			if(chk){
				$(".del").prop("checked",true);//속성변경 트루펄스일경우 prop사용
				
			}else{
				$(".del").prop("checked",false);
			}
		});
		//DELETE버튼
		$("#btnmemberdel").click(function () {
			//체크한인원수구하기
			var len=$(".del:checked").length;
			//0명일경우 먼저삭제할회원을 선택해주세요
			if (len==0) {
				alert("먼저삭제할 회원을 선택해주세요");
				return;
			}
			//체크한곳의 num가져오기
			var nums="";
			$(".del:checked").each(function (i,element) {
				var num=$(this).attr("num");
				nums+=num+",";
			});
			//마지막컴마제거
			nums=nums.substring(0,nums.length-1);
			//alert(nums);
			$.ajax({
				type:"get",
				dataType:"text",
				data:{"nums":nums},
				url:"delete",
				success:function(data){
					alert("삭제되었습니다");
					location.reload();
				}
			});
		});
		
	});


</script>
</head>
<body>
<button type="button" class="btn btn-info"
   style="width: 150px;" onclick="location.href='form'">회원가입</button>
   <hr>
   <h2>총 ${totalCount} 명의 회원이 있습니다</h2>
</body>
<hr>
<table class="table table-bordered" style="width: 700px; color:black;">
   <caption><b>전체 회원 명단</b></caption>
   <tr style="background-color: #a9a9a9;">
      <th style="width: 70px">번호</th>
      <th style="width: 100px">이름</th>
      <th style="width: 100px">아이디</th>
      <th style="width: 200px">핸드폰</th>
      <th style="width: 450px">주소</th>
      <th style="width: 100px">
      <input type="checkbox" id="allcheck">삭제</th>
   </tr>

   <c:forEach var="dto" items="${list}" varStatus="i">
      <tr style="background-color: white;">
         <td>${i.count}</td>
         <td>${dto.name}</td>
         <td>${dto.id}</td>
         <td>${dto.hp}</td>
         <td>${dto.addr}</td>
         <td>
            <input type="checkbox" class="del" num="${dto.num}">
         </td>
      </tr>
   </c:forEach>
</table>
<button type="button" class="btn btn-danger btn-sm"
style="margin-left: 640px;" id="btnmemberdel">Delete</button>


</html>