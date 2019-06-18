<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>add pic diary</title>
		<meta charset="UTF-8">
		
	    <link rel="stylesheet" href="css/picDiary.css">
	    <link rel="stylesheet" href="./css/background.css">
	</head>
    <body>
         <form method="post" action="addPicDiaryProc.jsp">
            <div class="container">
                <div class="parent">
                 <img src="img/diary.png" id="addImg" ondragstart="return false" onselectstart="return false">
                    <div id="content" class="son1">
                        <canvas id="canvas"></canvas>
                    </div>
                    <div class="son2">
                        <textarea cols="10" name="content"></textarea>
                    </div>
                    <input type="text" class="son3" id="date" name="date" value="date" readonly>
                </div>
                
            </div>
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
            <input type="text" id="bArr" name="bArr" value="asdf">
        </form>
        <script src="js/canvas.js"></script>
    </body>
</html>