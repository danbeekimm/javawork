package study.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Study1Controller {
	@GetMapping("/") //5로바꿔야가능 첫시작을/로줌
	public String process1(Model model)
	{
		model.addAttribute("message","오늘은 즐거운목요일");
		model.addAttribute("today",new Date());
		
		return "hello/study1";//포워드:url안바뀜,매핑주소/로그대로있음, model 데이타 전달
	//스터디1으로가자
	}
	//go1만들기
	@GetMapping("/go1")
	public ModelAndView process2()
	{
		ModelAndView mview=new ModelAndView();
		mview.addObject("name","이지아");
		mview.addObject("addr", "강원도속초"); //이걸출력하고싶어
		//스터디 2에 네임과 addr 들어가있겟지?
		mview.setViewName("hello/study2");//포워드될파일명
		return mview; //>> study2에 있는거불러옴
	}
	
	@GetMapping("/go2/busan/sea")
	public String process3()
	{
		return "hello/study3";
	}
	@GetMapping({"/go3","/go3/jeju","/go3/seoul"})
	   public String process4(HttpServletRequest request, Model model)
	   {
	      String urlPath = request.getContextPath(); //프로젝트명까지만 구하기
	      String urlPath2 = request.getRequestURI(); //현재 url 전체 경로 구하기
	      System.out.println(urlPath); //      /day0428
	      System.out.println(urlPath2);//    /day0428/go3/jeju
	      
	      model.addAttribute("path", urlPath);
	      return "hello/study4";
	      
	   }
}
