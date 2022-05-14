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

	
	
	
	
	@GetMapping("/load/map")
	public String map()
	{
		return "/sub/layout/map";
	}
}
