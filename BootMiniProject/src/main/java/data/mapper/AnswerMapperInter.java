package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.AnswerDto;

@Mapper //mapper다 선언 처음엔 answersql answerdto answermapper>>RestController이렇게만드는것같음
public interface AnswerMapperInter {
	public void insertAnswer(AnswerDto dto); //컨트롤러- 매퍼 직접연결하신다함
	public List<AnswerDto> getAnswerList(int num);
	public void deleteAnswer(int idx);
}
