<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");
		String contentPage = request.getParameter("CONTENTPAGE");
	%>
	<table width="100%" height="600">
		<tr>
			<td>
				<jsp:include page="top.jsp"/>
			</td>	
		</tr>
		<tr>	
			<td valign="top">
				<jsp:include page="<%= contentPage %>"/>
			</td>	
		</tr>
	</table>
</body>
</html>