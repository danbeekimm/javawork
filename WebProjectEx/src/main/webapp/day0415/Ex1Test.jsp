<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%--지시자 공부
<%@ page 속성 ="값"%>
속성에 들어갈 항목
language="java" : 언어결정
extends="javax.servlet.HttpJspBase": 상위 클래스설정,<상속받기위해> , 기본적으로 되어있음
import="java.util.Calender" : 자바클래스 가져다 사용시
session="false": 세션사용
buffer ="none" (:버퍼차있으면 에러) or "true" (:버퍼자동비우기)
autoFlush="false" : 버퍼차있으면 에러낼지 비울지 결정
isThreadSafe="true" : 각페이지 스레드가 안전하게 동작, 한개씩 순서대로
info="JSP페이지에 대한정보" : JSP에 대한 설명기록
errorPage="error.jsp" : 에러발생시 보여줄 에러페이지 설정
isErrorPage : 현재 페이지가 에러인지 아닌지 설정
contentType="text/html; charset=UTF-8"  : 인코딩 한글출력문제 해결방식
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	/*css영역*/
</style>
<script type="text/javascript">
	//js,jquery 영역
	$(function(){
		
	});
</script>
</head>
<body>
	
	<%!  //선언문: 서블릿으로 변환시 맴버변수등극 쓸때 사용 맨위배정,, 전역변수설정
	String msg="Happy day!!"; 
	%>
	
	<%//scriptlet, 자바영역 - 기호안에다 주면돼 서블릿으로 변환시 지역변수로 등록
	String msg2="안녕하세요";
	%>
	
	<!-- 출력은 표현식으로 출력 
	//sevvlet :자바의 클래스형태,/jsp :html 5 형태 둘다 모든게가능하지만 자바코드쓰긴불편해
	//jsp는 일단 서블릿으로 바뀌고 변환 -->
	
	<%--jsp주석:소스보기에서 안보임 비실행문이됨, 잘못된코드도 비실행돼--%>
	<!-- 출력은 표현식으로 출력: 소스보기에서보임-->
	<%-- : 주석
	<% %> : 자바코드기술
	<%! %>:변수,메소드 선언
	<%=%>:계산식, 함수호출결과를 문자열 형태로 출력
	<%@ %> : jsp 페이지 속성지정
 --%>
	<%=msg%><br>
	<%=msg2%><br>
	
	<%
		String []str={"red","orange","blue","pink","cyan","magenta"};
	%>
	<table class="table table-bordered" style="width: 200px;">
	<%
	for(String s:str){%>
		<tr>
		<th><%=s%></th>
		<td bgcolor="<%=s%>">color</td>
		</tr>
	<% }
	%>
	</table>
</body>


</html>