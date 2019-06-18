<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

<%
 request.setCharacterEncoding("utf-8");
 String title = request.getParameter("title");
 String content = request.getParameter("content");


 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/daily_planet?characterEncoding=UTF-8&serverTimezone=UTC";
  Connection con = DriverManager.getConnection(url,"daily_planet","mirim12345!");
  Statement stat = con.createStatement();

  String query = "DELETE FROM memo where title='" + request.getParameter("del")+"'";
  //쿼리문 전송
  if(title == null || content == null){
		PrintWriter script = response.getWriter();

	  	script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
  } 
  stat.executeUpdate(query); //return 1.
  stat.close();
  con.close();
  response.sendRedirect("memolistView.jsp") ;
 }

  catch(Exception e){
  out.println( e );
 }
 %>


