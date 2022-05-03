package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

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
	}