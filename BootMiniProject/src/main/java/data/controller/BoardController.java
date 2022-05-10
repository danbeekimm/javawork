package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.BoardDto;
import data.service.BoardService;
import util.FileUtil;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		int totalCount;//총갯수
		totalCount=service.getTotalCount();
		mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/board/boardlist");
		return mview;
	}
	@GetMapping("/form")
	public ModelAndView form(@RequestParam Map<String, String>map) //map으로 한꺼번에읽기가능.
	{
		ModelAndView mview=new ModelAndView();
		//답글일경우 읽어야할 5개의 값
		//답글일땐 그대로 보낼거고
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String reg=map.get("reg");
		String restep=map.get("restep");
		String relevel=map.get("relevel"); //int일땐 값이없으면 null 에러나서 string으로함
		//새글일땐 null 나머지 넘일때 0으로할거임. 새글일땐 아무것도 안넘어옴 그래서 null나옴
		//새글일땐 값이 안넘어오므로 null이라 1page에 다 0000으로주기
		mview.addObject("currentPage", currentPage==null?"1":currentPage);
		mview.addObject("num", num==null?"0":num);
		mview.addObject("reg", reg==null?"0":reg);
		mview.addObject("restep", restep==null?"0":restep);
		mview.addObject("relevel", relevel==null?"0":relevel);
		
		mview.setViewName("/board/boardform");
		return mview;
	}
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BoardDto dto,
			@RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session,
			HttpServletRequest request
			) {
		//사진을 저장할 경우
		String path=request.getServletContext().getRealPath("/save");
		//세션으로부터 로그인한 아이디 얻기
		String loginid=(String)session.getAttribute("loginid");
		dto.setId(loginid);

		 //dto에 넣어야 그래야 db에 아이디저장됨
		
		//사진업로드안했을때 photos에 no라고저장
		if(upload.get(0).getOriginalFilename().equals("")) { //빈문자열이면 no저장
			dto.setPhotos("no");
			
		}else {
			FileUtil fileUtil=new FileUtil();
			String photos="";
			for(MultipartFile f:upload) //멀티파일꺼내서 개수만큼반복
			{
				String rename=fileUtil.changeFileName(f.getOriginalFilename());
 //파일보내주는걸 다시받아  포토스에 넣기
				photos+=rename+",";
				
				File file=new File(path+"\\"+rename);

				try {
					f.transferTo(file); //save폴더에 업로드됨
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//마지막 컴마 제거
			photos=photos.substring(0,photos.length()-1);
			System.out.println(photos);
			dto.setPhotos(photos);
		}

		
		//System.out.println("11:"+upload.size()+","+upload.isEmpty()); 해보면 1이출력되며 flase가 나옴
		//db insert
		service.insertBoard(dto);
		
		return "redirect:list?currentPage="+currentPage;//해당 페이지로 이동

	}
}
