package aa.bb.cc;


import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//리케스트멥핑 겟메핑
	@RequestMapping(value = "/",method = RequestMethod.GET) //스프링버전4까지
	//5미만이면 리퀘스트메핑. 5부턴 겟메핑자주씀
	public String test1(Model model,HttpSession session)
	{
		//request 영역에 저장
		model.addAttribute("message", "Spring Framework Start!!!!");
		//session 영역에 저장
		session.setAttribute("myid", "angel");
		return "result1";
	}
	@GetMapping("/form")
	public String go()
	{
		return "form";
	}
	
	

	
	@GetMapping("/happy")
	public String go2(Model model) //리턴을스트링 모델을 파라미터로받기
	{
		model.addAttribute("today",new Date());
		return "nice";
	}
	
	@GetMapping("/for") //메핑주소가 for면 list.jsp 호출
	public String go3(Model model)
	{
		List<String> list=new Vector<String>();
		list.add("red");
		list.add("green");
		list.add("orange");
		list.add("pink");
		list.add("blue");
		list.add("black");
		list.add("gray");
		list.add("magenta");
		
		model.addAttribute("flowers",list);
		return "list";
	}

}
