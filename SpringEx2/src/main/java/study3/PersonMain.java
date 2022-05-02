package study3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PersonMain {
	
	public static void main(String[] args) {
		ApplicationContext context=
				new ClassPathXmlApplicationContext("myContext.xml");
		Person p1=(Person)context.getBean("person");
		p1.write();
		System.out.println("----------------------");
		Person p2=(Person)context.getBean("person2");
		p2.write();
		//xml 통해서값가져오기
		//application 쓰고 여기와서 찍으면 에러나옴.
		//person3를 인식못해
		System.out.println("----------------------");
		Person p3=(Person)context.getBean("person3"); //메서드명
		p3.write();
	}
}
