<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
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
	</style>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
			<table class="table table-borderless text-left mt-5 mb-3">
				<tr><td class="fs-3"><b>Board</b></td></tr>
			</table>
			<form method="post" action="writeAction.jsp">
				<table class="table table-borderless text-left">
					<thead>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목을 입력해 주세요." name="bbsTitle" maxlength="50"></td>
						</tr>
					</thead>
					<tbody>
						<tr class="fs-7">
							<td>※ 게시글은 최대 10,000 Bytes 까지 작성할 수 있습니다.</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용을 입력해 주세요." name="bbsContent" maxlength="10000" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="p-0 d-flex align-items-end justify-content-end">
					<a href="bbs.jsp" class="ms-2 btn btn-primary" type="button">취소</a>
					<input type="submit" class="ms-auto me-2 btn btn-primary" type="button" value="등록">
				</div>
			</form>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>