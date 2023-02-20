<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Applicators</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
   	<style>
  		.fs-7 {
    		font-size: 0.85rem;
  		}
  		
	  	.narrow {
	    	width: 60px;
	  	}	
	</style>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<nav class="pb-3 mb-4 navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Applicator</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" aria-current="page" href="main.jsp">Main</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="bbs.jsp">Board</a>
		        </li>
		        <%
		        	if (userID == null) {
		        %>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
		          data-bs-toggle="dropdown" aria-expanded="false">
		            Connect
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		          	<li><a class="dropdown-item" href="login.jsp">Login</a></li>
		            <li><a class="dropdown-item" href="join.jsp">Join</a></li>
		          </ul>
		        </li>
		        <%
		        	} else {
		        %>
   		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
		          data-bs-toggle="dropdown" aria-expanded="false">
		            My Account
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="logoutAction.jsp">Logout</a></li>
		          </ul>
		        </li>
		        <%		
		        	}
		        %>
		      </ul>
			</div>
		</div>
	</nav>

	
	<div class="container">
		<div class="row">
			<table class="table text-left mt-5 mb-3">
				<tr style="border-bottom: 3px solid #252525;"><td class="fs-3"><b>Board</b></td></tr>
			</table>
			<table class="table table-borderless">
				<thead>
					<tr>
						<td colspan="2" style="font-size: 1.1rem; font-weight: 600"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr class="pb-3 fs-7" style="border-bottom: 1px solid lightgrey;">
						<td class="text-center narrow"><%= bbs.getUserName() %></td>
						<td class="text-left">│ㅤ<%= bbs.getBbsDate().substring(0, 4) + "." + bbs.getBbsDate().substring(5, 7) + "." + bbs.getBbsDate().substring(8, 16) %></td>
						<td class="narrow">조회 <%= bbs.getBbsView() %></td>
					</tr>
				</thead>
				<tbody>
					<tr style="border-bottom: 3px solid #252525;">
						<td colspan="3" style="height: 100px; text-align: justify"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
				<%
					if (userID != null && userID.equals(bbs.getUserID())) {
				%>
						<a href="bbs.jsp" class="btn btn-primary">목록</a>
						<a href="update.jsp?bbsID=<%= bbsID %>" class="ms-auto me-2 btn btn-secondary">수정</a>
						<a onclick="return confirm('게시물을 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="me-2 btn btn-secondary">삭제</a>
						<a href="write.jsp" class="btn btn-primary">글쓰기</a>
				<%
					} else {
				%>
						<a href="bbs.jsp" class="btn btn-primary">목록</a>
						<a href="write.jsp" class="btn btn-primary">글쓰기</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>