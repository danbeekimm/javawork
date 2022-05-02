package study5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Component;

import study4.ShopDto;
@Component //기본으로하면 클래스명이 
//@Component("myshop") //myshop이 아이디로 들어감
//그냥 컴포넌트는 클래스명 단 ㅡ어쩌구로 등록되는데 이건 마이샵
public class ShopController {
	//두가지있음
	//@Autowired //같은타입을찾아서 자동주입시키기
	@Resource(name = "mysqlDao")//정확한 id 찾아서 자동주입
	
	
	//MysqlDao가 자동주입된거임
	MysqlDao dao; 
	
	public void add(String sang,int price) {
		ShopDto dto=new ShopDto();
		dto.setSangpum(sang);
		dto.setPrice(price);
		
		dao.insertShop(dto);
	}
	public void delete(String sang) {
		dao.deleteShop(sang);
	}
}
