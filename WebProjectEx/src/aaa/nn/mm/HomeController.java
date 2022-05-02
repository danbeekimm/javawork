package aaa.nn.mm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String test1(Model model, HttpSession session)
   {   
      //request 영역에 저장
      model.addAttribute("message","Spring Framework Start!!");
      //session 영역에 저장
      session.setAttribute("myid", "angel");
      return "result1";
   }
}