<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DiaryDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>main list</title>
        <meta charset="UTF-8">
        <link href="./css/diary.css" rel="stylesheet" />
        </head>
    <body>
        <div class="container">	
	        <h3>일기</h3>
		    <hr width="90%">
            <img src="img/add_diary.png" id="addDiary" onclick="AddDiary()">
            <ul id="diaryList">
            <%
            	int count = DiaryDAO.count();
            	String result[];
            	
            	for(int i = 1; i <= count; i++){
            		result = DiaryDAO.select(i);
            		
           			%>
            		<li><%= i + " : " + result[5] %></li>
            		<%
            		
            	}
            %>
            </ul>
        </div>
        <script src="./js/diaryList.js"></script> 
    </body>
</html>