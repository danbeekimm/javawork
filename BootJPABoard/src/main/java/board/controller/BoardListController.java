package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDao;
import board.data.BoardDto;

@Controller
public class BoardListController {
	@Autowired
	BoardDao dao;
	   @GetMapping("/")
	   public String home() {
	      return "redirect:board/list";
	   }

	   @GetMapping("/board/list")
	   public ModelAndView list() {
	      ModelAndView mview = new ModelAndView();
	      List<BoardDto> list =dao.getAllDatas();
	      mview.addObject("list", list);
	      mview.addObject("count",list.size()); //갯수
	      mview.setViewName("list");
	      return mview;
	   } 

	   @GetMapping("/board/writeform")
	   public String form() {
	      return "writeform";
	   }

	   @PostMapping("/board/insert")
	   public String insert(@ModelAttribute BoardDto dto, @RequestParam MultipartFile upload, 
	         HttpServletRequest request) {
//	      if(!upload.isEmpty()) //사진을 안올릴 경우
//	      System.out.println("파일명:"+upload.getOriginalFilename());

	      // 업로드될 실제 경로
	      String realPath = request.getServletContext().getRealPath("/save");
	      System.out.println(realPath);
	      
	      // 사진을 실제 경로에 업로드 시키고 그 파일명을 dto의 photo에 저장
	      // 단 사진을 안넣었을 경우 "no"라고 저장해보자
	      String uploadName = changeFileName(upload.getOriginalFilename());
	      if (upload.isEmpty())
	         dto.setPhoto("no");
	      else {
	         dto.setPhoto(uploadName);
	         
	         // 실제 업로드
	         try {
	            upload.transferTo(new File(realPath+"\\"+uploadName));
	         } catch (IllegalStateException | IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	      // db에 저장
	      dao.insertBoard(dto);

	      return "redirect:list";

	   }

	   // 파일명 변경하는 함수
	   public String changeFileName(String fileName) {
	      Date date = new Date();
	      int y = date.getYear() + 1900;
	      int m = date.getMonth() + 1;
	      int d = date.getDate();
	      int h = date.getHours();
	      int mm = date.getMinutes();
	      int ss = date.getSeconds();

	      // ex) a.jpg 일 경우 202253161323_a.jpg
	      // 초까지 받기 때문에 겹치지 않음!
	      String s = "photo_"+y + m + d + h + mm + ss + "_" + fileName;
	      return s;
	   }
	   
	   
	   //detail
	   @GetMapping("board/detail")
	   public ModelAndView detail(@RequestParam Long num) //읽을때 롱으로 받아야함.
	   {
		   ModelAndView mview=new ModelAndView();
		   //dao로부터 dto얻기
		   BoardDto dto=dao.getData(num);
		   String content=dto.getContent().replace("\n", "<br>"); //br로 바꿔서 content에저장하고
		   dto.setContent(content);
		   //model 에저장
		   mview.addObject("dto",dto);
		   mview.setViewName("detail"); //포어드
		   return mview;
		   
	   }
	   @GetMapping("/board/updateform")
	   public ModelAndView updateform(@RequestParam Long num) {
		   ModelAndView mview=new ModelAndView();
		   BoardDto dto=dao.getData(num);
		   
		   mview.addObject("dto",dto);
		   mview.setViewName("updateform");
		   return mview;
	   }
	   
	   @PostMapping("/board/update") //리다이렉트는 모델엔뷰로가는거아님 이걸로
	   public String update(@ModelAttribute BoardDto dto,
			   @RequestParam MultipartFile upload,
			   HttpServletRequest request)
	   		{
		   //업로드할 폴더 실제경로
		   String path=request.getServletContext().getRealPath("/save");
		   //기존사진파일명
		   String oldFileName=dao.getData(dto.getNum()).getPhoto();
		   if(upload.isEmpty()) {
			   //사진업로드안했을경우 기존이름으로수정
			   dto.setPhoto(oldFileName);
		   }else {
			   //새로저정할파일명
			   String newFileName=changeFileName(upload.getOriginalFilename());
			   //dto에저장
			   dto.setPhoto(newFileName);
			   //기존사진삭제
			   deleteFile(path,oldFileName);
			   //사진업로드
			   try {
				   upload.transferTo(new File(path+"\\"+newFileName));
			   }catch(IllegalStateException | IOException e) {
				   e.printStackTrace();
			   }
		   }
		   //db 업데이트
		   dao.updateBoard(dto);
		   //ㄷl테일페이지로이동
		   return "redirect:detail?num="+dto.getNum();
	   }
	  //파일삭제하는 메서드
	   public void deleteFile(String path,String oldFileName)
	   {
		   File file =new File(path+"\\"+oldFileName);
		   if(file.exists()) //해당경로에 파일이 있을경우 true
		   {
			   file.delete();
			   System.out.println("파일삭제성공");
		   }
	   }
	   @GetMapping("/board/delete")
	   public String delete(@RequestParam Long num,
			   HttpServletRequest request)
	   {
		   String path=request.getServletContext().getRealPath("/save");
		   String fileName=dao.getData(num).getPhoto();
		   //사진삭제
		   deleteFile(path, fileName);
		   //db에서도삭제
		   dao.deleteBoard(num);
		   //목록으로이동
		   return "redirect:list";
	   }
	   {
		   //사진삭제 패스,올드파일네임 가져와
		   
	   }
}