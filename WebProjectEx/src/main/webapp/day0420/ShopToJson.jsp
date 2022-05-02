<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="mysql.data.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="mysql.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//dao에서 list 가져오기
ShopDao dao = new ShopDao();
List<ShopDto> list=dao.getSangpumList();

//json 형태로 변환
JSONArray arr=new JSONArray();
for(ShopDto dto:list)
{
	JSONObject ob=new JSONObject(); //한개로만들거면 오브젝트 여러개면 어래이 형태
	//[{"sangpum":상품}] 이런식으로 들어간거임.
	ob.put("sangpum", dto.getSangpum());
	ob.put("photo", dto.getPhoto());
	ob.put("color", dto.getColor());
	ob.put("price", dto.getPrice());
	ob.put("cnt", dto.getCnt());
	ob.put("ipgoday", dto.getIpgoday());
	ob.put("num", dto.getNum());
	//arr에 추가
	arr.add(ob);
	//[{"sangpum":"한강에 어울리는 원피스","ipgoday":"2022-06-01",
	//"color":"#c3c5ee","price":55000,"num":"6","cnt":1,"photo":"..\/image2\/4.jpg"},
	//{"sangpum":"봄원피스","ipgoday":"2022-06-08","color":"#ededed","price":67700,
	//"num":"5","cnt":1,"photo":"..\/image2\/6.jpg"},{"sangpum":"샤랄라원피스",
	//"ipgoday":"2022-05-07","color":"#cc1946","price":67000,"num":"4","cnt":2,
	//"photo":"..\/image2\/7.jpg"},{"sangpum":"원피스","ipgoday":"2022-03-29","color":"#cc7919",
	//"price":56000,"num":"3","cnt":1,"photo":"..\/image2\/8.jpg"},
	//{"sangpum":"치마","ipgoday":"2022-04-20","color":"#458c31","price":34000,"num":"2","cnt":1,
	//"photo":"..\/image2\/3.jpg"},{"sangpum":"원피스","ipgoday":"2022-04-20","color":"#ffcccc","price":12000,"num":"1","cnt":1,"photo":"..\/image2\/9.jpg"}]
}
%>
<%=arr.toString()%>