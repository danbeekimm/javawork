package data.service;

import java.util.List;
import java.util.Map;

import data.dto.BoardDto;

public interface BoardServiceInter {
   public int getMaxNum();
   public void updateReStep(int reg, int restep);
   public int getTotalCount();
   public List<BoardDto> getList(int start, int perpage);
   public void insertBoard(BoardDto dto);
   public void updateReadCount(int num);
   public BoardDto getData(int num);
   public void updateChu(int chu,int num); //map으로묶어서 
   //mapper로 보내기sql>boardmapperlnter>serviceinter>boardservice
   public void updateBoard(BoardDto dto);
   public void deleteBoard(int num); //mapper꺼받아옴?
}