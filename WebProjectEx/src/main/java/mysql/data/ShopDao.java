package mysql.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ShopDao {
	DbConnect db=new DbConnect();

   // insert
   public void shopInsert(ShopDto dto) { //���Ⱑ�μ�Ʈ
      Connection conn = null;
      PreparedStatement pstmt = null;
      String sql = "insert into shop (sangpum, photo, price, color, cnt, ipgoday) values (?,?,?,?,?,?)";
      conn = db.getConnection();
      try {
         pstmt = conn.prepareStatement(sql);

         // ���ε�
         pstmt.setString(1, dto.getSangpum());
         pstmt.setString(2, dto.getPhoto());
         pstmt.setInt(3, dto.getPrice());
         pstmt.setString(4, dto.getColor());
         pstmt.setInt(5, dto.getCnt());
         pstmt.setString(6, dto.getIpgoday());
         
         //����
         pstmt.execute();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
 }

   //list
   public List<ShopDto> getSangpumList()
   {
	   List<ShopDto> list=new Vector<ShopDto>();
	   String sql="select * from shop order by num desc"; //�ѹ��� �𼾵� �ֱٿ������Ÿ�������
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null; //����Ʈ���ʿ���

	   conn=db.getConnection();
	   try {
		   pstmt=conn.prepareStatement(sql);
		   rs=pstmt.executeQuery(); //����Ʈ�� �ͽ�ťƮ Ŀ���ؾ���
		   while (rs.next()) 
		   {
			   ShopDto dto= new ShopDto(); //DB���� ������ DTO�� �ֱ�
			   dto.setNum(rs.getString("num"));
			   dto.setSangpum(rs.getString("sangpum"));
			   dto.setColor(rs.getString("color"));
			   dto.setPhoto(rs.getString("photo"));
			   dto.setPrice(rs.getInt("price"));
			   dto.setCnt(rs.getInt("cnt"));
			   dto.setIpgoday(rs.getString("ipgoday"));
			   //list�߰�
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   // TODO: handle exception
		   e.printStackTrace();
	   }finally {
		   db.dbClose(rs,pstmt,conn);

	   }
	   return list;
   }

   //num�� �ش��ϴ� dto ��ȯ
   public ShopDto getSangpum(String num) //���ϳ� ��ȯ ���������̽����� �ѹ����޾ƾ���
   {
	   ShopDto dto = new ShopDto();
	   String sql="select * from shop where num=?"; //�ѹ��� �ش��ϴ� ��ü������ �޾ƿ���
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;

	   conn = db.getConnection();
	   try {
		   pstmt=conn.prepareStatement(sql); //����ǥ�� �ѹ��ֱ�
		   //���ε�
		   pstmt.setString(1, num);
		   //����
		   rs=pstmt.executeQuery();
		   if(rs.next()) { //�Ѱ��϶� if ��� rs.next��Ʈ���϶�
			   dto.setNum(rs.getString("num"));
			   dto.setSangpum(rs.getString("sangpum"));
			   dto.setColor(rs.getString("color"));
			   dto.setPhoto(rs.getString("photo"));
			   dto.setPrice(rs.getInt("price"));
			   dto.setCnt(rs.getInt("cnt"));
			   dto.setIpgoday(rs.getString("ipgoday"));
		   }

	   }catch (SQLException e) {
		   // TODO: handle exception
		   e.printStackTrace();
	   }finally {
		   db.dbClose(rs, pstmt, conn);
	   }
	return dto;
	  
   }
   
   public void shopDelete(String num)
   {
	   
	   String sql="delete from shop where num=?";
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   conn=db.getConnection();
	   try {
		   pstmt=conn.prepareStatement(sql); 
		   //���ε�
		   pstmt.setString(1, num);
		   //����
		pstmt.execute();
	   }catch (SQLException e) {
		   // TODO: handle exception
		   e.printStackTrace();
	   }finally {
		   db.dbClose(pstmt, conn);
	   }
   }

public void shopUpdate(ShopDto dto)
{
	   
	   String sql="update shop set sangpum=?,color=?,price=?,cnt=?,ipgoday=?,photo=? where num=?";
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   conn=db.getConnection();
	   try {
		   pstmt=conn.prepareStatement(sql); 
		   //���ε�
		 pstmt.setString(1, dto.getSangpum());
		 pstmt.setString(2, dto.getColor());
		 pstmt.setInt(3, dto.getPrice());
		 pstmt.setInt(4, dto.getCnt());
		 pstmt.setString(5, dto.getIpgoday());
		 pstmt.setString(6, dto.getPhoto());
		 pstmt.setString(7,  dto.getNum());
		   //����
		pstmt.execute();
	   }catch (SQLException e) {
		   // TODO: handle exception
		   e.printStackTrace();
	   }finally {
		   db.dbClose(pstmt, conn);
	   }
}
}
