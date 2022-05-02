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
	      //static final String URL="jdbc:mysql://localhost:3306/bitcamp";//5버전
	      //static final String URL="jdbc:mysql://localhost:3306/bitcamp?serverTimezone=Asia/Seoul";//5,8버전

	    public DbConnect() {
	    	try {
	    		Class.forName(DRIVER);
	    		
	    	}catch(ClassNotFoundException e) {
	    		System.out.println("Mysql드라이버오류"+e.getMessage());
	    	}
	    } //private하면 생성안됨. 패키지가다름?
	    public Connection getConnection() //커넥션할때마다 호출?
	    {
	    	Connection conn=null;
	    	try {
				conn=DriverManager.getConnection(URL,"root","1234");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Mysql연결실패"+e.getMessage());
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
	    
	    
	    public void dbClose(PreparedStatement pstmt,Connection conn) //resultset만빼기
	    {
	    	try {
	    		pstmt.close();
	    		conn.close();
	    	}catch(SQLException e) {}

	    
	    }
}
