package study5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		ApplicationContext context=
				new ClassPathXmlApplicationContext("shopContext2.xml");
		
		//ShopController shop1=(ShopController)context.getBean("myshop");
		ShopController shop1=(ShopController)context.getBean("shopController");
		shop1.add("키위", 4000);
		shop1.add("딸기", 3400);
		shop1.delete("수박");
		
	}
}
