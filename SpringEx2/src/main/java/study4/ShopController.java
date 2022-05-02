package study4;

public class ShopController {
	MysqlDao dao;
	
	public ShopController(MysqlDao dao) {//생성자주입로 dao가 >빈으로 설정
		this.dao=dao;
	}
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
