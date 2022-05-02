package mysql.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnect {
	   static final String DRIVER="com.mysql.jdbc.Driver"; //5
	   //static final String DRIVER="com.mysql.cj.jdbc.Driver";//8

	    static final String URL="jdbc:mysql://localhost:3306/bitcamp?servierTimezone=Asia/Seoul";
	      //static final String URL="jdbc:mysql://localhost:3306/bitcamp";//5����
	      //static final String URL="jdbc:mysql://localhost:3306/bitcamp?serverTimezone=Asia/Seoul";//5,8����

	    public DbConnect() {
	    	try {
	    		Class.forName(DRIVER);
	    		
	    	}catch(ClassNotFoundException e) {
	    		System.out.println("Mysql����̹�����"+e.getMessage());
	    	}
	    } //private�ϸ� �����ȵ�. ��Ű�����ٸ�?
	    public Connection getConnection() //Ŀ�ؼ��Ҷ����� ȣ��?
	    {
	    	Connection conn=null;
	    	try {
				conn=DriverManager.getConnection(URL,"root","1234");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Mysql�������"+e.getMessage());
			}
	    	return conn;
	    }
	    
	    public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	    {
	    	try {
	    		rs.close();
	    		pstmt.close(); 
	    		conn.close();
	    	}catch(SQLException e) {}

	    
	    }
	    
	    
	    public void dbClose(PreparedStatement pstmt,Connection conn) //resultset������
	    {
	    	try {
	    		pstmt.close();
	    		conn.close();
	    	}catch(SQLException e) {}

	    
	    }
}
