package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DiaryDAO {
	
	private static Connection conn; // connection:db에접근하게 해주는 객체
	private static String DB_URL = "jdbc:mysql://10.96.124.88:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC"; //접속할 DB 서버
	private static String USER_NAME = "root"; //DB에 접속할 사용자 이름을 상수로 정의
	private static String PASSWORD = "1234"; //사용자의 비밀번호를 상수로 정의
	
	public static String[] select(int id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result[] = null;
		
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			 pstmt = conn.prepareStatement("SELECT * FROM DIARY WHERE ID = ?");
	         pstmt.setInt(1, id);
	         rs = pstmt.executeQuery();

	         if(rs.next()) {
	        	 result = new String[6];
		         result[0]= rs.getString("content1");  
		         result[1] = rs.getString("content2"); 
		         result[2] = rs.getString("content3"); 
		         result[3] = rs.getString("content4");
		         result[4] = rs.getString("content5");
		         result[5] = rs.getString("date");
	         }
	         
	         System.out.println("select success!");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (rs != null) rs.close();
	         if (pstmt != null) pstmt.close();
	         if (conn != null) conn.close();
	      }
	     
		return result;
	}
	
	public static int count() throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			 pstmt = conn.prepareStatement("SELECT COUNT(*) FROM DIARY");
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 count = rs.getInt(1);
	         }
	         System.out.println(count);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (rs != null) rs.close();
	         if (pstmt != null) pstmt.close();
	         if (conn != null) conn.close();
	      }
		
		return count;
	}
	
	public static void insert(Diary diary) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("INSERT INTO DIARY (CONTENT1, CONTENT2, CONTENT3, CONTENT4, CONTENT5, DATE) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, diary.getContent1());
			pstmt.setString(2, diary.getContent2());
			pstmt.setString(3, diary.getContent3());
			pstmt.setString(4, diary.getContent4());
			pstmt.setString(5, diary.getContent5());
			pstmt.setString(6, diary.getDate());

		     pstmt.executeUpdate();
		     System.out.println("insert success!");
		} catch (Exception e) {
		     e.printStackTrace();
		} finally {
		   if (pstmt != null) pstmt.close();
		   if (conn != null) conn.close();
		}
	}
	
	public static void update(Diary diary) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			
			pstmt = conn.prepareStatement("UPDATE DIARY SET CONTENT1 = ?, CONTENT2 = ?, CONTENT3 = ?, CONTENT4 = ?, CONTENT5 = ? WHERE ID = ?");
			pstmt.setString(1, diary.getContent1());
			pstmt.setString(2, diary.getContent2());
			pstmt.setString(3, diary.getContent3());
			pstmt.setString(4, diary.getContent4());
			pstmt.setString(5, diary.getContent5());
			pstmt.setInt(6, diary.getId());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
}
