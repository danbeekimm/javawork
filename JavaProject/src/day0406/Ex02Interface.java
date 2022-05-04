package day0406;

import java.util.Vector;

interface Apple {
	public void process1();
}
interface Banana {
	public void process2();
}
// 두 개의 인터페이스를 모두 구현하는 클래스
class My2 implements Apple, Banana {
	
	public void show() {
		System.out.println("My2만이 가진 메서드");
	}

	@Override
	public void process2() {
		System.out.println("Banana 기능 구현");
		
	}

	@Override
	public void process1() {
		System.out.println("Apple 기능 구현");
		
	}
}
public class Ex02Interface {
	public static void main(String[] args) {
		
		My2 a1 = new My2(); // 3개 모두 가능
		a1.show();
		a1.process1();
		a1.process2();
		System.out.println();
		
		Apple a2 = new My2();
		a2.process1(); // Apple의 메서드만 가능
		System.out.println();
		
		Banana a3 = new My2();
		a3.process2(); // Banana의 메서드만 가능
		
//		List<String> list = new Vector<String>();
//		list.capacity();
		
		Vector<String> list = new Vector<String>();
		list.capacity(); // Vector에 구현된 인터페이스
	}
}










