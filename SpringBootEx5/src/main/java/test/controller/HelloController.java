package test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
   
   @GetMapping("/hello1")
   @ResponseBody //리턴타입이 json 타입으로 변환
   public String hello1() {
      
      return "SpringBoot Start!";
   }
   
   @GetMapping("/hello2")
   @ResponseBody
   public Map<String, String> hello2(){
      Map<String, String> map = new HashMap<>();
      map.put("name", "한가인");
      return map;
   }
   
   @GetMapping("/hello3")
   @ResponseBody
   public List<TestDto> hello3() //json 배열타입으로 변환
   {
      List<TestDto> list = new Vector<>();
      TestDto dto1 = new TestDto();
      dto1.setName("이영자");
      dto1.setHp("010-4456-7788");
      dto1.setAddr("서울시 강남구");
      list.add(dto1);
      
      TestDto dto2 = new TestDto();
      dto2.setName("김정하");
      dto2.setHp("010-4537-9493");
      dto2.setAddr("충청남도 천안시");
      list.add(dto2);
      
      return list;
   }

}

