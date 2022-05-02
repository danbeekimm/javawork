package mysql.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StuDao {
	///여기 dao에서 num지정 후 jsp> html순서
	DbConnect db=new DbConnect();

	public List<StuDto> getAllDatas()
	{
		List<StuDto> list=new ArrayList<StuDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from stu order by name"; //셀렉트는 익스큐트

		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				//db의 데이타를 레코드단위로 dto에 넣는다
				StuDto dto=new StuDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setPhoto(rs.getString("photo"));
				//list추가
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt,conn);
		}
		return list;
	}
	
	//insert method
	public void insertStudent(StuDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into stu (name,hp,addr,photo,writeday) values(?,?,?,?,now())";

		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getPhoto());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public void deleteStudent(String num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from stu where num=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
}