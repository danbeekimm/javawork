package aa.bb.cc;



import java.util.Date;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board") //cc/board/list�� �������
public class HappyController {

	@RequestMapping("/list") //�����ּҰ� ����Ʈ�϶� ȣ���̵�
	public ModelAndView list1()
	{
		ModelAndView mview=new ModelAndView(); //�𵨰� �䰰���ִ�
		
		List<TestDto> list=new Vector<TestDto>(); //�𵨿� ����Ʈ�̸����� �ְ�
		list.add(new TestDto("ȫ�浿","010-3333-4444", "����")); //����Ʈ�� dto����
		list.add(new TestDto("��ܺ�","010-2222-4444", "���"));
		list.add(new TestDto("������","010-1111-4444", "��õ"));
		list.add(new TestDto("������","010-5555-4444", "����"));
		list.add(new TestDto("�迵��","010-4445-4444", "������"));
		//model�� ����Ÿ ����
		mview.addObject("list",list);
		mview.addObject("today",new Date());
		//������Ǵ� jsp���ϸ�����
		mview.setViewName("list2"); //list2�� ������
		return mview;
	}
}
//������ �𵨰� ��� ������ Ŭ������ ��ȯ.
