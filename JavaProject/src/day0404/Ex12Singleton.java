package day0404;

import java.util.Calendar;
import java.util.Date;

/*
 * 싱글턴 패턴(Singleton pattern)
 */
public class Ex12Singleton {
	
	Date date;
	Calendar cal;
	
	public Ex12Singleton() {
		date = new Date();
//		cal = new Calendar(); // 생성자가 protected라 생성안됨
		cal = Calendar.getInstance();
	}
	@SuppressWarnings("deprecation")
	public void write() {
		int y = date.getYear() + 1900;  // -1900을 반환
		int m = date.getMonth() + 1;    // 0~11 반환
		int d = date.getDate();
		
		System.out.println("오늘 날짜: " + y + "년" + m + "월" + d + "일");
	}
	public void write2() {
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		System.out.println("오늘 날짜: " + y + "년" + m + "월" + d + "일");
	}
	
	public static void main(String[] args) {
		
		Ex12Singleton ex = new Ex12Singleton();
		ex.write();
		ex.write2();
		
		
		
	}
}
