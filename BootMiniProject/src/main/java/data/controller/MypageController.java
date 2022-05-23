package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import data.dto.UserDto;


@Controller
public class MypageController {
	



	@GetMapping("/mypage")
	public String mypage()
	{
		return "/mypage/mypage";
	}

	
}

