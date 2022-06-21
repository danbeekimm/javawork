package data.service;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MemoDto;

import data.mapper.MemoMapper;


@Service
public class MemoService {

	@Autowired
	private MemoMapper mapper;
	
	public void insertMemo(MemoDto dto) {
		mapper.insertMemo(dto);
	}
	
	public List<MemoDto> memoList(){
		return mapper.memoList();
	}
	
	public void deleteMemo(int num) {
		mapper.deleteMemo(num);
	}
}
