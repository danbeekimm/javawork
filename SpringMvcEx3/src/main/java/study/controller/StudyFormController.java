package study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ShopDto;

//1번순서
@Controller
public class StudyFormController {
	@GetMapping("/form1")
	public String goForm1()
	{
		return "form/testform1";
	}
	@GetMapping("/read1") //testform1에 있는 read1이 넘어옴.
	public ModelAndView goRead1(
			/*@requestparam 은 생략가능하나 정확하게 써주는게좋다*/
			@RequestParam("name") String name,
			@RequestParam String ipsa,
			//Required String parameter 'pageNum' is not present 에러남
			//@RequestParam (required = false)String pageNum //(required = false): 값이 안넘어오더라도 오류가 안나도록한다.
			@RequestParam(defaultValue = "10") String pageNum //값이 없을경우기본값이10이됨
			//여기 name 은 testform1에있는 name ipsa도
		) {
		ModelAndView mview=new ModelAndView();
		String result=name+"님의 입사일은"+ipsa+"입니다";
		mview.addObject("pageNum",pageNum);
		mview.addObject("result",result);
		mview.setViewName("result/view1");
		
		return mview;
	}
	//////////////////////////
	@GetMapping("/form2")
	public String goForm2()
	{
		return "form/testform2";
	}
	@PostMapping("/read2")
	public String goRead2(Model model,
			@RequestParam String name,
			@RequestParam String gender,
			@RequestParam("address") String a)/*폼테그의 name 과 변수명이 다른경우*/

	{
		model.addAttribute("name",name);
		model.addAttribute("gender",gender);
		model.addAttribute("address",a);
		
		return "result/view2";
	}
	@GetMapping("/form3")
	public String goForm3()
	{
		return "form/testform3";
	}
	
	@PostMapping("/read3")
	public String goRead3(
			@ModelAttribute ShopDto dto
) { //dto통째로 읽어오기
		//ModelAttribute: model에 shopdto라는 이름으로 저장되어있음.
		System.out.println(dto.getSang());
		return "result/view3";
		
	}
}
