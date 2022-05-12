package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;

//db에 대한 로직은 서비스에서 함.
@Service
public class BoardService implements BoardServiceInter {
	@Autowired
	private BoardMapperInter mapper;

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		   return mapper.getMaxNum();

	}

	@Override
	public void updateReStep(int reg, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("reg", reg); //xml과 같은 이름
		map.put("restep", restep);
		mapper.updateReStep(map); //boardsql에서 준것과 같은{}이름으로 줘야함.
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(); //바로반환
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage); //mapper로 묶어서 보내기
		return mapper.getList(map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		int reg=dto.getReg();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		int num=dto.getNum();
		
		//새글인경우
		if(num==0)
		{
			//새글인경우
			reg=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//답글인경우
			//기존 restep보다 큰값은 모두 1증가하기 //전달받은것보다 1추가하니까
			this.updateReStep(reg, restep);
			//기존값들보다 1증가
		      restep++;
		      relevel++;
		   }
		      
		   dto.setReg(reg);
		   dto.setRestep(restep);
		   dto.setRelevel(relevel);
		   //insert
		   mapper.insertBoard(dto);
		}

		   @Override
		   public void updateReadCount(int num) {
		      mapper.updateReadCount(num);
		   }

		   @Override
		   public BoardDto getData(int num) {
		      return mapper.getData(num);
		   }
		   @Override
		   public void updateChu(int chu,int num) {
			   Map<String, Integer> map=new HashMap<>();
			   map.put("chu", chu);
			   map.put("num", num);
			   mapper.updateChu(map);
		   }
		   @Override
		   public void updateBoard(BoardDto dto) {
			   mapper.updateBoard(dto);
		}
		   
		   @Override
			public void deleteBoard(int num) {
				mapper.deleteBoard(num);
			}
		}
