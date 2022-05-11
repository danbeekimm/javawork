package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
import data.mapper.MemberMapperInter;
import data.service.BoardService;
import util.FileUtil;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberMapperInter memberMapper;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue="1")int currentPage
			)
	{
		ModelAndView mview=new ModelAndView();
		int totalCount;//총갯수
		int perPage=3;//한 페이지당 보여질 글의 갯수
		int perBlock=5;//한(밑에 페이지 숫자)블럭당 보여질 페이지수
		int totalPage; //총페이지수
		int startNum;//한페이지에서 보여질 시작 글번호
		int startPage;//한블럭에서 보여질 시작 페이지 번호
		int endPage;//한블럭에서 보여질 끝 페이지 번호
		int no;//각페이지당 보여질 시작번호
		
		//총글의갯수를 구한다
		totalCount=service.getTotalCount();
		//총페이지수를 구한다
		//밑에두개 같은거임
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		//totalPage=(int)Math.ceil((double)totalCount/perPage);//무조건올림
		
		//각블럭 시작페이지 (한블럭당 5개일경우)
		//1,6,11,,,(currentPage가 1~5일때는 1,  6~10일땐 6
		startPage=(currentPage-1)/perBlock*perBlock+1;
				
		//5,10,15....(currentPage가 1~5일때는 5,  6~10일땐 10
		endPage=startPage+perBlock-1;
		//문제점 : 마지막블럭은 마지막페이지까지만나와야함 
		if(totalPage<endPage) {
			endPage=totalPage;
		
			
		}
		//각 페이지에서 보여질 글의 시작번호 (mysql 은 0부터)오라클은1부터
		//한페이지당 3개일경우 1페이지:0, 2페이지:3, 3페이지:6;
		startNum=(currentPage-1)*perPage;
		//각 페이지당 보여질 시작번호
		no=totalCount-(currentPage-1)*perPage;
		//데이타 가져오기
		List<BoardDto> list= service.getList(startNum, perPage);
		//각 데이타에 id 를 이용해서 이름넣어주기
		for(BoardDto dto:list)
		{
			String id=dto.getId();
			String name=memberMapper.getSearchName(id);
			dto.setName(name);
		}
		//출력시필요한 변수들
		mview.addObject("totalCount", totalCount);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("no", no);
		mview.addObject("list", list);
		mview.addObject("currentPage", currentPage);
		
		
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
		mview.addObject("num", num==null?"0":num); //새글인지답글인지 확인하기위해
		mview.addObject("reg", reg==null?"0":reg);
		mview.addObject("restep", restep==null?"0":restep);
		mview.addObject("relevel", relevel==null?"0":relevel);
		
		mview.setViewName("/board/boardform");
		return mview;
	}
	@PostMapping("/insert") //dto가 읽는데 photos는 없음. 현재패이지랑.
	public String insert(
			@ModelAttribute BoardDto dto,
			@RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> upload, //이미지하나일땐 MultipartFile 두개이상이면ArrayList 
			HttpSession session,
			HttpServletRequest request
			) {
		//사진을 저장할 경우
		String path=request.getServletContext().getRealPath("/save");
		//세션으로부터 로그인한 아이디 얻기
		String loginid=(String)session.getAttribute("loginid");
		dto.setId(loginid);

		 //dto에 넣어야 그래야 db에 아이디저장됨
		
		//사진업로드안했을때 photos에 no라고저장 필수 아니기때문에 에러방지
		if(upload.get(0).getOriginalFilename().equals("")) { //빈문자열이면 no저장
			dto.setPhotos("no");
			
		}else {
			FileUtil fileUtil=new FileUtil();//fileUtil이 년월일 시분초들어가있는파일.
			String photos="";
			for(MultipartFile f:upload) //멀티파일꺼내서 개수만큼반복changeFileName호출
			{
				String rename=fileUtil.changeFileName(f.getOriginalFilename());//f.getOriginalFilename()원래파일명 년월일시분초로 분리.
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
			photos=photos.substring(0,photos.length()-1); //마지막,빼고 
			System.out.println(photos);
			dto.setPhotos(photos); //포토스받아서 세터로주기.
		}

		
		//System.out.println("11:"+upload.size()+","+upload.isEmpty()); 해보면 1이출력되며 flase가 나옴
		//db insert
		service.insertBoard(dto);
		
		return "redirect:list?currentPage="+currentPage;//해당 페이지로 이동 페이지번호 보내기

	}
	@GetMapping("/content")
	public ModelAndView content(
			@RequestParam int num,
			@RequestParam String currentPage
			)
	{
		ModelAndView mview=new ModelAndView();
		//조회수1증가
		service.updateReadCount(num);
		//num에 해당하는 dto
		BoardDto dto=service.getData(num);
		//이름넣어주기
		String name=memberMapper.getSearchName(dto.getId());
		dto.setName(name);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		
		mview.setViewName("/board/content");
		return mview;
	}
}
