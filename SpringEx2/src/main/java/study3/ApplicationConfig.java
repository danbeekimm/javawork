package study3;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
//자바에서만들엇는데 빈으로 인식해야해야함.

@Configuration//스프링설정에 사용되는 클래스라는 의미
//이거위에꺼쓰려면 mycontext 맨밑에 처럼써줘야함.
@Component//xml 에 자동으로 bean 등록해준다.
public class ApplicationConfig {//app 애도 빈으로인식해야함
	@Bean //빈이라는 테그줫듯이 얘도 빈으로인식
	public Person person3() //메서드명이 id로인식
	{ 
		List<String> hobby=new ArrayList<String>();
		hobby.add("노래하기");
		hobby.add("춤추기");
		hobby.add("돌아다니기");
		Person p=new Person(hobby);
		p.setAddress("미국LA");
		return p;
	}
}
