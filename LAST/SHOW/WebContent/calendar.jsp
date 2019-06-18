<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="calendarDAO.jsp"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />

<style>
body{
	background-image: url('img/back.png');
	background-size: cover;
	background-repeat: no-repeat;
}
td.fc-event-container{
	background-color:#898999;
	border-radius: 25px;
	margin:20px;	
}
div>span{
	color:black;
}


</style>
  <link rel='stylesheet' href='css/calendar_core_main.css'/>
  <link rel='stylesheet' href='css/calendar_daygrid_main.css'/>
  <link rel='stylesheet' href='css/calnder.css'/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"crossorigin="anonymous">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="css/style2.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
    
  <script src='js/calendar_core_main.js'></script>
  <script src='js/calendar_daygrid_main.js'></script>
  <script src='js/calendar_interaction_main.js'></script>
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
   

  <script>
  
 	<%
 	request.setCharacterEncoding("utf-8");
 	
 	
	String cnt2 = request.getParameter("cnt");
 	String title = request.getParameter("title");
 	String content = request.getParameter("content");
 	System.out.println(title+" "+content);
 	
 	if(title!=null){
 	%>
 	
 	$(function () {
 		$(window).load(function() {
        $("#dia_conent").dialog({
          title: "일정 확인하기",
          width: 800,
          modal: true,
        });
      });
    });
 		<%
 	}
 	%>
    var cal_title = new Array();
    var cal_start = new Array();
    var cal_end = new Array();
    var cal_num = 0;

    var ToDay = new Date();
    var y = new Date(ToDay.getFullYear(), ToDay.getMonth(), ToDay.getDate())
    y.getFullYear() + "-" + (y.getMonth() + 1 < 10 ? "0" + (y.getMonth() + 1) : y.getMonth() + 1) + "-" + (y.getDate() < 10 ? "0" + y.getDate() : y.getDate())

    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid'],
        header: {
        	
          left: 'prevYear,prev,next,nextYear today',
          center: 'title',
          right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        defaultDate: y,
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
          
        	  /* title:'Test',
				start: '2019-05-01',
				end: '2019-05-03' */
        	  <%
        	  
        	
        	String c_t;
          	String select_title = "select * from calendar";
          	
          	try{
          		pstmt = conn.prepareStatement(select_title);
          		rs = pstmt.executeQuery();
          		while(rs.next()){
          			
          			if(rs.getInt("cnt")!=1){
          			%>
          			,
          			<%
          			}
          			%>
          			{
          				title:'<%=rs.getString("cal_title")%>',
          				start: '<%=rs.getString("start_date")%>',
          				end:'<%=rs.getString("end_date")%>'
          			}
          			<%
          		}
          	}catch(Exception e) {
          		
          	}
          	%> 
          
        ]
      });

      calendar.render();
    });

    $(function () {
    	$("#btn").click(function () {
        $("#dia_rs").dialog({
          title: "일정 추가하기",
          width: 800,
          modal: true,
        });
      });
    	
    	$(".modify").click(function() {
    		$(".h1").css("display","inline-block");
    		$(".h2").css("display","inline-block");
    		$(".h3").css("display","inline-block");
    		$(".modify").css("display","none");
    		$(".s1").css("display","none");
    		$(".s2").css("display","none");
    	});
    });

	
  </script>
  <style>
  .fc-content{
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}

.fc-content:hover{
	overflow:visible;
	color:white;
}
    body {
      margin-top:90px;
      padding: 0;
      color:white;

    }

    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }
  </style>
</head>

<body style="background-color:#141433;">
<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-bright" id = "navbar">
        <a class="navbar-brand" href="main.jsp">
            <img src="<%= request.getContextPath() %>/img/logo1.png" style="background: rgba(0, 0, 0, 0)">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="index_calendar.jsp">CALENDER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index2.jsp">PICTURE DIARY</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index1.jsp">DIARY</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="memolistView.jsp">NOTEPAD</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" id="login" href="loginView.jsp">LOGIN</a>
                </li>
            </ul>
        </div>
    </nav>
  <div id='calendar' style="position:absolute;margin-left: auto;margin-right: auto;left: 0;right: 0;"></div>
  <img src="img/add_cal.png" style="width:260px;height:200px;position:absolute;top:250px" id="btn">
  <div style="position:absolute;color:white;top:500px;left:20px"> 행성을 눌러서<br> 일정을 추가하세요 !</div>

  
  <div id="dia_conent" style="display:none">
	<form action="calendarUpdate.jsp" method="post">
	<input type="hidden" name="cnt" value="<%=cnt2 %>">
	제목 : <span class="s1"><%=title %></span><input name="title" type="text" value="<%=title %>" class="h1" style="display:none"><br>
         내용 : <span class="s2"><%=content %></span><input name="content" type="text" value="<%=content %>" class="h2" style="display:none"><br>
    <button type="submit" class="h3" style="display:none">일정 수정하기</button>
	</form>
	<button class="modify">일정 수정하기</button>
	<button onclick="delete_date(<%=cnt2%>)">일정 삭제</button>
 </div>
 
  <div id="dia_rs" style="display:none">
    <form style="display: hidden" action="calendarProc.jsp" method="post">
      start :
      <input type="date" name="start" >
      <br> end :
      <input type="date" name="end">
      <br> title :
      <input type="text" name="title">
      <br> content : 
      <input type="text" name="content">
      <br>
      <button type="submit" >일정 추가하기</button>
    </form>
  </div>

</body>
<script>
function content_click(test){
	//window.open("calendarView.jsp?cnt="+document.getElementById(test.getAttribute('id')).getAttribute('id') , "newWindow", "width=300, height=400, scrollbars=no,toolbar=no,location=no,status=no,fullscreen=no");
	location.href = "calendarView.jsp?cnt="+document.getElementById(test.getAttribute('id')).getAttribute('id');
}
function delete_date(a) {
	location.href="calendarDelete.jsp?cnt="+a;
}
</script>
</html>