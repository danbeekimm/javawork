package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Alias("memo")
@Data
public class MemoDto {
	private int num;
	private String nickname;
	private String message;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp writeday;
}
