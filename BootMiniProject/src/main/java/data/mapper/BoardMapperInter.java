package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BoardDto;

@Mapper
public interface BoardMapperInter { //mapper후 sql가기
	public int getMaxNum();
	public void updateReStep(Map<String, Integer>map); //reg restep을 맵으로받아야함. 업뎃이라 void
	public int getTotalCount(); //한번에 여러개가져올거임,페이징처리할때
	public List<BoardDto> getList(Map<String, Integer>map); //boarddto받는..
	public void insertBoard(BoardDto dto);
	public void updateReadCount(int num);
	public BoardDto getData(int num);
	public void updateChu(Map<String, Integer>map);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);
	
}
