<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.PicDiary"%>
<%@page import="database.PicDiaryDAO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	<form method="post" action="updatePicDiaryProc.jsp">
	    <div class="container">
	        <div class="parent">
	         <img src="img/diary.png" id="addImg" ondragstart="return false" onselectstart="return false">
	            <div id="content" class="son1">
	                <canvas id="canvas"></canvas>
	            </div>
	            <div class="son2">
	                <textarea cols="10" name="content"><%= content %></textarea>
	            </div>
	            <div class="son3 today"><%= date %></div>
	        </div>
	    </div>
	    <input type="text" id="bArr" name="bArr" value="asdf">
	    <input type="text" id="index" name="index" value="<%= index %>">
	</form>
	<div id="sideMenu">
        <div id="colorpicker"></div>
        <ul id="toolBar">
            <li><img src="img/brushIcon.png" id="brush"></li>
            <li><img src="img/eraserIcon.png" id="eraser"></li>
            <li><img src="img/plus.png" id="plus"></li>
            <li><img src="img/minus.png" id="minus"></li>
            <li><input type="color" id="color" value="#000000" onchange="ChangeColor()"></li>
        </ul>
        <input type="submit" value="완성" id="submit" onclick="saveImage()">
   	</div>
	<input type="text" id="date" style="visibility: hidden" value="date">
	<script src="js/canvas.js"></script>
</body>
</html>