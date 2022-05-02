package study1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//�ڹٹ������ �����ϱ�
		Hello h1=new Hello();
		System.out.println(h1.getInfo());
		Hello h2=new Hello();
		System.out.println(h2.getInfo());
		System.out.println("**�ּҺ�**");
		System.out.println(h1.hashCode()+":"+h2.hashCode()); 
		//���� ������ �ּҰ��ٸ���
		
		System.out.println("**���������**");
		ApplicationContext context= //��ζ�¾��̵�� �������.
				new ClassPathXmlApplicationContext("appContext.xml");
		//getbean�� ��ȯŸ���� object��>> ����ȯ
		Hello h3=(Hello) context.getBean("hello"); //getbean�� ����ȯ�ؾ���
		System.out.println(h3.getInfo());
		//����ȯ���ϰ������ Ŭ�����ҷ����ָ� ����
		Hello h4=context.getBean("hello",Hello.class);
		System.out.println(h4.getInfo());
		//���������� been���λ����� �ּҰ� ��ΰ���(singletone)
		//bean ������ scope �⺻���� singleton
		System.out.println(h3.hashCode()+":"+h4.hashCode()); 
		//��� �ּҿ� ���� ������
	}

}
