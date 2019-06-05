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
	private static String DB_URL = "jdbc:mysql://10.96.124.88:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC"; //접속할 DB 서버
	private static String USER_NAME = "root"; //DB에 접속할 사용자 이름을 상수로 정의
	private static String PASSWORD = "1234"; //사용자의 비밀번호를 상수로 정의
	
	public static int count() throws SQLException{
		PreparedStatement pstmt = null;
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
	         System.out.println(rs);
	         if(rs.next()) {
	        	result = new String[3];
		        result[0]= rs.getString("content"); 
		        result[1] = rs.getString("date"); 
		        result[2] = rs.getString("image"); 
	        	 
	        }
	         
//	         Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery("SELECT * FROM DIARYDB");
//				if (rs.next()) {
//					// 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
//					InputStream in = rs.getBinaryStream("bfile");
//					// BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
//					BufferedImage bimg = ImageIO.read(in);
//					in.close();
//
//					ServletOutputStream sos = response.getOutputStream();
//
//					ImageIO.write(bimg, "jpeg", sos); 
//				}
	         
        	 
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
		ResultSet rs = null;
		
//		byte[] binArr = diary.getImage();
		
//		ByteArrayOutputStream bout = new ByteArrayOutputStream();
//		for(int i = 0; i < binArr.length; i++) {
//			bout.write(binArr[i]);
//		}
//		
//		byte[] imageData = bout.toByteArray();
		
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
		} //finally {
//		   if (pstmt != null) pstmt.close();
////		   if (conn != null) conn.close();
//		}
	}
	
	public static void update(PicDiary diary) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
				Class.forName("com.mysql.jdbc.Driver");	
				conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
				pstmt = conn.prepareStatement("UPDATE PIC_DIARY SET CONTENT = ? IMAGE = ? WHERE ID = ?");
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
