package proc;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("")
public class AddPicDiaryProc extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String content1 = request.getParameter("content1");
		String date = request.getParameter("date");
		String bArr = request.getParameter("bArr");
		String binArr[] = bArr.split(",");

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(db_url, "daily_planet", "mirim12345!");

			pstmt = conn.prepareStatement("INSERT INTO DIARYDB (STATUS, CONTENT1, IMAGE, TODAY ) VALUES (?, ?, ?, ?)");

//			String path = getServletContext().getRealPath("/images/google_logo.png");
//			FileInputStream fin = new FileInputStream(path);
//
//			byte[] buf = new byte[1024];
//			int read = 0;
//			while ((read = fin.read(buf, 0, buf.length)) != -1) {
//				bout.write(buf, 0, read);
//			}
//			fin.close();
			
			ByteArrayOutputStream bout = new ByteArrayOutputStream();
			for(int i = 0; i < binArr.length; i++) {
				bout.write(Integer.parseInt(binArr[i]));
			}
			
			byte[] imageData = bout.toByteArray();

			// byte배열을 DB에 저장한다
			pstmt.setInt(1, 3);
			pstmt.setString(2, content1);
			pstmt.setBytes(3, imageData);
			pstmt.setString(4, date);
			pstmt.executeUpdate();
			pstmt.close();

			// DB에 저장된 이미지를 가져와서 웹브라우저에 출력하는 예
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM DIARYDB");
			if (rs.next()) {
				// 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
				InputStream in = rs.getBinaryStream("bfile");
				// BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
				BufferedImage bimg = ImageIO.read(in);
				in.close();

				ServletOutputStream sos = response.getOutputStream();

				ImageIO.write(bimg, "jpeg", sos);
			}
			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.err.println(e);
		}
	}
}