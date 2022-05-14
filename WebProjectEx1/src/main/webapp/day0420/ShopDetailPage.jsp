<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%
String num = request.getParameter("num");
%>
<style type="text/css">
div.detail {
	margin-top: 100px;
	margin-left: 200px;
	font-size: 25px;
	font-family: 'Jua';
}
</style>
<script type="text/javascript">
	$(function() {
		init(); //처음 시작시 dto 데이터 넣어주기

		//메인페이지로 가는 이벤트
		$("#btnmain").click(function() {
			history.back(); //이전 페이지로 이동
		});

		//삭제
		$("#btndelete").click(function() {

			var ans = confirm("삭제하려면 [확인] 버튼을 눌러주세요");
			if (ans) {
				$.ajax({
					type : "get",
					dataType : "html",
					url : "delete.jsp",
					data : {
						"num" : $("#num").val()
					},
					success : function() {
						//ShopJson.html 로 이동
						location.href = "ShopJson.html";
					}
				});
			}
		});
		
		//수정버튼 (맨 아래 수정 modal)
		$("#btnupdate").click(function(){
			$("#myModal").modal();
			
		});
	});

	function init() {
		$.ajax({
			type : "get",
			dataType : "json",
			url : "DetailJson.jsp",
			data : {
				"num" : $("#num").val()
			},
			success : function(data) {
				$("#photo").attr("src", data.photo);
				$("#photo").css("border", "4px solid gray");
				$("#sangpum").text(data.sangpum);
				$("#price").text(data.sangpum + "원");
				$("#color").text(data.color);
				$("#color").css({
					"background-color" : data.color,
					"float" : "right"
				});
				$("#cnt").text(data.cnt + "개");
				$("#ipgoday").text(data.ipgoday);
			}
		});
	}
</script>
</head>
<body>
	<input type="hidden" id="num" value="<%=num%>">
	<div class="detail">
		<table class="table table-bordered" style="width: 600px;">
			<caption>
				<h1>상품 상세 페이지</h1>
			</caption>
			<tr>
				<td width="300"><img src="" width="300" height="400" id="photo">
				</td>
				<td>
					<h2>
						상품명 : <span id="sangpum"></span>
					</h2>
					<h2>
						색 상 :
						<div id="color"></div>
					</h2>
					<h2>
						가 격 : <span id="price"></span>
					</h2>
					<h2>
						수 량 : <span id="cnt"></span>
					</h2>
					<h2>
						입고일 : <span id="ipgoday"></span>
					</h2>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-success" style="width: 120px;"
						id="btnmain">메인</button>

					<button type="button" class="btn btn-info" style="width: 120px;"
						id="btnupdate" num=<%=num%>>수정</button>

					<button type="button" class="btn btn-danger" style="width: 120px;"
						id="btndelete" num=<%=num%>>삭제</button>
				</td>
		</table>
	</div>
	
	 <!-- 수정 다이얼로그 Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상품 수정</h4>
        </div>
        <div class="modal-body">
        
        <!-- Modal Body 부분에 수정폼 넣기 -->
          <p><form action="#" id="ufrm" class="form-inline">
          <input type="hidden" id="unum" value="<%=num%>">
			<table class="table table-bordered" style="width: 400px;">
				<tr>
					<th bgcolor="pink" style="width: 100px;">상품명</th>
					<td><input type="text" id="usangpum" name="usangpum"
						class="form-control"></td>
				</tr>
				<tr>
					<th bgcolor="pink" style="width: 100px;">상품사진</th>
					<td><select id="uphoto" name="uphoto" class="form-control"
						style="width: 120px;">
							<script type="text/javascript">
								var data = [ "라운트티", "블랙원피스", "화이트원피스",
										"도트원피스", "블랙조끼", "꽃무늬원피스", "프릴원피스",
										"반팔원피스", "레이스원피스", "블랙코트", "체크쿠션" ];
								var s = "";
								for (i = 1; i <= 10; i++) {
									s += "<option value='../image2/" + (i + 1) //11.jpg
											+ ".jpg'>" + data[i] + "</option>";
								}
								document.write(s);
							</script>
					</select> <img src="" id="umyphoto" width="60" height="60"> 
					
					<script>
						$("#umyphoto").attr("src", $("#photo").val()); //1번째 사진 넣기
						//변경시 이벤트
						$("#uphoto").change(function() {
							$("#umyphoto").attr("src", $(this).val());
						});
					</script>
					</td>
				</tr>
				<tr>
					<th bgcolor="pink" style="width: 100px;">색상</th>
					<td><input type="color" id="ucolor" name="ucolor"
						class="form-control" value="#ffcccc" style="width:80px;">
						</td>
				</tr>
				<tr>
					<th bgcolor="pink" style="width: 100px;">단가</th>
					<td><input type="text" id="uprice" name="uprice"
						class="form-control">
						</td>
				</tr>
				
				<tr>
					<th bgcolor="pink" style="width: 100px;">수량</th>
					<td><input type="number" id="cnt" name="cnt"
						class="form-control" min="1" max="5" value="1">
						</td>
				</tr>
				
				<tr>
					<th bgcolor="pink" style="width: 100px;">입고일</th>
					<td><input type="date" id="ipgoday" name="ipgoday"
						class="form-control" value="2022-04-20">
						</td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<button type="button" class="btn btn-info"
				style="width: 130px;" id="ubtnupdate" data-dismiss="modal">DB수정</button>
				</td>
				
			</table>
		</form></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
</body>
</html>