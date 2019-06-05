<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="database.Diary"%>
<%@page import="database.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	Diary diary = new Diary();
	Calendar cal = Calendar.getInstance();
	Date date = cal.getTime();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String dateStr = format.format(date); 
	
	diary.setDate(dateStr);

	try{
		diary.setContent1(request.getParameter("content1"));
		diary.setContent2(request.getParameter("content2"));
		diary.setContent3(request.getParameter("content3"));
		diary.setContent4(request.getParameter("content4"));
		diary.setContent5(request.getParameter("content5"));
			
		DiaryDAO.insert(diary);
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("insert fail");
	}
	
	response.sendRedirect("index1.jsp");
%>

<h3>Loading...</h3>

</body>
</html>