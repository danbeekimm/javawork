package study1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//자바방식으로 생성하기
		Hello h1=new Hello();
		System.out.println(h1.getInfo());
		Hello h2=new Hello();
		System.out.println(h2.getInfo());
		System.out.println("**주소비교**");
		System.out.println(h1.hashCode()+":"+h2.hashCode()); 
		//값은 같으나 주소가다르다
		
		System.out.println("**스프링방식**");
		ApplicationContext context= //헬로라는아이디로 열고출력.
				new ClassPathXmlApplicationContext("appContext.xml");
		//getbean은 반환타입이 object임>> 형변환
		Hello h3=(Hello) context.getBean("hello"); //getbean은 형변환해야함
		System.out.println(h3.getInfo());
		//형변환안하고싶을때 클래스불러와주면 가능
		Hello h4=context.getBean("hello",Hello.class);
		System.out.println(h4.getInfo());
		//스프링에서 been으로생성시 주소가 모두같다(singletone)
		//bean 설정시 scope 기본값이 singleton
		System.out.println(h3.hashCode()+":"+h4.hashCode()); 
		//얘는 주소와 값이 가같다
	}

}
