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
*{

 font-family: 'Jua';

 }
 span.heart{
 	cursor: pointer;
 	font-size: 20px;
 }
 td.asave{
 	text-align: center;
 	cursor: pointer;
 	font-weight: bold;
 	background-color: #ddd;
 }
 #afrm{
 	margin-top: 20px;
 }
 table.t{
 	margin-left: 20px;
 }
 pre.m{
 	background-color: white;
 	border: none;
 	font-size: 13px;
 	font-family: 'Gamja Flower';
 	
 }
 span.day{
 	float: right;
 	color: gray;
 	font-size: 12px;
 	
 }
 span.adel{
 	margin-left: 10px;
 	color: red;
 	cursor: pointer;
 }
</style>

<script type="text/javascript">


$(function () {
	   //처음 로딩 시 댓글 출력
	   list();
	   
	   //댓글 삭제 이벤트
	   $(document).on("click","span.adel",function(){
	      //idx 얻기
	      var idx=$(this).attr("idx");
	      //confim - true 일 경우 ajax 함수를 통해서
	      //댓글 삭제 후 목록 다시 출력
	      var ans=confirm("삭제하려면 [확인]을 눌러주세요");
	      if(ans){
	         $.ajax({
	            type:"get",
	            dataType: "text",
	            data:{"idx":idx},
	            url:"../answer/delete",
	            success:function(){
	               list();   
	            }
	         });
	      }
	   });
	//댓글 저장이벤트
	$("td.asave").click(function() {
		//전체 폼 데이타 읽기
		var data=$("#afrm").serialize();
		//alert(data); //number 이름 messege등 나오는지확인
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../answer/insert",
			data:data,
			success:function(){
				list();
				$("#message").val("");
			}
		
		});
	});
	
	$("span.heart").click(function () {
		var num=$(this).attr("num");
		var c=$(this).attr("class");
		var chu;
		if(c=="glyphicon glyphicon-heart-empty heart"){
			chu=1;
			$(this).attr("class","glyphicon glyphicon-heart heart");
		}else{
			chu=0;
			$(this).attr("class","glyphicon glyphicon-heart-empty heart");
		}
		console.log(num,chu);
		$.ajax({
			type:"get",
			dataType:"json",
			url:"chu",
			data:{"num":num,"chu":chu},
			success:function(data){
				$("span.totalchu").text(data.totalchu);
			}
		});
	});
	
});


</script>
</head>
<body>
<br>
	<div class="content" style="width: 800px; text-align: left; background-color: white;" >
		<h1>
			<b>${dto.subject}</b>
		</h1>
		<span class="glyphicon glyphicon-user"></span>&nbsp;<b>${dto.name}</b>
		&nbsp;&nbsp; <span style="color: gray;"> 
		<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" />
		</span> 
		<span style="float: right;color: gray;"><b>조회&nbsp;${dto.readcount }&nbsp;<br></b></span>
		<br> <br>
		<pre style="background-color: #d3bc99; border: none;">
			<b>${dto.content}</b>
		</pre>
		<br>
		<br>
		<c:if test="${dto.photos!='no'}">
			<c:forTokens var="photo" items="${dto.photos}" delims=",">
			<a href="../save/${photo}" target="_new" style="cursor: pointer;">
				<img src="../save/${photo}" style="max-width: 300px;"
					border="1px soild black;"></a>
				<c:if test="${n.count%2==0 }">
					<br>
					<br>
				</c:if>

			</c:forTokens>
		</c:if>
		<br> <br>
		<div class="likes">
		<span class="glyphicon glyphicon-heart-empty heart" style="color: red;"num=${dto.num} ></span>
		&nbsp;
		<span class="totalchu">${dto.totalchu }</span>
			<script type="text/javascript">
			if (${dto.chu==0}) {
				$("span.heart").attr("class","glyphicon glyphicon-heart-empty heart");
			}else{
				$("span.heart").attr("class","glyphicon glyphicon-heart heart");
				
			}
			</script>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-comment" ></span>
			&nbsp;&nbsp;<span class="answercnt">0</span>
			
			<!-- 댓글부분 -->
			<h5 class="alist" style="cursor: pointer;"><b>댓글</b></h5>
			<div class="alist">댓글목록 나올 곳</div>
			<script type="text/javascript">
				$("h5.alist").click(function() {
					$("div.alist").slideToggle('fast');
				});
			
			</script>
			<!-- 로그인한사람만 댓글달수있음 -->
			<c:if test="${sessionScope.loginok!=null}">
			<form id="afrm">
			<!-- hidden -->
			<input type="hidden" name="num" value="${dto.num}"> <!-- id는 컨트롤러에서줄거임 -->
			<input type="hidden" name="id" value="${sessionScope.loginid}"> 
			<input type="hidden" name="name" value="${sessionScope.loginname}"> 
			
			<table style="width: 600px;" class="table table-bordered">
				<tr height="70">
					<td>
						<textarea style="width: 100%;height: 70px;"
						name="message" id="message"
						class="form-control"
						placeholder="댓글을 남겨주세요"></textarea>
					</td>
					<td class="asave" >
						저장
					</td>
				</tr>
			</table>
			</form>
			</c:if>
		</div>
		<br><br>
		<div class="buttons" style="text-align: center;">
			<button type="button" class="btn btn-default"
				onclick="location.href='list?currentPage=${currentPage}'">
				<span class="glyphicon glyphicon-th-list"></span>목록
			</button>
			
			<button type="button" class="btn btn-default"
				onclick="location.href='form?num=${dto.num}&reg=${dto.reg}&restep=${dto.restep }&relevel=${dto.relevel }&currentpage=${currentpage}'">
				<span class="glyphicon glyphicon-pencil"></span>답글
			</button>

			<c:if test="${sessionScope.loginok!=null}">
				<c:if test="${sessionScope.loginid==dto.id}">
					<button type="button" class="btn btn-default"
						onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">
						<span class="glyphicon glyphicon-edit"></span>수정
					</button>

					<button type="button" class="btn btn-default"
						onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">
						<span class="glyphicon glyphicon-trash"></span>삭제
						
					</button>
				</c:if>
			</c:if>


		</div>
	</div>
</body>
</html>