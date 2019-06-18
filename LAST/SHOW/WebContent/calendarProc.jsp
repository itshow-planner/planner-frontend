<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="calendarDAO.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(end);
	date.setDate(date.getDate()+1);
	
	end = new SimpleDateFormat("yyyy-MM-dd").format(date);
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	
	System.out.println(end);
	System.out.println(start+" "+end+" "+content);
	insertCal(start,end,content,title); 
	
%>
<jsp:forward page="calendar.jsp"></jsp:forward>
</body>
</html>