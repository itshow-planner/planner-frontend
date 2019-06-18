<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.PicDiaryDAO"%>
<html>
    <head>
        <title>delete</title>
        <meta charset="utf-8">
	</head>
	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		int index = Integer.parseInt(request.getParameter("index"));
		
		PicDiaryDAO.delete(index);
		response.sendRedirect("index2.jsp");
		%>
	</body>
</html>