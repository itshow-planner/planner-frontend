<%@page import="database.PicDiary"%>
<%@page import="database.PicDiaryDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String bArr = request.getParameter("bArr");
		System.out.println(bArr);
		try{
			PicDiary diary = new PicDiary();
			diary.setContent(request.getParameter("content"));
			diary.setDate(request.getParameter("date"));
			diary.setImage(bArr);
			
			PicDiaryDAO.insert(diary);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("fail...");
		}
		
		response.sendRedirect("index2.jsp");
%>

</body>
</html>