package study3;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
//�ڹٿ���������µ� ������ �ν��ؾ��ؾ���.

@Configuration//������������ ���Ǵ� Ŭ������� �ǹ�
//�̰������������� mycontext �ǹؿ� ó���������.
@Component//xml �� �ڵ����� bean ������ش�.
public class ApplicationConfig {//app �ֵ� �������ν��ؾ���
	@Bean //���̶�� �ױעZ���� �굵 �������ν�
	public Person person3() //�޼������ id���ν�
	{ 
		List<String> hobby=new ArrayList<String>();
		hobby.add("�뷡�ϱ�");
		hobby.add("���߱�");
		hobby.add("���ƴٴϱ�");
		Person p=new Person(hobby);
		p.setAddress("�̱�LA");
		return p;
	}
}
