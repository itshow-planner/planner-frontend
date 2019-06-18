	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.PicDiary"%>
<%@page import="database.PicDiaryDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int index = Integer.parseInt(request.getParameter("index"));	
	PicDiary diary = new PicDiary();
	
	diary.setId(index);
	String bArr = request.getParameter("bArr");
	try{
		diary.setContent(request.getParameter("content"));
		
		diary.setImage(bArr);
		
		PicDiaryDAO.update(diary);
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("fail...");
	}
	response.sendRedirect("index2.jsp");
%>
</body>
</html>