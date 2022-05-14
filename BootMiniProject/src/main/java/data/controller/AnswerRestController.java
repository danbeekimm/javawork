package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import data.dto.AnswerDto;
import data.mapper.AnswerMapperInter;

@RestController
@RequestMapping("/answer")
public class AnswerRestController {
	
	@Autowired
	private AnswerMapperInter mapper;
	
	@PostMapping("/insert")
	public void insertAnswer(@ModelAttribute AnswerDto dto) //answer이 가지고있는걸 다 읽어야하고
	{
		mapper.insertAnswer(dto);
		
	}

	@GetMapping("/list") //리프런스바디???? 생략이됐다?
	public Map<String,Object> getAnswerList(@RequestParam int num)
	{
		Map<String, Object> map=new HashMap<>();
		List<AnswerDto> alist=mapper.getAnswerList(num);
		map.put("count", alist.size());
		map.put("alist", alist);
		return map; //num 가져옴
	}
	
	@GetMapping("/delete")
	public void deleteAnswer(@RequestParam int idx)
	{
		mapper.deleteAnswer(idx); //얘만 json으로 반환
	}
}
