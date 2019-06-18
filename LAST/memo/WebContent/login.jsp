<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>planner</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>

</head>
<body>

    <br><br><br>  
    <center>
    <form id="loginall" method="post" action="loginAction.jsp">
        <div>
            <div>
                <input type="text" name="userID" id="userID" placeholder=" 아이디" >
                <input type="password" name = "userPassword" id="userPassword" placeholder="&nbsp;&nbsp;비밀번호" >
            </div>
            <div>
                <input type="submit" id="loginbtn" value="로그인" required>
            </div>
            <div id="nav-find">
                <ul class='userMenu'>
                    <li class="find">
                        <a href='#'>아이디 찾기</a>
                        <span id='line'>|</span>
                    </li>
                    <li class="find">
                        <a href='#'>&nbsp;비밀번호 찾기</a>
                        <span id='line'>|</span>
                    </li>
                    <li class="find">
                        <a href='join.jsp'>&nbsp;회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
    </center>

 </body>
</html>