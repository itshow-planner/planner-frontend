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
	
	background-image: url('img/back2.png');
	
	background-size: cover;
	background-repeat: no-repeat;
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
  request.setCharacterEncoding("utf-8");     //charset, Encoding 설정

  Class.forName("com.mysql.jdbc.Driver");    // load the drive
  String DB_URL = 
          "jdbc:mysql://localhost:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
                 // 주의 : test by changing mydb to name that you make

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
    <div id="container" style="margin-top: 68px;">
    
    <form action="delete_do.jsp" method="post">
    
        <div id="memoList" style="height: 900px; background-color: rgba(200,200,200,0.05);">
                    <h5 style="color: white; font-family: 'Nanum Gothic', sans-serif">MEMO</h5><br>
        
            <ul id="list">
<!--                 <li style="position: absolute; top: 170px; left: 33px; color: gray; font-family: 'Nanum Gothic', sans-serif; font-size: ">제목</li>
 -->               
            </ul>
           
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%>

<font color="white"><%=rs.getString(1)%> </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="delete_do.jsp?del=<%=rs.getString(1)%>" 
	style="text-decoration: none; border:1px solid #000; background-color: #3f3e3e; color: white; 
		   border-radius: 4px;    border: 1px solid #3f3e3e; width: 150px; height: 120px;" > 
	삭제</a><br>

<%
    } // end while
%>
</form>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>
        
        </div>
        </form>
       
        <!-- 글쓰기 -->
        <FORM action="memo.jsp" method="post" style="float: right;margin-top: 60px; margin-right: 80px; text-align: center;">
            <center>
                <div class="memo" style="background-color:  rgba(200,200,200,0.03); width: 500px; height: 600px;">
                    <div style="margin-top: 17px; margin-left: 20px;">제목</div>
                    <textarea name="title" id="title" placeholder="제목을 입력해 주세요." required></textarea>
                    <textarea name="content"id="content" placeholder="내용을 입력해 주세요." required></textarea>
                </div>
               <!--  <div class="memo">
                    <div style="margin-top: 17px; margin-left: 20px;">제목:</div>
                    <textarea name="title2" id="title" placeholder="제목을 입력해 주세요."></textarea>
                    <textarea name="content2" id="content" placeholder="내용을 입력해 주세요."></textarea>
                </div>
                <br>
                <div class="memo" style="margin-left: -5px; margin-top: 5px;">
                    <div style="margin-top: 17px; margin-left: 20px;">제목:</div>
                    <textarea name="title3" id="title" placeholder="제목을 입력해 주세요."></textarea>
                    <textarea name="content3" id="content" placeholder="내용을 입력해 주세요."></textarea>
                </div>
                <div class="memo">
                    <div style="margin-top: 17px; margin-left: 20px;">제목</div>
                    <textarea name="title4" id="title" placeholder="제목을 입력해 주세요."></textarea>
                    <textarea name="content4" id="content" placeholder="내용을 입력해 주세요."></textarea>
                </div> -->
                
            </center>
            <br>
               <button id="addMemo" style="margin: 20px;">추가</button>
               
            </FORM>
        </div>
    </div>
    
  

</body>
</html>