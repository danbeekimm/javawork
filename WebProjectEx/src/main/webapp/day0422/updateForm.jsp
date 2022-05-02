<%@page import="mysql.data.GuestDto"%>
<%@page import="mysql.data.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	img.imgphoto{
		width: 55px;
		height: 55px;
		margin-right: 3px;
		cursor: pointer;
	}
	
	.select{
		border: 2px solid black;
		box-shadow: 3px 3px 3px gray;
	}
	
	.table{
		width:500px;
		border: 1px solid black;
		font-family: 'Jua';
		font-size: 20px;
	}

	.captione{
		align:center;
		font-size: '20px';
		font-family: 'Jua';
</style>
<script type="text/javascript">
$(function (){
	$(".btnupdate").click(function(){
		var fdata=$("#frm").serialize();
		$.ajax({
			type:"post",
			dataType:"html",
			data:fdata,
			url:"update.jsp",
			success:function(){
				//수정성공시 메인페이지로 이동
				location.href="GuestMain.jsp";
			}
		});
	});
	
});

</script>
</head>
<%
String num=request.getParameter("num");
//num에 해당하는 dto 받기
GuestDao dao=new GuestDao();
GuestDto dto=dao.getData(num);

%> 
<body>
			<form id="frm" class="form-inline">
			<caption  align="center"  id="captione"><b>수정폼</b></caption>
			<input type="hidden" id="num" name="num" value="<%=num %>">
				<table class="table">
					<tr>
						<td width="350">작성자:<input type="text" id="writer"
							name="writer" class="form-control" style="width: 100px;" value="<%=dto.getWriter()%>">
							
						</td>

						<td rowspan="3" style="cursor: pointer; background-color: orange;"
							align="center" valign="middle" class="btnupdate">수정</td>
					</tr>
					<tr>
						<td>
						<textarea id="content" name="content"
								style="width: 100%; height: 80px;"><%=dto.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<td>
						<input type="hidden" id="avata" name="avata" value="<%=dto.getAvata()%>"><br>
							<%
							for (int i=1; i <= 10; i++) {%> 
								<img src="../avata/s<%=i%>.JPG" class="imgphoto" idx="<%=i%>">
							<%
								if(i==5){%>
									<br>
									<%} 
								}
							%>
							<script type="text/javascript">
							//db 에 저장된이미지에 .select 적용
							var avata=$("#avata").val();
							$("img").eq(avata-1).addClass("select");
							//0부터라
							
							//클릭한 이미지에만 .select 가 적용되도록하기
							$("img.imgphoto").click(function () {
								$(this).siblings().removeClass("select"); //나의 형제들 셀렉트 클래스지우고
								$(this).addClass("select"); //내꺼 추가
								$("#avata").val($(this).attr("idx"));
								
							});
							</script>
						</td>
					</tr>
				</table>
			</form>
</body>
</html>