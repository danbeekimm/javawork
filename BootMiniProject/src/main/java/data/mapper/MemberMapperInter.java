package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public int getTotalCount();
	public void insertMember(MemberDto dto);
}