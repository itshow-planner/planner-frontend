<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<meta charset='utf-8' />
<%!
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	String url ="jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
	String user="daily_planet";
	String pw="mirim12345!";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pw);
		System.out.println("DB 연결 성공");
	}catch(ClassNotFoundException e1){
		System.out.println("ëë¼ì´ë² ë¡ëë¬¸ì ");
		e1.printStackTrace();
	}catch(SQLException e2){
		System.out.println("SQLException: " + e2.getMessage());
		System.out.println("SQLState: " + e2.getSQLState());
		System.out.println("VendorError: " + e2.getErrorCode());
	}
%>

<%!
	public void UpdateCal(int cnt,String title,String content){
		String UpdateCal = "update calendar set cal_title=? ,content=? where cnt="+cnt;
		try{
			pstmt = conn.prepareStatement(UpdateCal); 
			pstmt.setString(1,title);
			pstmt.setString(2,content);
			pstmt.executeUpdate(); 
			pstmt.close(); 
			conn.close();
		}catch(Exception e){
			e.getMessage();
			
		}

	}

	public void ai_setting(){
		String ai_setting = "ALTER TABLE daily_planet.calendar AUTO_INCREMENT = 1";
		String ai_setting2 = "SET @COUNT=0 UPDATE calendar SET cnt = @COUNT:=@COUNT+1";

		try{
			pstmt = conn.prepareStatement(ai_setting);
			pstmt.executeUpdate();
			/* pstmt = conn.prepareStatement(ai_setting2);
			pstmt.executeUpdate(); */
			pstmt.close(); 
			conn.close(); 
		}catch(Exception e) {
			e.getMessage();
		}
	}
	
	public void deleteCal(int cnt) {
		String deleteCal = "update from calendar set start_date=?,end_date=? where cnt = "+cnt;
		try{
			pstmt = conn.prepareStatement(deleteCal);
			pstmt.setString(1,"2001-06-12");
			pstmt.setString(2,"2001-06-12");
			pstmt.executeUpdate();
			pstmt.close(); 
			conn.close(); 
		}catch(Exception e) {
			e.getMessage();
		}
	}
	public void insertCal(String start,String end,String content,String title) {
		String insertcal = "insert into calendar (content,start_date,end_date,cal_title) value (?, ?, ?,?)";
		System.out.println("insertCal");
		try{ 
			
			pstmt = conn.prepareStatement(insertcal); 
			pstmt.setString(1,content); 
			pstmt.setString(2,start); 
			pstmt.setString(3,end);
			pstmt.setString(4,title);
			
			pstmt.executeUpdate(); 
			System.out.println("Inserting calendar Successfully!"); 
			pstmt.close(); 
			conn.close(); 
			} 
		catch (Exception e){ 
			System.out.println(e.getMessage()); 
		} 
		finally{
			System.out.println("ì°ê²°ì ë¨");
		}
	}

	public int count() {
		String count = "select * from calendar";
		int cnt =0;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(count);
			while(rs.next()){
				cnt++;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return cnt;
	}
	public String SearchData(int cnt){
		String SearchData = "select * from calendar where cnt = "+cnt;
		String contents="";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SearchData);
			while(rs.next()){
				contents = rs.getString("cal_title") +","+rs.getString("content");
			}

		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return contents;
	}

%>
