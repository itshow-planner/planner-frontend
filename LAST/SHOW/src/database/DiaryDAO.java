package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiaryDAO {
	
	private static Connection conn; // connection:db에접근하게 해주는 객체
	private static String DB_URL = "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC"; //접속할 DB 서버
	private static String USER_NAME = "daily_planet"; //DB에 접속할 사용자 이름을 상수로 정의
	private static String PASSWORD = "mirim12345!"; //사용자의 비밀번호를 상수로 정의
	
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
	        	 result = new String[10];
		         result[0]= rs.getString("content1");  
		         result[1] = rs.getString("content2"); 
		         result[2] = rs.getString("content3"); 
		         result[3] = rs.getString("content4");
		         result[4] = rs.getString("content5");
		         result[5] = rs.getString("date");
		         result[6] = rs.getString("guide1");
		         result[7] = rs.getString("guide2");
		         result[8] = rs.getString("guide3");
		         result[9] = rs.getString("guide4");
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
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("INSERT INTO DIARY (CONTENT1, CONTENT2, CONTENT3, CONTENT4, CONTENT5, DATE, GUIDE1, GUIDE2, GUIDE3, GUIDE4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, diary.getContent1());
			pstmt.setString(2, diary.getContent2());
			pstmt.setString(3, diary.getContent3());
			pstmt.setString(4, diary.getContent4());
			pstmt.setString(5, diary.getContent5());
			pstmt.setString(6, diary.getDate());
			pstmt.setString(7, diary.getGuide1());
			pstmt.setString(8, diary.getGuide2());
			pstmt.setString(9, diary.getGuide3());
			pstmt.setString(10, diary.getGuide4());

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
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("UPDATE DIARY SET CONTENT1 = ?, CONTENT2 = ?, CONTENT3 = ?, CONTENT4 = ?, CONTENT5 = ?, GUIDE1 = ?, GUIDE2 = ?, GUIDE3 = ?, GUIDE4 = ? WHERE ID = ?");
			pstmt.setString(1, diary.getContent1());
			pstmt.setString(2, diary.getContent2());
			pstmt.setString(3, diary.getContent3());
			pstmt.setString(4, diary.getContent4());
			pstmt.setString(5, diary.getContent5());
			pstmt.setString(6, diary.getGuide1());
			pstmt.setString(7, diary.getGuide2());
			pstmt.setString(8, diary.getGuide3());
			pstmt.setString(9, diary.getGuide4());
			pstmt.setInt(10, diary.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public static void delete(int id) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		int count = count();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("DELETE FROM DIARY WHERE ID = ?");	
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt1 = conn.prepareStatement("ALTER TABLE DIARY AUTO_INCREMENT=1");
			pstmt1.executeUpdate();
			pstmt1 = conn.prepareStatement("SET @CNT = 0");
			pstmt1.executeUpdate();
			pstmt1 = conn.prepareStatement("UPDATE DIARY SET DIARY.ID = @CNT:=@CNT+1");
			pstmt1.executeUpdate();
			pstmt2 = conn.prepareStatement("ALTER TABLE DIARY auto_increment = ?");
			pstmt2.setInt(1, count-1);
			pstmt2.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
}
