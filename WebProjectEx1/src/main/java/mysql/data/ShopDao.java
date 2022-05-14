package mysql.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class ShopDao {
	DBConnect db = new DBConnect();

	// insert
	public void shopInsert(ShopDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into shop (sangpum, photo, price, color, cnt, ipgoday) values (?,?,?,?,?,?)";
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			// 바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getColor());
			pstmt.setInt(5, dto.getCnt());
			pstmt.setString(6, dto.getIpgoday());
			
			// 실행 (DB에 넣기)
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// list
	public List<ShopDto> getSangpumList() {
		List<ShopDto> list = new Vector<ShopDto>();
		String sql = "select * from shop order by num desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShopDto dto = new ShopDto();
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setIpgoday(rs.getString("ipgoday"));

				// list에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	// num 에 해당하는 dto 반환
	public ShopDto getSangpum(String num) {
		ShopDto dto = new ShopDto();
		String sql = "select * from shop where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, num);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setIpgoday(rs.getString("ipgoday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	// delete
	public void shopDelete(String num) {
		String sql = "delete from shop where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);

			// 바인딩
			pstmt.setString(1, num);

			// 실행 (DB에 넣기)
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
