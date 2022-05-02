package study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.PersonDto;

@Controller
public class StudyMunjeController {
   
   @GetMapping("/form/munje")
   public String goForm5() {
      return "form/testform4";
   }
   
   @PostMapping("/form/result")
   public String goRead5(@ModelAttribute PersonDto dto)
   {
	   //dto 통째로 읽어오기
      System.out.println(dto.getName());
       return "result/view5";
   }
   
//   @PostMapping("/form/result")
//   public ModelAndView result(@ModelAttribute PersonDto dto)
//   {
//	   ModelAndView mview=new ModelAndView();
//	   int tot=dto.getJava()+dto.getSpring();
//	   double avg=tot/2.0;
//	   mview.addObject("tot", tot);
//	   mview.addObject("avg", avg);
//	   mview.setViewName("result.view5");
//	   return mview;
//   }
}
