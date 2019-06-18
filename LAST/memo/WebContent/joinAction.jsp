<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>

<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userPasswordChecked" /> 
<jsp:setProperty name="user" property="userAnswer" /> 
<%
  UserDAO userdao = new UserDAO();
 userdao.join(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%

		if (user.getUserName() == null || user.getUserID() == null || user.getUserPassword() == null || user.getUserPasswordChecked() == null || user.getUserAnswer() == null)

			 {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				UserDAO userDAO = new UserDAO(); 
				int result = userDAO.login(user.getUserID(), user.getUserPassword());

				if(result == -1){ 

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}

				//가입성공

				else {

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원가입 성공하셨습니다.')");
					script.println("location.href = 'loginView.jsp'");
					script.println("</script>");
				}
			}

			%>
</body>
</body>
</html>
