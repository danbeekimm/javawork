package study5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Component;

import study4.ShopDto;
@Component //�⺻�����ϸ� Ŭ�������� 
//@Component("myshop") //myshop�� ���̵�� ��
//�׳� ������Ʈ�� Ŭ������ �� �Ѿ�¼���� ��ϵǴµ� �̰� ���̼�
public class ShopController {
	//�ΰ�������
	//@Autowired //����Ÿ����ã�Ƽ� �ڵ����Խ�Ű��
	@Resource(name = "mysqlDao")//��Ȯ�� id ã�Ƽ� �ڵ�����
	
	
	//MysqlDao�� �ڵ����ԵȰ���
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
