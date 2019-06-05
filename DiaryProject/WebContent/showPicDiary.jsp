<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="database.PicDiary"%>
<%@page import="database.PicDiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show diary</title>
<link rel="stylesheet" href="/css/picDiary.css">

</head>
<body>
>
	<% 
		request.setCharacterEncoding("UTF-8");
		int index = Integer.parseInt(request.getParameter("index"));
		String result[];
		result = PicDiaryDAO.select(index);
		
	
	%>
	<div class="container">
		<div class="parent">
			<img src="img/diary.png" id="addImg">
			<div class="son1">
				<img src="data:image/jpg;base64, <%=result[2]%>" alt="image" />
			</div>
			<div class="son2">
				<textarea cols="10" disabled><%= result[0] %></textarea>
			</div>
		</div>
	</div>
</body>
</html>