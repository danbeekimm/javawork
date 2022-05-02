package study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ShopDto;

//1������
@Controller
public class StudyFormController {
	@GetMapping("/form1")
	public String goForm1()
	{
		return "form/testform1";
	}
	@GetMapping("/read1") //testform1�� �ִ� read1�� �Ѿ��.
	public ModelAndView goRead1(
			/*@requestparam �� ���������ϳ� ��Ȯ�ϰ� ���ִ°�����*/
			@RequestParam("name") String name,
			@RequestParam String ipsa,
			//Required String parameter 'pageNum' is not present ������
			//@RequestParam (required = false)String pageNum //(required = false): ���� �ȳѾ������ ������ �ȳ������Ѵ�.
			@RequestParam(defaultValue = "10") String pageNum //���� �������⺻����10�̵�
			//���� name �� testform1���ִ� name ipsa��
		) {
		ModelAndView mview=new ModelAndView();
		String result=name+"���� �Ի�����"+ipsa+"�Դϴ�";
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
			@RequestParam("address") String a)/*���ױ��� name �� �������� �ٸ����*/

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
) { //dto��°�� �о����
		//ModelAttribute: model�� shopdto��� �̸����� ����Ǿ�����.
		System.out.println(dto.getSang());
		return "result/view3";
		
	}
}
