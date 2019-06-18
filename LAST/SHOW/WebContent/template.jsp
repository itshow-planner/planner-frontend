<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" rel="stylesheet" type="text/css">

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>

<table width="100%">
<tr>
	<td >
		<jsp:include page="top.jsp" flush="false" /> 	
	</td>
</tr>

<tr>	
	<td >
		<jsp:include page="<%= contentPage %>" flush="false"/>
	</td>
</tr>

</table>
</body>
</html>