package data.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemberDto;


@Mapper
public interface MemberMapper {
	
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers(); 
	public String getName(String id);
	public int loginCheck(Map<String, String> map); //두개name pass불러와야해서 map으로 묶음
	public void deleteMember(int num);
	public int idCheck(String id);
	
}
