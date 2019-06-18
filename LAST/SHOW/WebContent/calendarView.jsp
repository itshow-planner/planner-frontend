<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="calendarDAO.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	/* int count = count();
	if(cnt>count){
		cnt = cnt%count+1;
	} */
	int count=count();
	cnt = (cnt%count)+1;
	String content = SearchData(cnt+1);
	

	
	String[] c = content.split(",");

%>
<script>

	 location.href="calendar.jsp?title="+encodeURI("<%=c[0]%>"  , "UTF-8")+"&content="+encodeURI("<%=c[1]%>"  , "UTF-8")+"&cnt=<%=cnt%>"; 
</script>

</body>
</html>
