<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.PicDiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>main list</title>
        <meta charset="UTF-8">
        <link href=".\css\picDiary.css" rel="stylesheet" />
        </head>
    <body>
        <div class="container">
	        <h3>그림일기</h3>
		    <hr width="90%">
            <img src="img/add_diary.png" id="addDiary" onclick="AddDiary()">
            <ul id="diaryList">
            <%
            	int count = PicDiaryDAO.count();
            	String result[];
            	
            	for(int i = 1; i <= count; i++){
            		result = PicDiaryDAO.select(i);
            		
           			%>
            		<li><%=result[1] %></li>
            		<%
            		
            	}
            %>
            </ul>
        </div>
        <script src="./js/picDiaryList.js"></script> 
    </body>
</html>