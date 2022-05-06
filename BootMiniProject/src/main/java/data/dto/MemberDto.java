package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member") //dto를 파라미터나 뭐 받을때 맴버로만줄여서 쓰겠다.
public class MemberDto {
	private String num;
	private String name;
	private String id;
	private String pass;
	private String hp;
	private String email;
	private String addr;
	private Timestamp gaipday;
}
