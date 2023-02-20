<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhone" />
<jsp:setProperty name="user" property="userGender" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Applicators</title>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		if (user.getUserEmail() == null || user.getUserPassword() == null || user.getUserID() == null || 
		user.getUserName() == null || user.getUserPhone() == null || user.getUserGender() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않은 정보가 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('E-mail, ID 또는 연락처 정보가 중복되었습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>