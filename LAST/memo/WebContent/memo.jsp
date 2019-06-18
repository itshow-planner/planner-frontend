<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

<%
 request.setCharacterEncoding("utf-8"); 
 String title  =        request.getParameter("title");            
 String content =   request.getParameter("content");


 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://10.96.123.171:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
  Connection con = DriverManager.getConnection(url,"daily_planet","mirim12345!");
  Statement stat = con.createStatement();

  String query = "INSERT INTO memo(title, content)  VALUES('"+title+"','"+content+"')";
//INSERT into member(id,name,pwd,email) VALUES ('id','name','pwd','email') 쿼리문
  stat.executeUpdate(query);
  stat.close();
  con.close();
 }
 catch(Exception e){
  out.println( e );
 }
 response.sendRedirect("memolistView.jsp"); 
%>

