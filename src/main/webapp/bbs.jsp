<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Applicators</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
   	<style>
  		.fs-7 {
    	font-size: 0.9rem;
  	}
	</style>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
			<table class="table table-borderless text-left mt-5 mb-3">
				<tr><td class="fs-3"><b>Board</b></td></tr>
			</table>
			<table class="table table-sm text-center fs-7">
				<thead>
					<tr class="table-secondary">
						<th class="text-center bg-gray-200">번호</th>
						<th class="text-center bg-gray-200">제목</th>
						<th class="text-center bg-gray-200">글쓴이</th>
						<th class="text-center bg-gray-200">작성일</th>
						<th class="text-center bg-gray-200">조회</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td style="text-align: left;">
						  <a style="text-decoration: none; color: black; cursor: pointer;"
						  	onmouseover="this.style.textDecoration='underline'"
						    onmouseout="this.style.textDecoration='none'"
					        onclick="this.style.color='purple'"
						    href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
						    <%= list.get(i).getBbsTitle() %>
						  </a>
						</td>
						<td><%= list.get(i).getUserName() %></td>
						<td>
							<%= list.get(i).getBbsDate().substring(5, 7) + "." + list.get(i).getBbsDate().substring(8, 16) %>
						</td>
						<td><%= list.get(i).getBbsView() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="col p-0 d-flex align-items-start justify-content-start">
				<%
					if (pageNumber != 1) {
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success">이전</a>
				<%
					} if (bbsDAO.nextPage(pageNumber + 1)) {
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success">다음</a>
				<%
					}
				%>
			</div>
			<div class="col p-0 d-flex align-items-end justify-content-end">
				<a href="write.jsp" class="btn btn-primary" type="button">글쓰기</a>
			</div>
		</div>

	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>