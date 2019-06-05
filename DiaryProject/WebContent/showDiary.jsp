<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.Diary"%>
<%@page import="database.DiaryDAO"%>
<html>
    <head>
        <title>main list</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/diary.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    </head>
    <body>
	    <%
	    	request.setCharacterEncoding("UTF-8");
	    	int index = Integer.parseInt(request.getParameter("index"));
	    	String result[];
	    	result = DiaryDAO.select(index);
	    	String content1 = null, content2 = null, content3 = null, content4 = null, content5 = null, date = null;
	    	
    		content1 = result[0];
    		content2 = result[1];
    		content3 = result[2];
    		content4 = result[3];
    		content5 = result[4];
    		date = result[5];
	    %>
         <div class="container">
            <div class="parent">
                <ul class="tabs">
                    <li ondragstart="return false" onselectstart="return false">
                        <a href="#tab1">basic</a>
                    </li>
                    <li ondragstart="return false" onselectstart="return false">
                        <a href="#tab2">special</a>
                    </li>
                </ul>
            </div>
            <div class="tab_container">
                <div id="tab1" class="tab_content">          
                    <div class="parent">
                        <img src="img/diary.png" id="addImg" ondragstart="return false" onselectstart="return false">
                        <div id="content" class="son1">
                            <textarea id="diaryArea" disabled><%= content1 %></textarea>
                        </div>
                        <div class="son3 today"><%= date %></div>
                    </div>
                </div>
                <div id="tab2" class="tab_content">
                    <div class="parent">
                        <img src="img/diary.png" id="addImg">
                        <div class="son1">칭찬할 점 3가지</div>
                        <div class="son2">
                            <textarea id="diarySpeArea" disabled><%= content2 %></textarea>
                        </div>
                        <div class="son4">반성할 점 3가지</div>
                        <div class="son5">
                            <textarea id="diarySpeArea" disabled><%= content3 %></textarea>
                        </div>
                        <div class="son6">가장 좋았던 일 3가지</div>
                        <div class="son7">
                            <textarea id="diarySpeArea" disabled><%= content4 %></textarea>
                        </div>
                        <div class="son8">감사할 점 3가지</div>
                        <div class="son9">
                            <textarea id="diarySpeArea" disabled><%= content5 %></textarea>
                        </div>
                        <div class="son3 today"><%= date %></div>
                    </div>
                </div>
            </div>
      	 <script type="text/javascript" src="js/tabSwitching.js"></script>
    </body>
</html>