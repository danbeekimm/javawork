package study5;

import org.springframework.stereotype.Component;

import study4.ShopDto;

//��Ű���̸��� ������Ʈ2�� ������
@Component //Ŭ�������� id�� ����̵�(��,ù���ڼҹ���) >�����ε�ϵ�
public class MysqlDao {
	public void insertShop(ShopDto dto) 
	{
		System.out.println(dto.getSangpum()+""+dto.getPrice()+"���߰�");
	}
	
	public void deleteShop(String sang) {
		System.out.println(sang+"��ǰ�����Ϸ�");
	}
}
