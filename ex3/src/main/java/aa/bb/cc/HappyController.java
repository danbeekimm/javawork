package aa.bb.cc;



import java.util.Date;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board") //cc/board/list로 적어야함
public class HappyController {

	@RequestMapping("/list") //메핑주소가 리스트일때 호출이됨
	public ModelAndView list1()
	{
		ModelAndView mview=new ModelAndView(); //모델과 뷰같이있는
		
		List<TestDto> list=new Vector<TestDto>(); //모델에 리스트이름으로 넣고
		list.add(new TestDto("홍길동","010-3333-4444", "서울")); //리스트에 dto있음
		list.add(new TestDto("김단비","010-2222-4444", "경기"));
		list.add(new TestDto("최준혁","010-1111-4444", "인천"));
		list.add(new TestDto("남주혁","010-5555-4444", "서울"));
		list.add(new TestDto("김영광","010-4445-4444", "영등포"));
		//model에 데이타 저장
		mview.addObject("list",list);
		mview.addObject("today",new Date());
		//포워드되는 jsp파일명지정
		mview.setViewName("list2"); //list2로 포워드
		return mview;
	}
}
//리턴을 모델과 뷰과 합쳐진 클레스로 반환.
