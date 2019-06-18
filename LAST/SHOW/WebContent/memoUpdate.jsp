<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
     import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>memo list</title>
<style type="text/css">
body{
	
	background-image: url('img/memo.png');
	background-size : 1540px 1050px;
	background-repeat: no-repeat;
} 
a{
	color: white;
	
}
</style>
<link rel="stylesheet" href="css/memo.css">
    <link rel="stylesheet" href="css/use.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
    <script src="js/memojquery.js"></script>
</head>
<body>

    
    
    <%

  response.setContentType("text/html;charset=utf-8;");
  request.setCharacterEncoding("utf-8");    

  Class.forName("com.mysql.jdbc.Driver");    
  String DB_URL = 
          "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
         
  String DB_USER = "daily_planet";
  String DB_PASSWORD= "mirim12345!";

  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;

  try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = conn.createStatement();

      String query = "SELECT title, content FROM memo";
      rs = stmt.executeQuery(query);
 %>
    <!-- 리스트 -->
    
           
<%
    if(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%>

  <FORM action="memo.jsp" method="post" style="margin-top: 130px; margin-right:100px; text-align: center;">
            <center>
            <div class="memo" style="text-align: center; margin: 10px; background-color: rgba(200,200,200,0.05); width: 1300px; height: 50px; color: white;" >MEMO</div><br><br>
                <div class="memo" style="background-color:  rgba(200,200,200,0.03); width: 1300px; height: 550px;">
                	
                    <textarea name="title" id="title" placeholder="제목을 입력해 주세요." required></textarea>
                    <textarea name="content"id="content" placeholder="내용을 입력해 주세요." required></textarea>
                </div>

            </center>
            <br>
            
	삭제</a><br>
	               <button style=" margin: 10px;width: 180px; height: 45px; border: 1px solid #3f3e3e; border-radius: 4px; background-color: #3f3e3e; color: white;" onclick="location.href='memolistView.jsp'">목록</button> 
	
               <!--<button style="margin: 10px; width: 180px; height: 45px; border: 1px solid #3f3e3e; border-radius: 4px; background-color: #3f3e3e; color: white;">수정</button>   -->
               <button style="margin: 10px; width: 180px; height: 45px; border: 1px solid #3f3e3e; border-radius: 4px; background-color: #3f3e3e; color: white;"> <a href="delete_do.jsp?del=<%=rs.getString(1)%>">  삭제</a><br></button> 
               
             </div>
            </FORM> 
            
  
<%
    } 
%>

<%
  rs.close();        
  stmt.close();  
  conn.close();    
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>
 
</body>
</html>