<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.Diary"%>
<%@page import="database.DiaryDAO"%>
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
	Diary diary = new Diary();

	diary.setId(index);
	try{
		diary.setContent1(request.getParameter("content1"));
		diary.setContent2(request.getParameter("content2"));
		diary.setContent3(request.getParameter("content3"));
		diary.setContent4(request.getParameter("content4"));
		diary.setContent5(request.getParameter("content5"));
		diary.setGuide1(request.getParameter("guide1"));
		diary.setGuide2(request.getParameter("guide2"));
		diary.setGuide3(request.getParameter("guide3"));
		diary.setGuide4(request.getParameter("guide4"));
			
		DiaryDAO.update(diary);
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("update fail");
	}
	System.out.println("update success");
	response.sendRedirect("index1.jsp");
%>

<h3>Loading...</h3>
</body>
</html>