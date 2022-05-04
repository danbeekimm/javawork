package project.home.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestMenuController {
	
	@GetMapping("/")
	public String home()
	{
		return "/layout/main"; //tiles에서 /*/*로지정해서 똑같이함
		
	}
	@GetMapping("/shop/form")
	public String home2()
	{
		return "/shop/shopform"; 
		
	}
	
	@GetMapping("/board/list")
	public String home3()
	{
		return "/board/boardlist"; 
		
	}
	
	@GetMapping("/member/form")
	public String home4()
	{
		return "/member/memberform"; 
		
	}
}
