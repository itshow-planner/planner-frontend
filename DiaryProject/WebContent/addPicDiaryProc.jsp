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
		try{
			PicDiary diary = new PicDiary();
			diary.setContent(request.getParameter("content"));
			diary.setDate(request.getParameter("date"));
			
			String[] parts = bArr.split(",");
			String imageString = parts[1];
			diary.setImage(PicDiaryDAO.encodeToString(PicDiaryDAO.decodeToImage(imageString), "jpg"));
			
			PicDiaryDAO.insert(diary);
			String result[];
			result = PicDiaryDAO.select(diary.getId());
			
			%>
			<img src="data:image/jpg;base64, <%=result[2]%>" alt="god damn" />
			<%
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("fail...");
		}
		response.sendRedirect("index2.jsp");
%>

<h3>Loading...</h3>

	

</body>
</html>