package data.controller;

import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MemberDto;
import data.dto.MemoDto;
import data.mapper.MemberMapper;
import data.service.MemberService;

@RestController
@CrossOrigin
@RequestMapping("/member")

public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	
	@PostMapping("/insert")
	public void insert(@RequestBody MemberDto dto)
	{
		System.out.println("insert>>"+dto.getEmail());
		memberService.insertMember(dto);
	}
	
	@GetMapping("/idcheck")
	public int idcheck(@RequestParam String id) //id 있는지확인
	{
		return memberService.idCheck(id); //id 가 있냐 유무 1,0
	}
	
	@PostMapping("/login") 
	public int login(@RequestBody MemberDto dto)
	{
		return memberService.loginCheck(dto.getId(), dto.getPass());//모두맞으면 1틀리면0	}
}
	@GetMapping("/logout")
	public String idout (@RequestParam String id)
	{
		return memberService.getName(id);
	}
	
	@GetMapping("/list")
	public List<MemberDto> getList(){
		return memberService.getAllMembers();
		
	}
	
	@DeleteMapping("/delete")
	public void delete(@RequestParam int num)
	{
		memberService.deleteMember(num);
	}
	
}
