package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	public int join(User user) {
		
		try {

			String dbURL = "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "daily_planet";
			String dbPassword = "mirim12345!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String SQL = "INSERT INTO USERS VALUES (?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserPasswordChecked());
			pstmt.setString(5, user.getUserAnswer());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; 

	}
	

		public int login(String userID, String userPassword) {
			
			try {
				String dbURL = "jdbc:mysql://localhost:3306/bbs?characterEncoding=UTF-8&serverTimezone=UTC";
				String dbID = "root";
				String dbPassword = "12345";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

			} catch (Exception e) {
				e.printStackTrace();
			}

			String SQL = "SELECT userPassword FROM USERS WHERE userID = ?";

			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1;				
					}

				}else { 
					return 0; 
				}

				return -1;

			}catch(Exception e) {
				e.printStackTrace();
			}

			return -2; 
		}
}