<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="template.jsp">
		<jsp:param value="showPicDiary.jsp" name="CONTENTPAGE"/>
	</jsp:forward>
</body>
</html>