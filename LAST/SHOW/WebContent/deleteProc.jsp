<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DiaryDAO"%>
<html>
    <head>
        <title>delete</title>
        <meta charset="utf-8">
	</head>
	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		int index = Integer.parseInt(request.getParameter("index"));
		
		DiaryDAO.delete(index);
		response.sendRedirect("index1.jsp");
		%>
	</body>
</html>