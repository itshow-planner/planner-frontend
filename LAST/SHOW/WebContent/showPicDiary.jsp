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
	<link rel="stylesheet" href="css/picDiary.css">
	<link rel="stylesheet" href="./css/background.css">
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		int index = Integer.parseInt(request.getParameter("index"));
		String result[];
		result = PicDiaryDAO.select(index);
		String imageUrl = null, content = null, date = null;
		
		content = result[0];
		date = result[1];
		imageUrl = result[2];
	%>
	<div class="container">
		<div class="parent">
		<img src="img/diary.png" id="addImg" ondragstart="return false" onselectstart="return false">
			<div class="son1">
				<img src="<%=imageUrl%>" style="background-color: white"/>
			</div>
			<div class="son2">
				<textarea cols="10" disabled><%= content %></textarea>
			</div>
			<div class="son3 today"><%= date %></div>
		</div>
		<input type="text" id="index" name="index" value="<%= index %>">
		<div id="btnList">
			<input type="button" id="update" value="수정" onclick="showUpdate();"> 
	         <input type="button" id="delete" value="삭제" onclick="deleteFunc();"> 
		</div>
	</div>
	<script src="./js/showPicDiary.js"></script>
</body>
</html>