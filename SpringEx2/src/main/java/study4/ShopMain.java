package study4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class ShopMain {

	public static void main(String[] args) {
		ApplicationContext context=
				new ClassPathXmlApplicationContext("shopContext.xml");
		
		ShopController shop1=(ShopController)context.getBean("myshop");
		shop1.add("????", 1000);
		shop1.add("??????", 2300);
		shop1.delete("??????");
		
	}
}
