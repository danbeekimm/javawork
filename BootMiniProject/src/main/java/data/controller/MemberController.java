package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MemberDto;
import data.mapper.MemberMapperInter;

@Controller
@RequestMapping("/member")
public class MemberController {

   
   @Autowired
   MemberMapperInter mapper;
   
   @GetMapping("/form")
   public String home4() 
   {
      return "/member/memberform";
   }

   @GetMapping("/list")
   public ModelAndView list()
   {
      ModelAndView mview = new ModelAndView();
      //mapper 로부터 총갯수 가져오기
      int totalCount = mapper.getTotalCount();
      
      //model 에 저장
      mview.addObject("totalCount",totalCount);
      
      mview.setViewName("/member/memberlist");
      return mview;
   }
   @PostMapping("/insert")
   public String insert(@ModelAttribute MemberDto dto,
		   @RequestParam String email1,@RequestParam String email2)
   {
	   dto.setEmail(email1+"@"+email2);
	   //db저장
	   mapper.insertMember(dto);
	   //목록으로이동
	   
	   return "redirect:list";
   }
}