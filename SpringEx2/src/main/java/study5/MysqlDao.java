package study5;

import org.springframework.stereotype.Component;

import study4.ShopDto;

//페키지이름이 샵컨텍트2에 들어가야함
@Component //클래스명이 id로 등록이됨(단,첫글자소문자) >빈으로등록됨
public class MysqlDao {
	public void insertShop(ShopDto dto) 
	{
		System.out.println(dto.getSangpum()+""+dto.getPrice()+"원추가");
	}
	
	public void deleteShop(String sang) {
		System.out.println(sang+"상품삭제완료");
	}
}
