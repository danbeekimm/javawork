<%@page import="mysql.data.ShopDao"%>
<%@page import="mysql.data.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이타읽기 html에서 제이쿼리로 받은 데이터 읽는거임.
String sangpum=request.getParameter("sangpum");
String color=request.getParameter("color");
String ipgoday=request.getParameter("ipgoday");
String photo=request.getParameter("photo");
int cnt=Integer.parseInt(request.getParameter("cnt"));
int price;
try{ //런파일익셉션임. 잘못입력하면 넘버포멧이 발생됨.
	price=Integer.parseInt(request.getParameter("price")); //스트링으로줘야함 넘버로주면 익셉션그래서 넘버포맨익셉션함
}catch(NumberFormatException e){
	//오류 안나게 하고 0으로 바꾸고싶을때 사용해서쓰기
	price=0;
}

//dto에 넣기
ShopDto dto=new ShopDto(); //묶는 용도가 dto
dto.setSangpum(sangpum);
dto.setColor(color);
dto.setPhoto(photo);
dto.setPrice(price);
dto.setCnt(cnt);
dto.setIpgoday(ipgoday);

//dao선언
ShopDao dao=new ShopDao();


//insert 메서드호출
dao.shopInsert(dto);

%>