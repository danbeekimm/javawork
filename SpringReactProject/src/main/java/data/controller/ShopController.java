package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;
import data.dto.ShopDto;
import data.service.ShopService;

@RestController
@CrossOrigin //같은톰켓안에서 하면 같은도메인 근데서버틀리면작성
@RequestMapping("/shop")
public class ShopController {

   @Autowired
   private ShopService shopService;
   
   String photoName; //리액트에서 업로드한 이미지명(변경된 이미지명일수도)전역변수

   //리액트에서 이미지 업로드시 save폴더에 저장 후 이미지명 반환
   @PostMapping("/upload")
   public String fileUpload(@RequestParam MultipartFile uploadFile,
         HttpServletRequest request)
   {
      //파일명
      String fileName = uploadFile.getOriginalFilename();
      
      //업로드할 폴더 위치
      String path = request.getServletContext().getRealPath("/save");
      
      //직전에 업로드한 이미지 삭제하기 
      File file = new File(path+"/"+photoName);
      //만약 존재할 경우 삭제
      if(file.exists())
         file.delete();
      
      //파일명 변경
      FileUtil fileUtil = new FileUtil();
      photoName = fileUtil.changeFileName(fileName);
      System.out.println("fileName="+fileName+"=>"+photoName);   
      
      //save 폴더에 업로드
      try {
         uploadFile.transferTo(new File(path+"/"+photoName));
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
      return photoName;
   }
   
   @PostMapping("/insert") //업로드
   public void insertShop(@RequestBody ShopDto dto)
   {
	   //업로드한 사진명
	   dto.setPhoto(photoName);
	   shopService.insertShop(dto);
	   photoName=null; //초기값지정
   }
   
   @GetMapping("/list")
   public List<ShopDto> list()
   {
	   return shopService.getShopDatas();
   }
   
   @GetMapping("/detail")
   public ShopDto detail(@RequestParam int num)
   {
	   return shopService.getData(num);
   }
   
   @DeleteMapping("/delete")
   public void delete(@RequestParam int num, HttpServletRequest request)
   {
	   //save 경로 구하기
	   String path=request.getServletContext().getRealPath("/save");
	   
	   //num 에 해당하는 photo 받기
	   String photo=shopService.getData(num).getPhoto();
	   //해당경로에 파일이 존재할경우 삭제
	   File file=new File(path+"/"+photo);
	   if(file.exists())
		   file.delete();
	   //db delete
	   shopService.deleteShop(num);
   }
   @PostMapping("/update")
   public void update(@RequestBody ShopDto dto)
   {
	   //사진이 있을경우 이미지명 넣기
	   dto.setPhoto(photoName);
	   shopService.updateShop(dto);
	   photoName=null; //수정후 값초기화해야됨.
   }
}
