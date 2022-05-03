package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.data.MyCarDao;
import board.data.MyCarDto;

@Controller
public class UpdateController {
	@Autowired
	MyCarDao dao;
	
	@GetMapping("updateform") //수정
	public String updateform(Model model,@RequestParam Long num)
	{
		//dao로부터 dto가져오기
		
		MyCarDto dto = dao.getmyCar(num);
		//modeldp dto저장
		model.addAttribute("dto", dto);
		//포워드
		return "updateform";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MyCarDto dto)
	{
		//수정
		dao.updateCar(dto);
		//목록으로이동
		return "redirect:/";
		//redirect : 다시 돌리니까 리스트의 /가호출됨
	}
	@GetMapping("/delete")
	public String delete(@RequestParam Long num)
	{
		//삭제후목록으로이동
		dao.deleteCar(num);
		return "redirect:/";
	}
}
