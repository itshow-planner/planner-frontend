package database;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.*;

import javax.imageio.ImageIO;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class PicDiaryDAO {
	
	private static Connection conn; // connection:db에접근하게 해주는 객체
	private static String DB_URL = "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC"; //접속할 DB 서버
	private static String USER_NAME = "daily_planet"; //DB에 접속할 사용자 이름을 상수로 정의
	private static String PASSWORD = "mirim12345!"; //사용자의 비밀번호를 상수로 정의
	
	public static int count() throws SQLException{
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			 pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PIC_DIARY");
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
	
	public static String[] select(int id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result[] = null;
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");	
			 conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			 pstmt = conn.prepareStatement("SELECT * FROM PIC_DIARY WHERE ID = ?");
	         // 값을 바인딩
	         pstmt.setInt(1, id);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	result = new String[3];
		        result[0]= rs.getString("content"); 
		        result[1] = rs.getString("date"); 
		        result[2] = rs.getString("image"); 
	        }
        	 
	    } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (rs != null) rs.close();
	         if (pstmt != null) pstmt.close();
	         if (conn != null) conn.close();
	      }
	    
		return result;
	}
	
	public static void insert(PicDiary diary) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("INSERT INTO PIC_DIARY (CONTENT, DATE, IMAGE) VALUES (?, ?, ?)");
			pstmt.setString(1, diary.getContent());
			pstmt.setString(2, diary.getDate());
			pstmt.setString(3, diary.getImage());
 
			pstmt.executeUpdate();
			System.out.println("success!");
		} catch (Exception e) {
		     e.printStackTrace();
		} finally {
	    if (pstmt != null) pstmt.close();
		   if (conn != null) conn.close();
		}
	}
	
	public static void update(PicDiary diary) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			pstmt = conn.prepareStatement("UPDATE PIC_DIARY SET CONTENT = ?, IMAGE = ? WHERE ID = ?");
			pstmt.setString(1, diary.getContent());
			pstmt.setString(2, diary.getImage());
			pstmt.setInt(3, diary.getId());
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
			pstmt = conn.prepareStatement("DELETE FROM PIC_DIARY WHERE ID = ?");	
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt1 = conn.prepareStatement("ALTER TABLE PIC_DIARY AUTO_INCREMENT=1");
			pstmt1.executeUpdate();
			pstmt1 = conn.prepareStatement("SET @CNT = 0");
			pstmt1.executeUpdate();
			pstmt1 = conn.prepareStatement("UPDATE PIC_DIARY SET PIC_DIARY.ID = @CNT:=@CNT+1");
			pstmt1.executeUpdate();
			pstmt2 = conn.prepareStatement("ALTER TABLE PIC_DIARY auto_increment = ?");
			pstmt2.setInt(1, count-1);
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public static String encodeToString(BufferedImage image, String type) {
	    String imageString = null;
	    ByteArrayOutputStream bos = new ByteArrayOutputStream();

	    try {
	        ImageIO.write(image, type, bos);
	        byte[] imageBytes = bos.toByteArray();

	        BASE64Encoder encoder = new BASE64Encoder();
	        imageString = encoder.encode(imageBytes);

	        bos.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return imageString;
	}
	
	public static BufferedImage decodeToImage(String imageString) {

	    BufferedImage image = null;
	    byte[] imageByte;
	    try {
	        BASE64Decoder decoder = new BASE64Decoder();
	        imageByte = decoder.decodeBuffer(imageString);
	        ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
	        image = ImageIO.read(bis);
	        bis.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return image;
	}

}
