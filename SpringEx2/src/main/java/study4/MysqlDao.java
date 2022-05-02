package study4;

public class MysqlDao {
	public void insertShop(ShopDto dto) 
	{
		System.out.println(dto.getSangpum()+""+dto.getPrice()+"원추가");
	}
	
	public void deleteShop(String sang) {
		System.out.println(sang+"상품삭제완료");
	}
}
