<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>add pic diary</title>
		<meta charset="UTF-8">
		
	    <link rel="stylesheet" href="css/picDiary.css">
	</head>
    <body>
         <form method="post" action="addPicDiaryProc.jsp">
            <div class="container">
                <div class="parent">
                    <img src="img/diary.png" id="addImg">
                    <div id="content" class="son1">
                        <canvas id="canvas"></canvas>
                    </div>
                    <div class="son2">
                        <textarea cols="10" name="content"></textarea>
                    </div>
                    <input type="text" class="son3" id="date" name="date" value="date" readonly>
                </div>
                <input type="submit" value="완성" id="submit">
            </div>
            <input type="text" id="bArr" name="bArr" value="asdf">
        </form>
        <div id="toolbar">
            <ul id="canvasToolBar">
                <li><img src="img/brush.png" id="brush"></li>
                <li><img src="img/eraser.png" id="eraser"></li>
                <li><img src="img/plus.png" id="plus"></li>
                <li><img src="img/minus.png" id="minus"></li>
                <li><input type="color" id="colorpicker" value="#000000"></li>
            </ul>
        </div>
        <script src="js/canvas.js"></script>
    </body>
</html>