package test.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //restapi 전용 컨트롤러 , 스프링 5버전부터가능
public class HappyController {

	@GetMapping("/happy1")
	public TestDto happy1() //rest전용 컨트롤러임으로 @responsebody를 안써도 json 으로 반환
	{
		TestDto dto=new TestDto();
		dto.setName("이미자");
		dto.setHp("010-2222-2222");
		dto.setAddr("평택시 용이동");
		return dto;
	}
}
