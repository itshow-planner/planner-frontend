<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <title>main list</title>
        <link rel="stylesheet" href="./css/diary.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    </head>
    <body>
        <form method="POST" action="addDiaryProc.jsp">
            <div class="container">
                <div class="parent">
                    <ul class="tabs">
                        <li>
                            <a href="#tab1">basic</a>
                        </li>
                        <li>
                            <a href="#tab2">special</a>
                        </li>
                    </ul>
                </div>
                <div class="tab_container">
                    <div id="tab1" class="tab_content">          
                        <div class="parent">
                            <img src="img/diary.png" id="addImg">
                            <div id="content" class="son1">
                                <textarea id="diaryArea" onkeypress="Check_basic()" name="content1" required></textarea>
                            </div>
                            <div class="son3 today">date</div>
                        </div>
                    </div>
                    <div id="tab2" class="tab_content">
                        <div class="parent">
                            <img src="img/diary.png" id="addImg">
                            <div class="son1">칭찬할 점 3가지</div>
                            <div class="son2">
                                <textarea id="diarySpeArea" class="limit3" onkeypress="Check(0)" name="content2"></textarea>
                            </div>
                            <div class="son4">반성할 점 3가지</div>
                            <div class="son5">
                                <textarea id="diarySpeArea" class="limit3" onkeypress="Check(1)" name="content3"></textarea>
                            </div>
                            <div class="son6">가장 좋았던 일 3가지</div>
                            <div class="son7">
                                <textarea id="diarySpeArea" class="limit3" onkeypress="Check(2)" name="content4"></textarea>
                            </div>
                            <div class="son8">감사할 점 3가지</div>
                            <div class="son9">
                                <textarea id="diarySpeArea" class="limit3" onkeypress="Check(3)" name="content5"> </textarea>
                            </div>
                            <div class="son3 today">date</div>
                        </div>
                    </div>
                <input type="submit" value="완성" id="submit">
            	</div>
            </div>
        </form>
        <script src="./js/addDiary.js"></script>
        <script src="./js/tabSwitching.js"></script>
    </body>
</html>